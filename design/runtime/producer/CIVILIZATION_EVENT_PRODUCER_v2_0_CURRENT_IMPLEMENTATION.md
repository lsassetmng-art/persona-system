# ============================================================
# CIVILIZATION EVENT PRODUCER
# Version 2.0 (PROD HARDENED)
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Generates signed events for Civilization runtime.

Responsibilities:
- Validate world against world_registry
- Emit event via world-specific emit_event RPC
- Canonicalize envelope
- Sign with Ed25519 private key
- Persist signature + key_id into event_outbox
- Enforce fail-closed behavior

---

## 2. Architectural Position

Civilization
→ Runtime Layer
→ Producer Subsystem

Layer: runtime/producer

Paired with:
runtime/dispatcher

---

## 3. High-Level Flow

1. Environment validation
2. Internal token validation
3. Parse request body
4. Validate required fields (world, event_type, user_id)
5. Validate world via civilization.world_registry
6. Call world schema emit_event RPC
7. Build canonical envelope
8. Sign with Ed25519 private key
9. Update event_outbox with signature + key_id
10. Return event_id

---

## 4. Security Model

### Internal Access Only
Requires:
x-internal-token header

### Fail-Closed
If:
- Missing env
- Invalid token
- World not found
- emit_event failure
- Signature update failure
→ Return 500 and stop

### Key Material
Private key:
PERSONAOS_ED25519_PRIVATE_KEY_PKCS8_B64

Key ID:
PERSONAOS_KEY_ID

Signature stored in:
event_outbox.signature
event_outbox.key_id

---

## 5. World Validation

Source:
civilization.world_registry

Conditions:
- world_key match
- is_enabled = true

World determines:
schema_name

---

## 6. Event Emission

RPC:
<world_schema>.emit_event

Returns:
event_id
event_version
schema_hash
occurred_at

Producer does NOT:
- Mutate business tables
- Directly insert into event_outbox

---

## 7. Canonical Envelope

Signed structure:

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

Sorted keys (deterministic canonical JSON).

---

## 8. Signature

Algorithm:
Ed25519

Process:
- Import PKCS8 private key
- Sign canonical string
- Base64 encode
- Update event_outbox

Update must affect exactly 1 row.

---

## 9. Observability

Structured JSON logs:

Fields:
- run_id
- world
- event_id
- canonical_length
- latency_ms
- stage

Log levels:
DEBUG / INFO / WARN / ERROR / FATAL

---

## 10. Failure Modes

- missing_env → FATAL
- invalid_token → 403
- invalid_json → 400
- world_not_found → 400
- emit_return_empty → FATAL
- update_failed → FATAL

All failures are fail-closed.

---

## 11. Non-Responsibilities

Producer does NOT:
- Dispatch events
- Retry events
- Verify signatures
- Manage control gates
- Handle SLA
- Perform monitoring

Those belong to:
runtime/dispatcher

---

## 12. Version Notes

v2.0 Enhancements:
- Structured logs
- world_registry validation
- Canonical trace
- Row-count enforced update
- Latency metrics
- Fail-Closed enforcement

---

# END
