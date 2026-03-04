# ============================================================
# PERSONAOS PUBLIC KEYSET ENDPOINT
# Current Implementation Snapshot (Edge)
# ============================================================

## 1. Purpose

Provides a list of active, non-compromised public signing keys.

This endpoint functions similarly to a JWKS endpoint
for Ed25519-based signature verification.

Layer:
security/key_distribution

---

## 2. Endpoint Behavior

Method: GET

Returns:

{
  schema_version,
  purpose,
  signature_scheme,
  alg,
  issued_at,
  current_key_id,
  keys: [...]
}

---

## 3. Data Source

Schema:
personaos

Table:
persona_signing_key

Query Conditions:
- is_active = true
- is_compromised = false
- Ordered by created_at DESC

---

## 4. Response Structure

schema_version: "1.0"

purpose:
"personaos_public_keys"

signature_scheme:
"Ed25519"

alg:
"EdDSA"

current_key_id:
Newest active key

keys[]:
{
  key_id,
  kty: "OKP",
  crv: "Ed25519",
  use: "sig",
  public_key,
  created_at,
  retired_at
}

---

## 5. Security Model

- Public key only
- No private material exposed
- Only active + non-compromised keys returned
- Service role required for DB access

---

## 6. Trust Chain Role

Producer:
Signs with active key

Validator:
Fetches keyset
Selects matching key_id
Verifies signature

If key missing:
→ validation fails (fail-closed)

---

## 7. Failure Modes

405:
Method not allowed

500:
Missing environment variables
Database errors
Unhandled exception

200:
Success

---

## 8. Non-Responsibilities

This endpoint does NOT:
- Rotate keys
- Change key state
- Issue new keys
- Revoke keys

It only exposes active signing keys.

---

## 9. Federation Consideration

Can be used by:
- External validators
- Multi-world federation
- Cross-civilization verification

Future upgrade:
May evolve into formal JWKS endpoint.

---

# END
