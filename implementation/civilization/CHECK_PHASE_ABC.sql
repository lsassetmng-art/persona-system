-- A: CCI
SELECT * FROM governance.v_cci_latest;

-- B: cases
SELECT title, status FROM governance.earth_success_case ORDER BY created_at DESC;

-- C: run triple (proposal emit)
SELECT governance.triple_evaluate_and_emit();

-- outbox 확인
SELECT event_type, dispatch_status, created_at
FROM governance.governance_event_outbox
ORDER BY created_at DESC
LIMIT 20;
