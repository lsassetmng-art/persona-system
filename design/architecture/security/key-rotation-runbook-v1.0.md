# ============================================================
# Civilization OS
# Key Rotation Runbook
# Version: v1.0
# Status: OPERATIONAL
# ============================================================

## 0. Purpose

This runbook defines the operational procedure
for rotating world signing keys safely.

Applies to:
- personaos.world_signing_keys
- sign-event Edge
- civ-dispatcher verification

------------------------------------------------------------
# 1. Roles
------------------------------------------------------------

GO/STOP Authority:
  System Owner (Boss)

Execution:
  DB Operator
  Edge Operator

------------------------------------------------------------
# 2. Preconditions
------------------------------------------------------------

Before rotation:

- Dispatcher is healthy
- No active verify errors
- sign-event is responding 200
- Current ACTIVE key confirmed

Verification:

SELECT world, key_id, status
FROM personaos.world_signing_keys
WHERE world='business';

------------------------------------------------------------
# 3. Normal Rotation Procedure
------------------------------------------------------------

STEP 1 — Generate new keypair (offline)

- Ed25519
- Store private key securely
- Derive SPKI public key (base64)

STOP if keypair mismatch.

------------------------------------------------------------

STEP 2 — Insert new key as ACTIVE

INSERT INTO personaos.world_signing_keys
(world, key_id, status, public_key)
VALUES (..., 'ACTIVE', ...);

If UNIQUE constraint fails:
  STOP (multiple ACTIVE not allowed)

------------------------------------------------------------

STEP 3 — Retire previous ACTIVE

UPDATE personaos.world_signing_keys
SET status='RETIRED'
WHERE world='business'
  AND key_id='<previous>';

------------------------------------------------------------

STEP 4 — Update SIGNING_PRIVATE_KEYS_JSON

Add new key_id → private_key

Remove old key_id only after RETIRED period.

Deploy sign-event Edge.

------------------------------------------------------------

STEP 5 — Validation

- Trigger test sign-event
- Insert test event
- Confirm dispatcher processed=1

If verify_failed:
  STOP and rollback

------------------------------------------------------------

STEP 6 — Monitoring Window

Monitor:
- dead_by_verify
- invalid_signature
- unknown_or_invalid_key

Minimum observation window:
  15 minutes

------------------------------------------------------------
# 4. RETIRED Policy
------------------------------------------------------------

- RETIRED keys retained ≥ 90 days
- RETIRED accepted for verification
- No signing allowed

After 90 days:
  May transition to REVOKED

------------------------------------------------------------
# 5. REVOKE Procedure (Emergency)
------------------------------------------------------------

Trigger:
- Key leak suspected
- Compromise detected

Procedure:

UPDATE personaos.world_signing_keys
SET status='REVOKED'
WHERE world='business'
  AND key_id='<compromised>';

Immediately:

- Generate new keypair
- Insert new ACTIVE
- Update private keys
- Deploy sign-event

NOTE:
Past events signed with revoked key will fail verification.
Integrity is prioritized over availability.

------------------------------------------------------------
# 6. Rollback Strategy
------------------------------------------------------------

If new key causes failures:

- Re-activate previous RETIRED key
- Restore SIGNING_PRIVATE_KEYS_JSON
- Redeploy sign-event

Only possible if previous key not REVOKED.

------------------------------------------------------------
# 7. Prohibited Actions
------------------------------------------------------------

❌ Do NOT update public_key
❌ Do NOT have multiple ACTIVE keys
❌ Do NOT delete historical keys
❌ Do NOT modify signature format

------------------------------------------------------------
# END OF RUNBOOK
------------------------------------------------------------
