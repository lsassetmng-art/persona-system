BEGIN;

-- =========================================================
-- Schema: governance (Civil Core write domain)
-- =========================================================
CREATE SCHEMA IF NOT EXISTS governance;

-- =========================================================
-- A) CCI weights (adjustable, audited)
-- =========================================================
CREATE TABLE IF NOT EXISTS governance.cci_weight (
  axis_key text PRIMARY KEY,
  weight numeric NOT NULL CHECK (weight >= 0),
  is_enabled boolean NOT NULL DEFAULT true,
  notes text,
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- seed defaults (idempotent)
INSERT INTO governance.cci_weight(axis_key, weight, is_enabled, notes)
VALUES
  ('relationship_score_avg', 0.20, true, 'core'),
  ('stability_avg',          0.15, true, 'core'),
  ('innovation_index',       0.15, true, 'proxy: curiosity avg'),
  ('economic_flow',          0.15, true, 'placeholder until commerce'),
  ('burnout_ratio',          0.15, true, 'placeholder until burnout data'),
  ('inequality_gap',         0.10, true, 'proxy: score variance/gap'),
  ('resilience_index',       0.10, true, 'placeholder until recovery metrics')
ON CONFLICT (axis_key) DO NOTHING;

-- =========================================================
-- A) CCI components view (READ personaos only)
-- Notes:
-- - personaos.growth_core_state is authoritative.
-- - Some axes are placeholders until commerce/governance stats exist.
-- =========================================================
CREATE OR REPLACE VIEW governance.v_cci_components AS
WITH g AS (
  SELECT
    COUNT(*)::numeric AS persona_count,
    AVG(COALESCE(relationship_score,0))::numeric AS relationship_score_avg,
    AVG(COALESCE(stability,0))::numeric AS stability_avg,
    AVG(COALESCE(affinity,0))::numeric AS affinity_avg,
    AVG(COALESCE(trust,0))::numeric AS trust_avg,
    AVG(COALESCE(familiarity,0))::numeric AS familiarity_avg,
    AVG(COALESCE(current_stage,0))::numeric AS stage_avg,
    -- inequality proxies (variance-like)
    (MAX(COALESCE(relationship_score,0)) - MIN(COALESCE(relationship_score,0)))::numeric AS inequality_gap
  FROM personaos.growth_core_state
)
SELECT
  now() AS computed_at,
  persona_count,
  relationship_score_avg,
  stability_avg,
  -- innovation proxy: curiosity isn't in growth_core_state; use stage_avg as temporary proxy
  stage_avg AS innovation_index,
  -- placeholders (0..1)
  0::numeric AS economic_flow,
  0::numeric AS burnout_ratio,
  inequality_gap,
  0::numeric AS resilience_index
FROM g;

CREATE OR REPLACE VIEW governance.v_cci_latest AS
WITH c AS (
  SELECT * FROM governance.v_cci_components
),
w AS (
  SELECT axis_key, weight
  FROM governance.cci_weight
  WHERE is_enabled = true
)
SELECT
  c.computed_at,
  c.persona_count,
  c.relationship_score_avg,
  c.stability_avg,
  c.innovation_index,
  c.economic_flow,
  c.burnout_ratio,
  c.inequality_gap,
  c.resilience_index,
  (
    COALESCE((SELECT weight FROM w WHERE axis_key='relationship_score_avg'),0) * c.relationship_score_avg
  + COALESCE((SELECT weight FROM w WHERE axis_key='stability_avg'),0)          * c.stability_avg
  + COALESCE((SELECT weight FROM w WHERE axis_key='innovation_index'),0)       * c.innovation_index
  + COALESCE((SELECT weight FROM w WHERE axis_key='economic_flow'),0)          * c.economic_flow
  - COALESCE((SELECT weight FROM w WHERE axis_key='burnout_ratio'),0)          * c.burnout_ratio
  - COALESCE((SELECT weight FROM w WHERE axis_key='inequality_gap'),0)         * c.inequality_gap
  + COALESCE((SELECT weight FROM w WHERE axis_key='resilience_index'),0)       * c.resilience_index
  )::numeric AS cci
FROM c;

-- =========================================================
-- B) Earth success cases DB
-- =========================================================
CREATE TABLE IF NOT EXISTS governance.earth_success_case (
  case_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  era text NOT NULL DEFAULT 'EARTH',
  summary text NOT NULL,
  axes jsonb NOT NULL DEFAULT '{}'::jsonb,     -- {economic_stability:0..1, ...}
  tags jsonb NOT NULL DEFAULT '[]'::jsonb,     -- ["welfare","education",...]
  status text NOT NULL DEFAULT 'active' CHECK (status IN ('active','deprecated')),
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text NOT NULL DEFAULT 'system'
);

CREATE TABLE IF NOT EXISTS governance.earth_policy_recipe (
  recipe_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_id uuid NOT NULL REFERENCES governance.earth_success_case(case_id) ON DELETE CASCADE,
  policy_key text NOT NULL,          -- e.g. governance.policy.stability_relief
  policy_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  notes text,
  is_enabled boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Minimal seed (idempotent)
INSERT INTO governance.earth_success_case(title, era, summary, axes, tags)
SELECT
  'Welfare state stabilization',
  'EARTH',
  'Reducing burnout and improving cohesion through safety nets and recovery mechanisms.',
  jsonb_build_object('social_cohesion',0.8,'sustainability',0.7,'resilience_score',0.8,'inequality_index',0.4),
  jsonb_build_array('welfare','stability','resilience')
WHERE NOT EXISTS (
  SELECT 1 FROM governance.earth_success_case WHERE title='Welfare state stabilization'
);

INSERT INTO governance.earth_policy_recipe(case_id, policy_key, policy_payload, notes)
SELECT
  c.case_id,
  'governance.policy.stability_relief',
  jsonb_build_object('mode','notify','target','world','intensity',0.3),
  'proposal template: stability relief'
FROM governance.earth_success_case c
WHERE c.title='Welfare state stabilization'
AND NOT EXISTS (
  SELECT 1 FROM governance.earth_policy_recipe r
  WHERE r.policy_key='governance.policy.stability_relief'
);

-- =========================================================
-- C) Proposal outbox (governance event outbox)
-- =========================================================
CREATE TABLE IF NOT EXISTS governance.governance_event_outbox (
  event_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_type text NOT NULL,
  occurred_at timestamptz NOT NULL,
  payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  origin text NOT NULL DEFAULT 'civil_core',
  idempotency_key text,
  dispatch_status text NOT NULL DEFAULT 'PENDING' CHECK (dispatch_status IN ('PENDING','INFLIGHT','DONE','DEAD')),
  dispatch_attempts integer NOT NULL DEFAULT 0,
  dispatched_at timestamptz,
  last_dispatch_error text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_gov_outbox_status
ON governance.governance_event_outbox(dispatch_status, created_at);

-- =========================================================
-- C) Triple evaluation + emit (READ personaos, WRITE governance only)
-- =========================================================
CREATE OR REPLACE FUNCTION governance.triple_evaluate_and_emit()
RETURNS jsonb
LANGUAGE plpgsql
AS $$
DECLARE
  v record;
  v_case record;
  v_payload jsonb;
  v_emitted boolean := false;
BEGIN
  SELECT * INTO v FROM governance.v_cci_latest;

  -- no personas -> do nothing
  IF v.persona_count IS NULL OR v.persona_count = 0 THEN
    RETURN jsonb_build_object('ok', true, 'emitted', false, 'reason', 'no_personas');
  END IF;

  -- Simple canonical thresholds (v1):
  -- - if stability_avg < 0.35 -> propose stability relief
  -- - if inequality_gap > 0.60 -> propose redistribution (placeholder)
  IF v.stability_avg < 0.35 THEN
    SELECT c.case_id, c.title
    INTO v_case
    FROM governance.earth_success_case c
    WHERE c.status='active' AND c.title='Welfare state stabilization'
    LIMIT 1;

    v_payload := jsonb_build_object(
      'actor', 'triple',
      'mode', 'proposal',
      'cci', v.cci,
      'components', jsonb_build_object(
        'relationship_score_avg', v.relationship_score_avg,
        'stability_avg', v.stability_avg,
        'innovation_index', v.innovation_index,
        'economic_flow', v.economic_flow,
        'burnout_ratio', v.burnout_ratio,
        'inequality_gap', v.inequality_gap,
        'resilience_index', v.resilience_index
      ),
      'reasons', jsonb_build_array('stability_avg below threshold'),
      'source_cases', jsonb_build_array(COALESCE(v_case.title,'unknown')),
      'recommended_policies', (
        SELECT COALESCE(jsonb_agg(
          jsonb_build_object(
            'policy_key', r.policy_key,
            'payload', r.policy_payload,
            'notes', r.notes
          )
        ), '[]'::jsonb)
        FROM governance.earth_policy_recipe r
        WHERE r.case_id = v_case.case_id AND r.is_enabled=true
      )
    );

    INSERT INTO governance.governance_event_outbox(event_type, occurred_at, payload)
    VALUES ('governance.triple.proposal', now(), COALESCE(v_payload,'{}'::jsonb));

    v_emitted := true;
  END IF;

  RETURN jsonb_build_object(
    'ok', true,
    'emitted', v_emitted,
    'cci', v.cci,
    'persona_count', v.persona_count
  );
END;
$$;

COMMIT;
