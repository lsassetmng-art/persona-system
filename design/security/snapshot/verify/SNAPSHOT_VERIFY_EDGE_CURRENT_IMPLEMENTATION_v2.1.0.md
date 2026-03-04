# ============================================================
# SNAPSHOT VERIFY EDGE (PersonaOS)
# PROD HARDENED v2.1.0
# ============================================================

Layer:
security / snapshot / verify

---

## 1. Purpose

Verifies integrity and validity of a Persona Snapshot.

This layer performs:

✔ Canonical JSON re-calculation  
✔ Snapshot hash re-calculation & DB match  
✔ Ed25519 signature verification  
✔ Key state validation  
✔ Revocation check  
✔ Expiration check  
✔ Structured production logging  
✔ Fail-Closed design  

This is the public trust validation boundary.

---

## 2. Input (POST JSON)

{
  snapshot: {
    snapshot_id,
    signature,
    key_id,
    ... other snapshot fields ...
  }
}

Required:
- snapshot_id
- signature
- key_id

---

## 3. Validation Flow

1️⃣ Method check (POST)  
2️⃣ Environment check  
3️⃣ Snapshot DB lookup  
4️⃣ Revocation check  
5️⃣ Canonical JSON recalculation  
6️⃣ Hash recalculation and DB comparison  
7️⃣ Key lookup  
8️⃣ Key state validation (active + not compromised)  
9️⃣ Ed25519 signature verification  
🔟 expires_at validation (if exists)  

---

## 4. Canonical Verification

- Remove `signature` field
- Canonicalize JSON (sorted keys)
- SHA-256 (Base64)
- Compare with DB snapshot_hash

Mismatch → invalid

---

## 5. Signature Verification

Algorithm:
Ed25519

Key source:
personaos.persona_signing_key.public_key (RAW Base64)

Must satisfy:
- is_active = true
- is_compromised = false

---

## 6. Revocation Handling

If:
persona_snapshot.is_revoked == true

Return:
{
  valid: false,
  reason: "revoked"
}

No further verification executed.

---

## 7. Expiration Handling

If snapshot.expires_at exists:

If current_time > expires_at:
Return:
{
  valid: false,
  reason: "expired"
}

---

## 8. Response Model

Valid:
{
  valid: true
}

Invalid:
{
  valid: false,
  reason: <string>
}

---

## 9. Failure Modes

405:
- Non-POST method

400:
- invalid_snapshot
- snapshot_not_found
- unknown_key

200 (valid=false):
- revoked
- expired
- invalid_signature
- hash_mismatch
- key_invalid_state

500:
- missing_env
- db_error
- internal_error

---

## 10. Architectural Position

Snapshot Lifecycle:

Issue
→ (optional revoke)
→ Verify (THIS LAYER)
→ External trust decision

This layer defines:

Whether a snapshot is cryptographically and logically valid.

---

## 11. Security Guarantees

✔ Deterministic canonical validation  
✔ Hash binding check  
✔ Signature authenticity  
✔ Key compromise detection  
✔ Revocation enforcement  
✔ Expiration enforcement  
✔ Fail-Closed behavior  

---

## 12. Non-Responsibilities

Does NOT:
- Modify snapshot
- Revoke snapshot
- Emit events
- Update persona state
- Issue new snapshots

Pure verification layer.

---

## 13. Future Hardening

- Rate limiting
- Public key cache layer
- Detached signature verification option
- Merkle proof validation
- Verifier audit log

---

## 14. Trust Model Summary

A snapshot is valid only if:

- Exists in DB
- Not revoked
- Hash matches canonical
- Signature valid
- Key active and not compromised
- Not expired

All checks must pass.

---

# END
