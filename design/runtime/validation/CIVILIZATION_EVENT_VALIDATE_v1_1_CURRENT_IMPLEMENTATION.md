# ============================================================
# CIVILIZATION EVENT VALIDATE
# Version 1.1 (PROD HARDENED / FAIL-CLOSED)
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Validates event integrity before dispatch or integration.

Responsibilities:
- schema_hash strict verification
- compatibility registry validation
- Ed25519 signature verification
- Key state validation (active / not compromised)
- Fail-Closed enforcement

Layer: runtime/validation

---

## 2. Architectural Position

Civilization
→ Runtime Layer
→ Validation Subsystem

May be invoked by:
- Dispatcher (pre-apply)
- Integration Gate
- External ingestion layer

---

## 3. High-Level Flow

1. Method check (POST only)
2. Internal token validation
3. Parse request
4. Required field validation
5. Recompute schema_hash
6. Check event_compatibility_registry
7. Lookup signing key (personaos.persona_signing_key)
8. Verify Ed25519 signature
9. Return validation result

---

## 4. Security Model

### Fail-Closed

Return 422 for:
- Missing required fields
- schema_hash mismatch
- schema not registered
- key invalid
- invalid signature

Return 500 for:
- Database errors
- Infrastructure failures
- Unexpected exceptions

---

## 5. Schema Hash Validation

Recomputed as:

SHA256(
  event_type | event_version | canonical(payload)
)

Must match provided schema_hash.

Strict equality required.

---

## 6. Compatibility Registry

Source:
civilization.event_compatibility_registry

Conditions:
- event_type match
- event_version match
- schema_hash match
- is_enabled = true

If not found → reject (422)

---

## 7. Key Validation

Source:
personaos.persona_signing_key

Conditions:
- key_id match
- is_active = true
- is_compromised = false

If invalid → reject (422)

---

## 8. Signature Verification

Algorithm:
Ed25519

Key import:
- SPKI preferred
- RAW fallback

Signed envelope:

{
  event_type,
  event_version,
  schema_hash,
  key_id,
  payload
}

Canonical JSON required.

---

## 9. Observability

Structured logs include:
- run_id
- trace_id
- event_type
- version
- latency_ms
- failure reasons

Log levels:
INFO / WARN / ERROR / FATAL

---

## 10. Non-Responsibilities

Validation layer does NOT:
- Dispatch events
- Apply business logic
- Retry failures
- Manage world control gates
- Emit new events

Those belong to:
runtime/dispatcher
runtime/producer

---

## 11. Failure Modes

422:
- missing_required
- schema_hash_mismatch
- schema_not_registered
- key_invalid
- invalid_signature

500:
- registry_db_error
- key_db_error
- internal_error

---

## 12. Version Notes

v1.1 Enhancements:
- Strict schema_hash enforcement
- Mandatory compatibility registry
- Ed25519 verification hardened
- Fail-Closed design
- Structured logs with latency metrics

---

# END
