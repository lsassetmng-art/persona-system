-- ============================================================
-- 65 Integration Gate DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed design.

-- -----------------------------
-- 0) tables
-- -----------------------------

CREATE TABLE IF NOT EXISTS integration.actor_policy (
  policy_id text PRIMARY KEY,
  os_key text NOT NULL,
  actor_id uuid NOT NULL,
  persona_id uuid NOT NULL,
  owner_user_id uuid NOT NULL,

  tenant_key text NULL,
  tenant_value text NULL,

  max_risk_level integer NOT NULL DEFAULT 1,
  require_signature boolean NOT NULL DEFAULT true,
  require_human_approval boolean NOT NULL DEFAULT true,

  status text NOT NULL DEFAULT 'ACTIVE', -- ACTIVE/SUSPENDED/REVOKED
  issued_at timestamptz NOT NULL DEFAULT now(),
  expires_at timestamptz NOT NULL,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_policy_actor
  ON integration.actor_policy(actor_id, os_key);

CREATE TABLE IF NOT EXISTS integration.actor_whitelist (
  os_key text NOT NULL,
  action_key text NOT NULL,
  target_schema text NULL,
  target_rpc text NULL,

  risk_level integer NOT NULL DEFAULT 0,
  require_signature boolean NOT NULL DEFAULT true,
  require_human_approval boolean NOT NULL DEFAULT true,

  arg_schema_hash text NULL,
  rate_limit_per_min integer NOT NULL DEFAULT 60,

  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  PRIMARY KEY (os_key, action_key)
);

CREATE INDEX IF NOT EXISTS idx_actor_whitelist_target
  ON integration.actor_whitelist(os_key, target_schema, target_rpc);

CREATE TABLE IF NOT EXISTS integration.actor_action_dedup (
  action_id uuid PRIMARY KEY,
  event_id uuid NOT NULL,
  correlation_id text NULL,
  actor_id uuid NOT NULL,
  policy_id text NOT NULL,
  os_key text NOT NULL,
  action_key text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_action_dedup_event
  ON integration.actor_action_dedup(event_id);

-- -----------------------------
-- 1) helpers
-- -----------------------------

CREATE OR REPLACE FUNCTION integration.now_utc()
RETURNS timestamptz
LANGUAGE sql
AS $$
  SELECT now() AT TIME ZONE 'utc';
$$;

-- system_control (already exists per verify) gate
CREATE OR REPLACE FUNCTION integration.assert_integration_enabled()
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_os text;
  v_maint text;
BEGIN
  SELECT control_value INTO v_os
  FROM integration.system_control
  WHERE control_key='os_enabled';

  SELECT control_value INTO v_maint
  FROM integration.system_control
  WHERE control_key='maintenance_mode';

  IF COALESCE(v_os,'0') <> '1' THEN
    RAISE EXCEPTION 'Integration OS disabled';
  END IF;

  IF COALESCE(v_maint,'0') = '1' THEN
    RAISE EXCEPTION 'Integration maintenance_mode';
  END IF;
END;
$$;

-- policy check (Fail-Closed)
CREATE OR REPLACE FUNCTION integration.check_actor_policy(
  p_policy_id text,
  p_os_key text,
  p_actor_id uuid,
  p_persona_id uuid,
  p_owner_user_id uuid,
  p_risk_level integer,
  p_tenant_key text,
  p_tenant_value text
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.actor_policy%ROWTYPE;
BEGIN
  SELECT * INTO r
  FROM integration.actor_policy
  WHERE policy_id = p_policy_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Policy not found';
  END IF;

  IF r.status <> 'ACTIVE' THEN
    RAISE EXCEPTION 'Policy not active';
  END IF;

  IF r.os_key <> p_os_key THEN
    RAISE EXCEPTION 'Policy os_key mismatch';
  END IF;

  IF r.actor_id <> p_actor_id OR r.persona_id <> p_persona_id OR r.owner_user_id <> p_owner_user_id THEN
    RAISE EXCEPTION 'Policy bind mismatch';
  END IF;

  IF r.expires_at <= now() THEN
    RAISE EXCEPTION 'Policy expired';
  END IF;

  IF p_risk_level > r.max_risk_level THEN
    RAISE EXCEPTION 'Risk level exceeds policy';
  END IF;

  -- tenant scope (optional but fail-closed if policy specifies scope)
  IF r.tenant_key IS NOT NULL THEN
    IF p_tenant_key IS NULL OR p_tenant_value IS NULL THEN
      RAISE EXCEPTION 'Tenant scope required';
    END IF;
    IF r.tenant_key <> p_tenant_key OR r.tenant_value <> p_tenant_value THEN
      RAISE EXCEPTION 'Tenant scope mismatch';
    END IF;
  END IF;
END;
$$;

-- whitelist check
CREATE OR REPLACE FUNCTION integration.check_actor_whitelist(
  p_os_key text,
  p_action_key text,
  p_target_schema text,
  p_target_rpc text,
  p_risk_level integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  w integration.actor_whitelist%ROWTYPE;
BEGIN
  SELECT * INTO w
  FROM integration.actor_whitelist
  WHERE os_key = p_os_key
    AND action_key = p_action_key;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Whitelist entry not found';
  END IF;

  IF w.is_active IS NOT TRUE THEN
    RAISE EXCEPTION 'Whitelist disabled';
  END IF;

  IF p_risk_level <> w.risk_level THEN
    RAISE EXCEPTION 'Risk level mismatch with whitelist';
  END IF;

  -- If DB-type OS, enforce target matching when whitelist defines them
  IF w.target_schema IS NOT NULL AND COALESCE(p_target_schema,'') <> w.target_schema THEN
    RAISE EXCEPTION 'target_schema mismatch';
  END IF;
  IF w.target_rpc IS NOT NULL AND COALESCE(p_target_rpc,'') <> w.target_rpc THEN
    RAISE EXCEPTION 'target_rpc mismatch';
  END IF;
END;
$$;

-- signature trust check (crypto verify is external; DB checks trust chain)
CREATE OR REPLACE FUNCTION integration.check_signature_trust(
  p_key_id text,
  p_signature_verified boolean
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_trusted integer;
  v_revoked integer;
BEGIN
  IF p_signature_verified IS NOT TRUE THEN
    RAISE EXCEPTION 'Signature not verified';
  END IF;

  SELECT count(*) INTO v_trusted
  FROM integration.trusted_keys
  WHERE key_id = p_key_id;

  IF COALESCE(v_trusted,0) = 0 THEN
    RAISE EXCEPTION 'Key not trusted';
  END IF;

  SELECT count(*) INTO v_revoked
  FROM integration.revoked_keys
  WHERE key_id = p_key_id;

  IF COALESCE(v_revoked,0) > 0 THEN
    RAISE EXCEPTION 'Key revoked';
  END IF;
END;
$$;

-- idempotency (action_id)
CREATE OR REPLACE FUNCTION integration.assert_action_not_duplicate(
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_policy_id text,
  p_os_key text,
  p_action_key text
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO integration.actor_action_dedup(
    action_id, event_id, correlation_id, actor_id, policy_id, os_key, action_key
  ) VALUES (
    p_action_id, p_event_id, p_correlation_id, p_actor_id, p_policy_id, p_os_key, p_action_key
  );
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Duplicate action_id';
END;
$$;

-- ------------------------------------------------------------
-- 2) Gate entrypoint (routing is "contract only" here)
--    This function ONLY validates and records dedup.
--    Actual routing to target OS outbox is implemented later
--    after schema mapping is finalized per OS.
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.gate_validate_actor_action(
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
  p_signature_verified boolean
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_integration_enabled();

  PERFORM integration.check_signature_trust(p_key_id, p_signature_verified);

  PERFORM integration.check_actor_policy(
    p_policy_id, p_os_key, p_actor_id, p_persona_id, p_owner_user_id,
    p_risk_level, p_tenant_key, p_tenant_value
  );

  PERFORM integration.check_actor_whitelist(
    p_os_key, p_action_key, p_target_schema, p_target_rpc, p_risk_level
  );

  PERFORM integration.assert_action_not_duplicate(
    p_action_id, p_event_id, p_correlation_id, p_actor_id, p_policy_id, p_os_key, p_action_key
  );
END;
$$;
