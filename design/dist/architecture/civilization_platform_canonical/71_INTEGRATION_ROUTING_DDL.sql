-- ============================================================
-- 71 Integration Routing DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed.

-- -----------------------------
-- 0) route registry
-- -----------------------------
CREATE TABLE IF NOT EXISTS integration.route_registry (
  os_key text PRIMARY KEY,
  route_kind text NOT NULL,             -- INTERNAL_DB / EXTERNAL_HTTP
  target_schema text NULL,              -- for INTERNAL_DB
  target_hint text NULL,                -- for EXTERNAL
  is_enabled boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- -----------------------------
-- 1) universal route queue
-- -----------------------------
CREATE TABLE IF NOT EXISTS integration.actor_route_queue (
  route_id uuid PRIMARY KEY,
  action_id uuid NOT NULL UNIQUE,
  event_id uuid NOT NULL,
  correlation_id text NULL,

  actor_id uuid NOT NULL,
  persona_id uuid NOT NULL,
  owner_user_id uuid NOT NULL,
  policy_id text NOT NULL,

  os_key text NOT NULL,
  action_key text NOT NULL,
  target_schema text NULL,
  target_rpc text NULL,
  risk_level integer NOT NULL DEFAULT 0,

  tenant_key text NULL,
  tenant_value text NULL,

  event_version integer NOT NULL DEFAULT 1,
  occurred_at timestamptz NOT NULL,
  source_os text NOT NULL DEFAULT 'integration',

  payload jsonb NOT NULL DEFAULT '{}'::jsonb,

  key_id text NULL,
  signature_base64 text NULL,
  signature_verified boolean NOT NULL DEFAULT false,

  route_kind text NOT NULL,             -- from registry
  status text NOT NULL DEFAULT 'PENDING',  -- PENDING/INFLIGHT/DONE/DEAD
  attempts integer NOT NULL DEFAULT 0,
  next_retry_at timestamptz NULL,
  last_error text NULL,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_status
  ON integration.actor_route_queue(status, next_retry_at);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_os
  ON integration.actor_route_queue(os_key, route_kind);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_event
  ON integration.actor_route_queue(event_id);

-- -----------------------------
-- 2) registry check
-- -----------------------------
CREATE OR REPLACE FUNCTION integration.get_route_registry(p_os_key text)
RETURNS integration.route_registry
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.route_registry%ROWTYPE;
BEGIN
  SELECT * INTO r FROM integration.route_registry WHERE os_key=p_os_key;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Route registry not found for os_key=%', p_os_key;
  END IF;
  IF r.is_enabled IS NOT TRUE THEN
    RAISE EXCEPTION 'Route registry disabled for os_key=%', p_os_key;
  END IF;
  RETURN r;
END;
$$;

-- -----------------------------
-- 3) routing entrypoint
--    - validates (gate)
--    - registry check
--    - enqueue
-- -----------------------------
CREATE OR REPLACE FUNCTION integration.route_actor_action(
  p_route_id uuid,
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,

  p_actor_id uuid,
  p_persona_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,

  p_os_key text,
  p_action_key text,
  p_target_schema text,
  p_target_rpc text,
  p_risk_level integer,

  p_tenant_key text,
  p_tenant_value text,

  p_key_id text,
  p_signature_base64 text,
  p_signature_verified boolean,

  p_event_version integer,
  p_occurred_at timestamptz,
  p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  rr integration.route_registry%ROWTYPE;
BEGIN
  -- 1) Gate validation (Fail-Closed)
  PERFORM integration.gate_validate_actor_action(
    p_action_id,
    p_event_id,
    p_correlation_id,
    p_actor_id,
    p_persona_id,
    p_owner_user_id,
    p_policy_id,
    p_os_key,
    p_action_key,
    p_target_schema,
    p_target_rpc,
    p_risk_level,
    p_tenant_key,
    p_tenant_value,
    p_key_id,
    p_signature_verified
  );

  -- 2) Registry (Fail-Closed)
  rr := integration.get_route_registry(p_os_key);

  -- 3) Enqueue (Universal)
  INSERT INTO integration.actor_route_queue(
    route_id, action_id, event_id, correlation_id,
    actor_id, persona_id, owner_user_id, policy_id,
    os_key, action_key, target_schema, target_rpc, risk_level,
    tenant_key, tenant_value,
    event_version, occurred_at, source_os,
    payload,
    key_id, signature_base64, signature_verified,
    route_kind,
    status, attempts, next_retry_at, last_error
  ) VALUES (
    p_route_id, p_action_id, p_event_id, p_correlation_id,
    p_actor_id, p_persona_id, p_owner_user_id, p_policy_id,
    p_os_key, p_action_key, p_target_schema, p_target_rpc, p_risk_level,
    p_tenant_key, p_tenant_value,
    COALESCE(p_event_version,1), COALESCE(p_occurred_at, now()),
    'integration',
    COALESCE(p_payload, '{}'::jsonb),
    p_key_id, p_signature_base64, p_signature_verified,
    rr.route_kind,
    'PENDING', 0, NULL, NULL
  );

EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Duplicate action_id';
END;
$$;
