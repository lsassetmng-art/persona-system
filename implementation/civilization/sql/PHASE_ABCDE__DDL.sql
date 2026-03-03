-- ==========================================================
-- CivilizationOS Phase A〜E : One-shot DDL (Persona DB)
-- - 3world dispatcher前提の claim RPC 統一
-- - governance tick入口
-- - economy/inequality “箱”追加（精密ロジックは後続）
-- ==========================================================

BEGIN;

-- ----------------------------------------------------------
-- 0) 安全: 拡張
-- ----------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ----------------------------------------------------------
-- 1) event_outbox claim RPC を「同じ戻り型」で統一
--    return type変更は OR REPLACE でできないため DROP → CREATE
--    統一戻り:
--      (event_id uuid, user_id uuid, event_type text, payload jsonb, occurred_at timestamptz, dispatch_attempts integer)
-- ----------------------------------------------------------

-- ========== business ==========
DROP FUNCTION IF EXISTS business.business_claim_event_outbox(integer);

CREATE FUNCTION business.business_claim_event_outbox(p_batch integer DEFAULT 25)
RETURNS TABLE(
  event_id uuid,
  user_id uuid,
  event_type text,
  payload jsonb,
  occurred_at timestamptz,
  dispatch_attempts integer
)
LANGUAGE plpgsql
AS $function$
BEGIN
  RETURN QUERY
  WITH picked AS (
    SELECT o.event_id
    FROM business.event_outbox o
    WHERE o.dispatch_status = 'PENDING'
      AND (o.next_retry_at IS NULL OR o.next_retry_at <= now())
    ORDER BY o.created_at
    FOR UPDATE SKIP LOCKED
    LIMIT p_batch
  )
  UPDATE business.event_outbox o
  SET dispatch_status   = 'INFLIGHT',
      dispatch_attempts = o.dispatch_attempts + 1,
      last_dispatch_error = NULL
  WHERE o.event_id IN (SELECT event_id FROM picked)
  RETURNING
    o.event_id,
    o.user_id,
    o.event_type,
    o.payload,
    o.occurred_at,
    o.dispatch_attempts;
END;
$function$;

-- ========== life ==========
DROP FUNCTION IF EXISTS life.life_claim_event_outbox(integer);

CREATE FUNCTION life.life_claim_event_outbox(p_batch integer DEFAULT 25)
RETURNS TABLE(
  event_id uuid,
  user_id uuid,
  event_type text,
  payload jsonb,
  occurred_at timestamptz,
  dispatch_attempts integer
)
LANGUAGE plpgsql
AS $function$
BEGIN
  RETURN QUERY
  WITH picked AS (
    SELECT o.event_id
    FROM life.life_event_outbox o
    WHERE o.dispatch_status = 'PENDING'
    ORDER BY o.created_at
    FOR UPDATE SKIP LOCKED
    LIMIT p_batch
  )
  UPDATE life.life_event_outbox o
  SET dispatch_status   = 'INFLIGHT',
      dispatch_attempts = o.dispatch_attempts + 1,
      last_dispatch_error = NULL
  WHERE o.event_id IN (SELECT event_id FROM picked)
  RETURNING
    o.event_id,
    o.user_id,
    o.event_type,
    o.payload,
    o.occurred_at,
    o.dispatch_attempts;
END;
$function$;

-- ========== governance ==========
-- governance_event_outbox が存在する前提（Phase8完了）
DROP FUNCTION IF EXISTS governance.governance_claim_event_outbox(integer);

CREATE FUNCTION governance.governance_claim_event_outbox(p_batch integer DEFAULT 25)
RETURNS TABLE(
  event_id uuid,
  user_id uuid,
  event_type text,
  payload jsonb,
  occurred_at timestamptz,
  dispatch_attempts integer
)
LANGUAGE plpgsql
AS $function$
BEGIN
  RETURN QUERY
  WITH picked AS (
    SELECT o.event_id
    FROM governance.governance_event_outbox o
    WHERE o.dispatch_status = 'PENDING'
    ORDER BY o.created_at
    FOR UPDATE SKIP LOCKED
    LIMIT p_batch
  )
  UPDATE governance.governance_event_outbox o
  SET dispatch_status   = 'INFLIGHT',
      dispatch_attempts = o.dispatch_attempts + 1,
      last_dispatch_error = NULL
  WHERE o.event_id IN (SELECT event_id FROM picked)
  RETURNING
    o.event_id,
    o.user_id,
    o.event_type,
    o.payload,
    o.occurred_at,
    o.dispatch_attempts;
END;
$function$;

-- ----------------------------------------------------------
-- 2) “文明変数”の箱（後で精密化）
--    既存があれば additive-only で列を足す
-- ----------------------------------------------------------
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema='governance' AND table_name='triple_state'
  ) THEN
    -- 追加の文明指標（後続でモデル化）
    IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE table_schema='governance' AND table_name='triple_state' AND column_name='economic_flow'
    ) THEN
      ALTER TABLE governance.triple_state ADD COLUMN economic_flow numeric NOT NULL DEFAULT 0;
    END IF;

    IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE table_schema='governance' AND table_name='triple_state' AND column_name='inequality_gap'
    ) THEN
      ALTER TABLE governance.triple_state ADD COLUMN inequality_gap numeric NOT NULL DEFAULT 0;
    END IF;

    IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE table_schema='governance' AND table_name='triple_state' AND column_name='resilience_index'
    ) THEN
      ALTER TABLE governance.triple_state ADD COLUMN resilience_index numeric NOT NULL DEFAULT 0;
    END IF;

    IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE table_schema='governance' AND table_name='triple_state' AND column_name='innovation_index'
    ) THEN
      ALTER TABLE governance.triple_state ADD COLUMN innovation_index numeric NOT NULL DEFAULT 0;
    END IF;
  END IF;
END $$;

-- ----------------------------------------------------------
-- 3) Tick入口（cron/edgeから叩く）
--    - triple_evaluate_and_emit() を実行
--    - ついでに personaos 側の decay も回す（ある関数だけ）
-- ----------------------------------------------------------
DROP FUNCTION IF EXISTS governance.civilization_tick();

CREATE FUNCTION governance.civilization_tick()
RETURNS jsonb
LANGUAGE plpgsql
AS $function$
DECLARE
  v_emit jsonb;
  v_decayed int := 0;
  v_recovered int := 0;
BEGIN
  -- personaos 側の軽い日次系（存在する関数だけ）
  BEGIN
    SELECT personaos.decay_memory_state() INTO v_decayed;
  EXCEPTION WHEN undefined_function THEN
    v_decayed := 0;
  END;

  BEGIN
    SELECT personaos.recover_stability() INTO v_recovered;
  EXCEPTION WHEN undefined_function THEN
    v_recovered := 0;
  END;

  -- triple評価→提案→outbox emit（あなたのPhase9関数）
  SELECT governance.triple_evaluate_and_emit() INTO v_emit;

  RETURN jsonb_build_object(
    'ok', true,
    'decay_memory_state', v_decayed,
    'recover_stability', v_recovered,
    'triple', COALESCE(v_emit,'{}'::jsonb)
  );
END;
$function$;

COMMIT;
