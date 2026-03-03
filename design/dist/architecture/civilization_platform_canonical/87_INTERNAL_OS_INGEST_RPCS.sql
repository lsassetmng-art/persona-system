-- ============================================================
-- 87 INTERNAL OS ingest RPCs (Persona Project)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only. No DROP.
-- Contract: <schema>.ingest_from_integration(...) RETURNS void
--
-- NOTE:
-- - Each schema has its own event_outbox shape. These RPCs absorb the differences.
-- - idempotency_key is stored where available as action_id::text.
-- - system_control gates are checked per schema (Fail-Closed).

-- ------------------------------------------------------------
-- helper: assert schema dispatch enabled (Fail-Closed)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.assert_schema_dispatch_enabled(p_schema text)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_os text;
  v_dispatch text;
  v_maint text;
  sql text;
BEGIN
  -- Require integration dispatch enabled too
  PERFORM integration.assert_dispatch_enabled();

  -- Read <schema>.system_control values
  sql := format($f$
    SELECT
      (SELECT control_value FROM %I.system_control WHERE control_key='os_enabled'),
      (SELECT control_value FROM %I.system_control WHERE control_key='dispatch_enabled'),
      (SELECT control_value FROM %I.system_control WHERE control_key='maintenance_mode')
  $f$, p_schema, p_schema, p_schema);

  EXECUTE sql INTO v_os, v_dispatch, v_maint;

  IF COALESCE(v_os,'0') <> '1' THEN
    RAISE EXCEPTION 'OS % is disabled', p_schema;
  END IF;

  IF COALESCE(v_dispatch,'0') <> '1' THEN
    RAISE EXCEPTION 'OS % dispatch is disabled', p_schema;
  END IF;

  IF COALESCE(v_maint,'0') = '1' THEN
    RAISE EXCEPTION 'OS % maintenance_mode', p_schema;
  END IF;
END;
$$;

-- ------------------------------------------------------------
-- BUSINESS
-- Columns (observed): id, event_id, user_id, event_type, payload,
-- status, retry_count, next_retry_at, created_at, sent_at, last_error,
-- dispatch_status, dispatch_attempts, dispatched_at, last_dispatch_error,
-- occurred_at, event_version, source_os
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION business.ingest_from_integration(
  p_route_id uuid,
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,
  p_action_key text,
  p_risk_level integer,
  p_event_version integer,
  p_occurred_at timestamptz,
  p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('business');

  INSERT INTO business.event_outbox(
    id,
    event_id,
    user_id,
    event_type,
    payload,
    status,
    retry_count,
    next_retry_at,
    created_at,
    sent_at,
    last_error,
    dispatch_status,
    dispatch_attempts,
    dispatched_at,
    last_dispatch_error,
    occurred_at,
    event_version,
    source_os
  ) VALUES (
    gen_random_uuid(),
    p_event_id,
    p_owner_user_id,
    p_action_key,
    COALESCE(p_payload, '{}'::jsonb),
    'pending',
    0,
    NULL,
    now(),
    NULL,
    NULL,
    'PENDING',
    0,
    NULL,
    NULL,
    COALESCE(p_occurred_at, now()),
    COALESCE(p_event_version, 1),
    'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    -- If business.event_outbox has a unique constraint (event_id, etc.), treat as idempotent success
    RETURN;
END;
$$;

-- ------------------------------------------------------------
-- STREAMING / GAME / LIFE / GOVERNANCE / SYSTEM
-- Columns (observed typical): event_id,event_type,occurred_at,payload,
-- origin_table,origin_pk,user_id,idempotency_key,dispatch_status,dispatch_attempts,
-- next_retry_at,dispatched_at,last_dispatch_error,created_at,event_version,source_os
-- We'll insert the common subset that exists across these schemas.
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION streaming.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('streaming');

  INSERT INTO streaming.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION game.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('game');

  INSERT INTO game.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION life.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('life');

  INSERT INTO life.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION governance.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('governance');

  INSERT INTO governance.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION system.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('system');

  INSERT INTO system.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;
