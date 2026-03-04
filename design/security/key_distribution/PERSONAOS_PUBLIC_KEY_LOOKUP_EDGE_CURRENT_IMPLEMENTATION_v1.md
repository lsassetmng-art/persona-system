# ============================================================
# PERSONAOS PUBLIC KEY LOOKUP ENDPOINT
# Current Implementation Snapshot (Edge)
# ============================================================

## 1. Purpose

Provides public key discovery endpoint for signature verification.

Used by:
- External validators
- Integration partners
- Federation nodes
- Internal validation layers

Layer:
security/key_distribution

---

## 2. Endpoint Behavior

Method: GET  
Query param:
- key_id (required)

Returns:
{
  success: true,
  key: {
    key_id,
    kty: "OKP",
    crv: "Ed25519",
    use: "sig",
    public_key,
    is_active,
    is_compromised,
    created_at,
    retired_at
  }
}

---

## 3. Data Source

Table:
personaos.persona_signing_key

Selected fields:
- key_id
- public_key
- is_active
- is_compromised
- created_at
- retired_at

---

## 4. Security Model

- Public key only
- No private material exposed
- Compromise flag is intentionally public
  (verifier protection)

Database connection:
Direct postgres (npm:postgres)

Requires:
PERSONA_SUPABASE_URL env

---

## 5. Response Semantics

400:
- missing key_id

404:
- not_found

500:
- infra error

200:
- success

---

## 6. Trust Chain Role

Producer signs events.
Validator verifies signature.
If key unknown:
→ call this endpoint
→ fetch public key
→ verify
→ check is_active + is_compromised

---

## 7. Non-Responsibilities

This endpoint does NOT:
- Rotate keys
- Modify key state
- Issue keys
- Revoke keys

It only exposes public metadata.

---

## 8. Version Notes

Implementation:
- Deno Edge
- npm:postgres@3.4.3
- Direct SQL query
- No ORM
- Prepared disabled

---

# END
