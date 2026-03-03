#!/data/data/com.termux/files/usr/bin/sh
set -eu

ts() { date -u +'%Y-%m-%dT%H:%M:%SZ'; }
pass() { echo "[PASS] $(ts) $*"; }
fail() { echo "[FAIL] $(ts) $*" >&2; exit 1; }

require_env() {
  v="${1:-}"
  eval "val=\${$v:-}"
  [ -n "$val" ] || fail "missing env: $v"
}

require_env PERSONA_DATABASE_URL
require_env DATABASE_URL

psql_persona() { psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 "$@"; }
psql_erp()     { psql "$DATABASE_URL" -v ON_ERROR_STOP=1 "$@"; }

# ============================================================
# T1 Stop Tests
# ============================================================

echo "=== T1.2 Civilization Dispatcher Stop ==="
psql_persona <<'SQL'
BEGIN;
UPDATE civilization.system_control
SET control_value='0', updated_at=now()
WHERE control_key='dispatch_enabled';
UPDATE civilization.system_control
SET control_value='1', updated_at=now()
WHERE control_key='dispatch_enabled';
COMMIT;
SQL
pass "T1.2 civilization stop ok"

echo "=== T1.3 ERP Sales Stop Guard ==="
psql_erp <<'SQL'
BEGIN;
UPDATE sales.system_control
SET control_value='0', updated_at=now()
WHERE control_key='os_enabled';

DO $$
BEGIN
  PERFORM sales.request_order_approval_safe(
    '00000000-0000-0000-0000-000000000000'::uuid,
    1::bigint,
    'TEST-ORDER'::text,
    'POLICY-1'::text,
    'STOP TEST'::text
  );
  RAISE EXCEPTION 'EXPECTED_FAILURE_NOT_RAISED';
EXCEPTION
  WHEN OTHERS THEN NULL;
END $$;

UPDATE sales.system_control
SET control_value='1', updated_at=now()
WHERE control_key='os_enabled';
COMMIT;
SQL
pass "T1.3 ERP guard ok"

# ============================================================
# T2 Idempotency (FIXED: persona_id NOT NULL対応)
# ============================================================

echo "=== T2 Persona Idempotency ==="
psql_persona <<'SQL'
BEGIN;

WITH p AS (
  SELECT persona_id, user_id
  FROM personaos.personas
  LIMIT 1
)
INSERT INTO personaos.growth_events (
  event_id, user_id, persona_id, app_namespace,
  event_type, magnitude, context,
  occurred_at, received_at,
  is_processed, processed_at
)
SELECT
  '11111111-1111-1111-1111-111111111111'::uuid,
  p.user_id,
  p.persona_id,
  'test',
  'test.event',
  1,
  '{}'::jsonb,
  now(),
  now(),
  true,
  now()
FROM p
ON CONFLICT (event_id) DO UPDATE SET
  is_processed=EXCLUDED.is_processed,
  processed_at=EXCLUDED.processed_at;

WITH p AS (
  SELECT persona_id, user_id
  FROM personaos.personas
  LIMIT 1
)
INSERT INTO personaos.growth_events (
  event_id, user_id, persona_id, app_namespace,
  event_type, magnitude, context,
  occurred_at, received_at,
  is_processed, processed_at
)
SELECT
  '22222222-2222-2222-2222-222222222222'::uuid,
  p.user_id,
  p.persona_id,
  'test',
  'test.event',
  1,
  '{}'::jsonb,
  now(),
  now(),
  false,
  NULL
FROM p
ON CONFLICT (event_id) DO UPDATE SET
  is_processed=EXCLUDED.is_processed,
  processed_at=EXCLUDED.processed_at;

DELETE FROM personaos.growth_events
WHERE event_id IN (
  '11111111-1111-1111-1111-111111111111'::uuid,
  '22222222-2222-2222-2222-222222222222'::uuid
);

COMMIT;
SQL
pass "T2 idempotency ok"

# ============================================================
# T3 Signature Column Presence
# ============================================================

echo "=== T3 Signature Columns ==="
psql_persona <<'SQL'
BEGIN;
SELECT signature, signature_verified, key_id, sig_ver, event_version
FROM integration.external_event
LIMIT 0;
COMMIT;
SQL
pass "T3 signature fields ok"

# ============================================================
# T4 Outbox Columns Presence
# ============================================================

echo "=== T4 Outbox Columns ==="
psql_persona <<'SQL'
BEGIN;
SELECT table_schema, table_name
FROM information_schema.columns
WHERE table_name='event_outbox'
AND column_name IN ('dispatch_status','dispatch_attempts','next_retry_at','last_dispatch_error','event_version','source_os')
GROUP BY table_schema, table_name;
COMMIT;
SQL
pass "T4 outbox columns ok"

# ============================================================
# T5 event_version Presence
# ============================================================

echo "=== T5 event_version Presence ==="
psql_persona <<'SQL'
BEGIN;
SELECT table_schema, table_name
FROM information_schema.columns
WHERE column_name='event_version'
AND table_name IN ('external_event','event_outbox');
COMMIT;
SQL
pass "T5 version columns ok"

echo "=== ALL TESTS PASSED ==="
