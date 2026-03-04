# ============================================================
# CIVILIZATION EVENT DISPATCHER
# Version 9.3.1 (World Key Verify + Ops Logs)
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Central event dispatcher for Civilization runtime.

Responsibilities:
- Claim events from world schemas
- Verify Ed25519 signatures (world-based key lookup)
- Apply events via Persona apply endpoint
- Mark done or retry
- Enforce fail-closed security
- Emit structured operational logs

---

## 2. Architectural Position

Civilization
→ Runtime Layer
→ Dispatcher Subsystem

Layer: runtime/dispatcher

---

## 3. High-Level Flow

1. Environment validation
2. Global control gate check (civilization.system_control)
3. Load enabled worlds
4. Per-world control gate check
5. Claim events (claim_rpc)
6. Per-event:
   - Field validation
   - Signature verification (world_signing_keys via RPC)
   - Apply via PERSONA_APPLY_URL
   - Mark done or retry
7. Emit run summary metrics

---

## 4. Security Model

### Fail-Closed Policy
If:
- Invalid fields
- Unknown key
- Invalid signature

→ Event marked DEAD immediately.

### Key Lookup
RPC:
personaos.get_signing_public_key(p_world, p_key_id)

Accept:
- ACTIVE
- RETIRED

Reject:
- REVOKED
- Not found

Cached per (world::key_id) with TTL.

### Signature
Algorithm:
Ed25519

Envelope canonicalized and hashed (SHA-256 logged).

---

## 5. Control Gates

Global:
civilization.system_control

Per-world:
<world_schema>.system_control

Keys:
- os_enabled
- dispatch_enabled

Disabled → halt processing.

---

## 6. Apply Phase

HTTP POST to:
PERSONA_APPLY_URL

Headers:
- x-internal-token

Success:
- 200 OK
- 409 treated as duplicate success

Failure:
→ retry logic

---

## 7. Retry Strategy

Primary:
civilization.mark_retry RPC

Fallback:
Direct update of event_outbox

Max attempts:
5

Status transition:
- PENDING
- DEAD (after max retry)

---

## 8. Observability

Structured JSON logs:

Fields:
- run_id
- world
- schema
- event_id
- canonical_hash
- latency metrics
- attempt counters

Log Levels:
DEBUG / INFO / WARN / ERROR / FATAL

---

## 9. Monitoring Integration

Works with:
runtime/monitoring/DEAD receiver

---

## 10. Failure Modes

- verify_failed → DEAD
- invalid_fields → DEAD
- apply HTTP failure → retry
- mark_done failure → retry

All fatal errors logged with run summary.

---

## 11. Non-Responsibilities

Dispatcher does NOT:
- Mutate business tables
- Generate events
- Manage SLA
- Handle governance approval
- Store keys directly

---

## 12. Version Notes

v9.3.1 Enhancements:
- World-based key lookup
- Ops logs restored
- Canonical debug trace
- Strict fail-closed verify
- World-aware key cache

---

# END
