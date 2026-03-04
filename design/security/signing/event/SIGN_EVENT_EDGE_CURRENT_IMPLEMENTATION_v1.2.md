# ============================================================
# SIGN EVENT EDGE (PersonaOS)
# v1.2 PROD LOG HARDENED
# ============================================================

Layer:
security / signing / event

---

## 1. Purpose

Signs event envelope before dispatch.

This is the cryptographic boundary between:
- Event Producer
- Dispatcher

Ensures:
✔ Canonical integrity
✔ ISO timestamp normalization
✔ Ed25519 signature
✔ Audit trace

---

## 2. Authentication

- x-internal-token required
- No public access
- Service Role DB usage

Fail-Closed if:
- Missing env
- Invalid token
- Missing signing key

---

## 3. Input (POST JSON)

Required fields:

- world
- schema
- event_id
- event_type
- event_version
- schema_hash
- user_id
- occurred_at
- payload

occurred_at:
Normalized to ISO8601 via:

new Date(raw).toISOString()

Ensures dispatcher match.

---

## 4. Signing Key Resolution

1. Lookup active key from:

personaos.world_signing_keys

WHERE:
- world = world
- status = ACTIVE
ORDER BY created_at DESC

2. Load private key from:

SIGNING_PRIVATE_KEYS_JSON (env)

Mapping:
{
  key_id: pkcs8_private_key_base64
}

---

## 5. Canonical Envelope

{
  schema,
  world,
  event_id,
  event_type,
  event_version,
  schema_hash,
  user_id,
  occurred_at (ISO normalized),
  payload
}

Sorted-key canonical JSON.

SHA256 hash generated.

---

## 6. Signature

Algorithm:
Ed25519

Private Key:
PKCS8 Base64

Output:
Base64 signature

---

## 7. Audit Log

Table:
personaos.sign_log

Fields:
- run_id
- world
- event_id
- key_id
- canonical_hash
- created_at

If audit insert fails:
Fail-Closed (500)

---

## 8. Output

{
  ok: true,
  key_id,
  canonical_hash,
  signature
}

---

## 9. Failure Modes

400:
- validation error
- missing fields
- no active key

403:
- invalid token

500:
- DB error
- signing failure
- audit failure
- missing private key

---

## 10. Architectural Position

Producer
→ sign-event (THIS LAYER)
→ validate
→ dispatch
→ state-apply

This is the cryptographic trust anchor.

---

## 11. Production Guarantees

✔ Canonical JSON
✔ Deterministic hashing
✔ ISO timestamp normalization
✔ World-scoped key selection
✔ Audit trail persistence
✔ Fail-Closed security

---

## 12. Non-Responsibilities

Does NOT:
- Mutate persona state
- Validate schema compatibility
- Emit events
- Dispatch externally
- Perform approval

Pure signing layer.

---

# END
