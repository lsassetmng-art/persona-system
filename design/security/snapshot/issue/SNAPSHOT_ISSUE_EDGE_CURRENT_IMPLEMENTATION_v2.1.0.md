# ============================================================
# SNAPSHOT ISSUE EDGE (PersonaOS)
# PROD HARDENED v2.1.0
# ============================================================

Layer:
security / snapshot / issue

---

## 1. Purpose

Issues a signed Persona Snapshot.

This layer:
- Generates snapshot_id
- Canonicalizes snapshot body
- Hashes snapshot
- Signs snapshot (Ed25519)
- Persists snapshot to DB

This is the cryptographic identity freeze point.

---

## 2. Authentication

Header required:

x-personaos-issue-token

Must match:
PERSONAOS_ISSUE_TOKEN (env)

Fail-Closed if invalid.

No public access.

---

## 3. Input (POST JSON)

{
  persona_id,
  snapshot: {
    schema_version,
    ... arbitrary snapshot payload ...
  }
}

Required:
- persona_id
- snapshot.schema_version

---

## 4. Snapshot Construction

Server adds:

- snapshot_id (UUID)
- persona_id
- issued_at (ISO8601)
- key_id (from env)

Resulting canonical body:

{
  ...snapshotInput,
  snapshot_id,
  persona_id,
  issued_at,
  key_id
}

---

## 5. Canonicalization

Sorted-key JSON normalization.

Used for:
- Hash calculation
- Signature generation

---

## 6. Hash

Algorithm:
SHA-256

Output:
Base64-encoded digest

Stored as:
snapshot_hash

---

## 7. Signature

Algorithm:
Ed25519

Private key:
PERSONAOS_ED25519_PRIVATE_KEY_PKCS8_B64

Output:
Base64 signature

Stored as:
signature

---

## 8. Database Insert

Schema:
personaos

Table:
persona_snapshot

Inserted fields:

- snapshot_id
- persona_id
- schema_version
- issued_at
- snapshot_json
- snapshot_hash
- signature
- key_id
- is_revoked (false)

Fail-Closed if insert fails.

---

## 9. Output

{
  success: true,
  snapshot: {
    ...snapshotBody,
    signature,
    snapshot_hash
  }
}

---

## 10. Failure Modes

400:
- Invalid payload
- Missing schema_version

401:
- Invalid issue token

405:
- Non-POST method

500:
- DB insert failure
- Signing failure
- Unexpected exception

---

## 11. Architectural Position

State Apply
→ Snapshot Issue (THIS LAYER)
→ Public Verification
→ Revocation List

This is the formal persona state freeze boundary.

---

## 12. Security Guarantees

✔ Canonical deterministic structure
✔ Hash integrity binding
✔ Ed25519 signature
✔ Key ID binding
✔ Revocation-ready design
✔ Fail-Closed auth
✔ No client-controlled key selection

---

## 13. Non-Responsibilities

Does NOT:
- Revoke snapshots
- Validate snapshots
- Dispatch events
- Modify persona state

Pure issuance layer.

---

## 14. Future Hardening

- Key rotation support
- Snapshot version migration layer
- Delta snapshot support
- Merkle batching (optional)
- Signed revocation anchor

---

# END
