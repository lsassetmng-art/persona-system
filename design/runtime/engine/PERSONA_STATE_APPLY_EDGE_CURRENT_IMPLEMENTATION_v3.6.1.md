# ============================================================
# PERSONA STATE APPLY EDGE
# Civilization v3.6.1 (PROD AUDIT SIGNED)
# ============================================================

Layer:
runtime / engine

---

## 1. Purpose

Applies incoming signed event to persona state.

Responsibilities:
- Idempotent growth insertion
- Event registry lookup
- Severity → magnitude mapping
- Apply engine RPC execution
- Snapshot trigger
- Signed audit log

This is the core state mutation layer.

---

## 2. Security Model

- x-internal-token required
- Service Role used
- Fail-Closed control gate
- Idempotency enforced via growth_events
- Audit log signed (Ed25519)

Control flags:
- os_enabled
- apply_enabled

---

## 3. Flow

1. Validate env
2. Validate internal token
3. Parse body
4. Load system_control
5. Idempotency check
6. Load event_registry
7. Lookup persona
8. Insert growth_events (NOT NULL compliant)
9. Call apply_event_engine RPC
10. Mark processed
11. Snapshot (best-effort)
12. Write signed audit log

---

## 4. Database Tables Used

personaos.system_control
personaos.growth_events
personaos.event_registry
personaos.personas
personaos.apply_run_log

---

## 5. Idempotency

Key:
event_id

Duplicate detection:
- is_processed
- processed_at

409 returned on duplicate.

---

## 6. Growth Rules

- magnitude = event_registry.severity
- clamped 1..100
- axis_deltas applied via RPC
- event_version stored in context

---

## 7. Snapshot

POST to SNAPSHOT_ISSUE_URL
Best-effort only.
Failure does not break apply.

---

## 8. Audit Logging

Table:
personaos.apply_run_log

Fields:
- run_id
- event_id
- event_type
- stage
- ok
- http_status
- error_message
- log_hash
- log_signature
- log_key_id

Signature:
Ed25519 PKCS8

Signing is best-effort.
Never blocks apply.

---

## 9. Failure Modes

400:
- invalid_json
- missing_required
- event_not_enabled

403:
- invalid internal token

404:
- persona_not_found

409:
- duplicate

500:
- registry failure
- insert failure
- engine failure
- mark_processed failure

503:
- apply halted via system_control

---

## 10. Architectural Position

Event Flow:

Producer
→ Validator
→ Dispatcher
→ State Apply (THIS LAYER)
→ Snapshot
→ External Dispatch

This is the authoritative state mutation boundary.

---

## 11. Production Guarantees

✔ Fail-Closed
✔ Idempotent
✔ Retry Safe
✔ Signed Audit Trail
✔ Snapshot Isolation
✔ Control Gate Enabled

---

# END
