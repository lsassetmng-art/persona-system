# ============================================================
# Civilization OS
# Dispatcher Verification Specification
# Version: v1.0 (FINALIZED)
# Status: FROZEN
# Target: civ-dispatcher v9.3.1+worldkey+opslog
# ============================================================

## 0. Purpose
This document defines the dispatcher verification pipeline:
- what is verified
- how keys are resolved
- what is accepted/rejected
- failure handling (DEAD / retry)
- operational logs and observability

This spec is authoritative for:
- civ-dispatcher (Edge)
- personaos.get_signing_public_key (RPC contract)
- outbox processing semantics

------------------------------------------------------------
# 1. Inputs / Entities
------------------------------------------------------------
World Registry (civilization.get_enabled_worlds):
- world_key
- schema_name
- claim_rpc

Outbox row (world schema event_outbox):
- event_id (uuid)
- event_type (text)
- event_version (int)
- schema_hash (text)
- user_id (uuid)
- occurred_at (timestamptz)
- payload (jsonb)
- signature (text base64)
- key_id (text)
- dispatch_* fields (status/attempts/errors/...)

------------------------------------------------------------
# 2. Control Gates (must exist)
------------------------------------------------------------
Global gate (civilization.system_control):
- os_enabled
- dispatch_enabled

Per-world gate (each world schema system_control):
- os_enabled
- dispatch_enabled

Rules:
- If global gate disabled => dispatcher halts OK (no work)
- If a world gate disabled => skip that world (no claim)

------------------------------------------------------------
# 3. Claim & Processing Loop (must keep)
------------------------------------------------------------
For each enabled world:
1) claim events via claim_rpc (func name can be schema.func or func)
2) process each claimed row
3) mark done via world rpc mark_event_done
4) if apply fails => retry via civilization.mark_retry (fallback update)

------------------------------------------------------------
# 4. Hard Validation (NO RETRY)
------------------------------------------------------------
Before verify, require non-empty:
- event_id
- event_type
- user_id
- schema_hash
- signature
- key_id

If invalid => set outbox:
- dispatch_status = DEAD
- last_dispatch_error = dead:invalid_fields_empty

------------------------------------------------------------
# 5. Canonical Envelope (MUST MATCH SIGNER)
------------------------------------------------------------
Verification reconstructs the signed envelope exactly:

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

Canonicalization rules:
- Keys sorted lexicographically
- Recursive normalization
- JSON.stringify result used as message bytes

IMPORTANT:
- occurred_at MUST be ISO8601 with milliseconds (.000Z)
- This must match sign-event normalization

------------------------------------------------------------
# 6. Public Key Resolution (World + key_id)
------------------------------------------------------------
Source of truth:
- personaos.world_signing_keys (through RPC)
Dispatcher MUST NOT read the table directly.

Dispatcher calls:
personaos.get_signing_public_key(p_world, p_key_id)

RPC contract:
- returns [] when:
  - key not found
  - key status is REVOKED
  - key is otherwise invalid
- returns [{ public_key: <base64_spki_der> }] when:
  - status is ACTIVE or RETIRED

Acceptance:
- ACTIVE => accepted
- RETIRED => accepted
Rejection:
- REVOKED => rejected (current spec; do not change)

------------------------------------------------------------
# 7. Signature Verification (STRICT / FAIL-CLOSED)
------------------------------------------------------------
Algorithm:
- Ed25519 verify
Public key format:
- Base64 SPKI DER preferred
- RAW base64 may be supported only if dispatcher implements fallback
  (current dispatcher uses SPKI->RAW fallback)

Verify:
- message = canonical string
- signature = base64
- verify false => DEAD (no retry)

If key not resolvable => DEAD (no retry)
Error surface:
- last_dispatch_error = verify_failed:<reason>
  examples:
  - verify_failed:unknown_or_invalid_key
  - verify_failed:invalid_signature

------------------------------------------------------------
# 8. Key Cache (World-scoped)
------------------------------------------------------------
Key cache key:
  `${world}::${key_id}`

TTL:
- 5 minutes

Notes:
- Cache is performance optimization only.
- DB/RPC is source of truth.
- With TTL, key rotation impacts propagate within TTL window.

------------------------------------------------------------
# 9. Apply & Idempotency
------------------------------------------------------------
After verify OK:
1) POST to PERSONA_APPLY_URL with x-internal-token
2) Accept:
   - 2xx
   - 409 (duplicate) as success
3) mark_event_done(p_event_id)

If apply or mark_done fails:
- attempt retry using civilization.mark_retry(p_schema, p_event_id, p_attempt)
- fallback update event_outbox (PENDING/DEAD by attempts)

------------------------------------------------------------
# 10. Observability (OPS Logs must remain)
------------------------------------------------------------
Required log events (JSON):
- run_start / run_complete
- control.read_ok / control.read_error
- worlds_loaded
- world_start / world_end
- claim.ok / claim.empty / claim.error
- event.start / event.end
- verify.trace (DEBUG: canonical_hash + preview)
- verify.result
- apply.result
- mark_done.error
- retry.rpc_error / retry.fatal

Must include:
- run_id
- world
- schema
- event_id
- key_id
- canonical_hash (when applicable)
- latency_ms (where applicable)

------------------------------------------------------------
# 11. Data Model Constraints
------------------------------------------------------------
Dispatcher MUST NOT assume these columns exist unless confirmed:
- event_outbox may NOT have: world, sig_head
Dispatcher should compute sig_head only for logs, not DB fields.

------------------------------------------------------------
# END OF SPEC
------------------------------------------------------------
