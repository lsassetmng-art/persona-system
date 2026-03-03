-- ============================================================
-- 79 Delivery Worker DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed.

-- ------------------------------------------------------------
-- 0) dispatch controls (expects integration.system_control exists)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.assert_dispatch_enabled()
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_dispatch text;
BEGIN
  PERFORM integration.assert_integration_enabled();

  SELECT control_value INTO v_dispatch
  FROM integration.system_control
  WHERE control_key='dispatch_enabled';

  IF COALESCE(v_dispatch,'0') <> '1' THEN
    RAISE EXCEPTION 'Integration dispatch disabled';
  END IF;
END;
$$;

-- ------------------------------------------------------------
-- 1) backoff helper
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.backoff_seconds(p_attempt int)
RETURNS int
LANGUAGE sql
AS $$
  SELECT CASE
    WHEN p_attempt <= 1 THEN 0
    WHEN p_attempt = 2 THEN 30
    WHEN p_attempt = 3 THEN 120
    WHEN p_attempt = 4 THEN 600
    WHEN p_attempt = 5 THEN 1800
    ELSE 3600
  END;
$$;

-- ------------------------------------------------------------
-- 2) claim batch (INTERNAL_DB only)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.claim_internal_routes(p_limit int DEFAULT 25)
RETURNS SETOF integration.actor_route_queue
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_dispatch_enabled();

  RETURN QUERY
  WITH c AS (
    SELECT rq.route_id
    FROM integration.actor_route_queue rq
    JOIN integration.route_registry rr
      ON rr.os_key = rq.os_key
     AND rr.is_enabled = true
     AND rr.route_kind = 'INTERNAL_DB'
    WHERE rq.route_kind = 'INTERNAL_DB'
      AND rq.status = 'PENDING'
      AND (rq.next_retry_at IS NULL OR rq.next_retry_at <= now())
    ORDER BY rq.created_at
    LIMIT COALESCE(p_limit,25)
    FOR UPDATE SKIP LOCKED
  )
  UPDATE integration.actor_route_queue rq
     SET status='INFLIGHT',
         attempts = rq.attempts + 1,
         updated_at = now()
    FROM c
   WHERE rq.route_id = c.route_id
  RETURNING rq.*;
END;
$$;

-- ------------------------------------------------------------
-- 3) mark done / retry / dead
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.mark_route_done(p_route_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE integration.actor_route_queue
     SET status='DONE',
         last_error=NULL,
         updated_at=now()
   WHERE route_id=p_route_id;
END;
$$;

CREATE OR REPLACE FUNCTION integration.mark_route_retry(p_route_id uuid, p_error text)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_attempts int;
  v_delay int;
  v_next timestamptz;
  v_status text;
BEGIN
  SELECT attempts INTO v_attempts
  FROM integration.actor_route_queue
  WHERE route_id=p_route_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'route not found';
  END IF;

  IF v_attempts >= 5 THEN
    v_status := 'DEAD';
    v_next := NULL;
  ELSE
    v_status := 'PENDING';
    v_delay := integration.backoff_seconds(v_attempts);
    v_next := now() + make_interval(secs => v_delay);
  END IF;

  UPDATE integration.actor_route_queue
     SET status=v_status,
         next_retry_at=v_next,
         last_error=LEFT(COALESCE(p_error,'unknown'), 2000),
         updated_at=now()
   WHERE route_id=p_route_id;
END;
$$;

-- ------------------------------------------------------------
-- 4) invoke OS ingest RPC
--    Calls: <target_schema>.ingest_from_integration(...)
--    Fail-Closed: if function missing/error -> retry/dead
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.invoke_os_ingest(p_row integration.actor_route_queue)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  sql text;
BEGIN
  IF p_row.target_schema IS NULL OR p_row.target_schema = '' THEN
    RAISE EXCEPTION 'target_schema missing';
  END IF;

  -- Call OS-side RPC (must be implemented by each schema)
  sql := format(
    'SELECT %I.ingest_from_integration($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)',
    p_row.target_schema
  );

  EXECUTE sql
  USING
    p_row.route_id,
    p_row.action_id,
    p_row.event_id,
    p_row.correlation_id,
    p_row.actor_id,
    p_row.owner_user_id,
    p_row.policy_id,
    p_row.action_key,
    p_row.risk_level,
    p_row.event_version,
    p_row.occurred_at,
    p_row.payload;
END;
$$;

-- ------------------------------------------------------------
-- 5) worker: deliver internal batch
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.deliver_internal_batch(p_limit int DEFAULT 25)
RETURNS TABLE(claimed int, done int, failed int)
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.actor_route_queue%ROWTYPE;
  v_claimed int := 0;
  v_done int := 0;
  v_failed int := 0;
BEGIN
  FOR r IN SELECT * FROM integration.claim_internal_routes(COALESCE(p_limit,25))
  LOOP
    v_claimed := v_claimed + 1;

    BEGIN
      PERFORM integration.invoke_os_ingest(r);
      PERFORM integration.mark_route_done(r.route_id);
      v_done := v_done + 1;
    EXCEPTION
      WHEN others THEN
        v_failed := v_failed + 1;
        PERFORM integration.mark_route_retry(r.route_id, SQLERRM);
    END;
  END LOOP;

  claimed := v_claimed;
  done := v_done;
  failed := v_failed;
  RETURN NEXT;
END;
$$;
