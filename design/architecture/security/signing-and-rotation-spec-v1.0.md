# ============================================================
# Civilization OS
# Signing & Key Rotation Specification
# Version: v1.0 (FINALIZED)
# Status: FROZEN
# ============================================================

## 0. Scope
This document defines:
- Event signing specification
- Canonical envelope format
- Key lifecycle states
- Key rotation procedure
- DB constraints
- Verification policy
- Cache behavior
- Security guarantees

This specification is authoritative for:
- sign-event Edge
- civ-dispatcher verification
- personaos.world_signing_keys
- future audit tooling

------------------------------------------------------------
# 1. Signing Model
------------------------------------------------------------
Signing authority = WORLD
Users do NOT sign.
World signs.
Example:
  world = business
All events under the world are signed by the world ACTIVE key.
This is a central signing model.

------------------------------------------------------------
# 2. Canonical Envelope Format
------------------------------------------------------------
Envelope fields (exact):
{
  schema,
  world,
  event_id,
  event_type,
  event_version,
  schema_hash,
  user_id,
  occurred_at,
  payload
}
Rules:
- Keys sorted lexicographically
- JSON canonicalized recursively
- No whitespace changes
- occurred_at must be ISO8601 with milliseconds (.000Z)
- payload included as-is (after canonical sort)
Canonicalization MUST be identical in:
- sign-event
- dispatcher

------------------------------------------------------------
# 3. occurred_at Normalization
------------------------------------------------------------
All signing MUST normalize:
occurred_at = new Date(raw).toISOString()
Example:
Input:
  2026-03-03T03:25:47Z
Canonical:
  2026-03-03T03:25:47.000Z

------------------------------------------------------------
# 4. Key Storage
------------------------------------------------------------
Table:
  personaos.world_signing_keys
Columns:
- world
- key_id
- status
- public_key
- created_at
public_key format:
  Base64 SPKI DER (Ed25519)

------------------------------------------------------------
# 5. Key States
------------------------------------------------------------
ACTIVE
  - Used for signing
  - Accepted for verification
RETIRED
  - Not used for signing
  - Accepted for verification
  - Must be retained ≥ 90 days
REVOKED
  - Not used for signing
  - NOT accepted for verification
  - Immediate invalidation
  - Past events will fail verification

------------------------------------------------------------
# 6. Key Rotation Procedure
------------------------------------------------------------
STEP 1: Generate new keypair (offline)
STEP 2: Insert new key as ACTIVE
STEP 3: Set previous ACTIVE → RETIRED
STEP 4: Update SIGNING_PRIVATE_KEYS_JSON
STEP 5: Deploy sign-event
STEP 6: Monitor dispatcher logs
After ≥ 90 days:
  RETIRED may be moved to REVOKED

------------------------------------------------------------
# 7. Key Immutability Rule
------------------------------------------------------------
public_key is IMMUTABLE.
DB enforced via trigger:
  prevent_public_key_update()
Keys are replaced via INSERT, not UPDATE.

------------------------------------------------------------
# 8. ACTIVE Uniqueness Constraint
------------------------------------------------------------
Exactly ONE ACTIVE key per world.
CREATE UNIQUE INDEX uniq_active_key_per_world
ON personaos.world_signing_keys(world)
WHERE status='ACTIVE';

------------------------------------------------------------
# 9. Verification Rules
------------------------------------------------------------
Dispatcher verification logic:
1. Load public_key by (world, key_id)
2. status must be ACTIVE OR RETIRED
3. REVOKED → reject
4. Canonicalize envelope
5. Verify Ed25519 signature
6. If false → DEAD

------------------------------------------------------------
# 10. Cache Behavior
------------------------------------------------------------
Key cache TTL = 5 minutes
- Best effort only
- DB is ultimate truth

------------------------------------------------------------
# 11. Security Guarantees
------------------------------------------------------------
✔ Public keys immutable
✔ One ACTIVE per world
✔ RETIRED verification allowed
✔ REVOKED verification denied
✔ Canonical stable
✔ World-scoped trust boundary

------------------------------------------------------------
# END OF SPEC
------------------------------------------------------------
