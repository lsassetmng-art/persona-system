-- ==========================================================
-- CivilizationOS Phase A〜E CHECK (safe)
-- ==========================================================

-- 1) Claim RPC existence (3world)
SELECT n.nspname AS schema, p.proname AS function_name, pg_get_function_identity_arguments(p.oid) AS args
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE (n.nspname, p.proname) IN (
  ('business','business_claim_event_outbox'),
  ('life','life_claim_event_outbox'),
  ('governance','governance_claim_event_outbox'),
  ('governance','civilization_tick')
)
ORDER BY 1,2;

-- 2) pending outbox snapshot
SELECT 'business' AS world, dispatch_status, count(*) AS cnt
FROM business.event_outbox
GROUP BY dispatch_status
ORDER BY dispatch_status;

SELECT 'life' AS world, dispatch_status, count(*) AS cnt
FROM life.life_event_outbox
GROUP BY dispatch_status
ORDER BY dispatch_status;

SELECT 'governance' AS world, dispatch_status, count(*) AS cnt
FROM governance.governance_event_outbox
GROUP BY dispatch_status
ORDER BY dispatch_status;

-- 3) event_catalog world/domain casing check (optional sanity)
SELECT event_type, world, domain
FROM shared.event_catalog
ORDER BY world, domain, event_type;

-- 4) tick dry-run
SELECT governance.civilization_tick() AS tick_result;
