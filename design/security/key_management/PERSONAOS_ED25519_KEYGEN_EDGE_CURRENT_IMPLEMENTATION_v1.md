# ============================================================
# PERSONAOS ED25519 KEY GENERATOR
# Current Implementation Snapshot (Edge Utility)
# ============================================================

## 1. Purpose

Generates a new Ed25519 keypair for PersonaOS signing infrastructure.

Used for:
- Initial key provisioning
- Key rotation
- Compromise recovery
- New world key issuance

Layer:
security/key_management

---

## 2. Execution Context

- Deno Edge Function
- Uses WebCrypto (crypto.subtle)
- Generates ephemeral keypair per execution
- Returns Base64 encoded artifacts

This is an administrative utility, not part of runtime dispatch flow.

---

## 3. Generated Artifacts

Response JSON:

{
  PERSONAOS_KEY_ID,
  PERSONAOS_ED25519_PRIVATE_KEY_PKCS8_B64,
  PERSONAOS_PUBLIC_KEY_RAW_B64,
  PERSONAOS_ISSUE_TOKEN
}

### Field Meaning

PERSONAOS_KEY_ID  
- "k_" + ISO timestamp  
- Unique identifier

PERSONAOS_ED25519_PRIVATE_KEY_PKCS8_B64  
- PKCS8 private key
- Base64 encoded
- MUST be stored securely

PERSONAOS_PUBLIC_KEY_RAW_B64  
- Raw public key
- Base64 encoded
- Insert into DB

PERSONAOS_ISSUE_TOKEN  
- UUID
- Used for issuance tracking / audit

---

## 4. Key Format

Algorithm: Ed25519

Private Key:
- PKCS8 export
- Base64 encoding

Public Key:
- RAW export
- Base64 encoding

---

## 5. Security Requirements

Private key:
- Never log
- Never commit to Git
- Store in secret manager or environment variable
- Rotate via state machine

Public key:
- Insert into:
    personaos.persona_signing_key
  or
    personaos.world_signing_keys

Issue token:
- Store in audit table if rotation tracked

---

## 6. Rotation Lifecycle (Recommended)

ACTIVE → RETIRED → REVOKED

Rules:
- Never delete keys
- Never reuse key_id
- Always audit transitions
- Dispatcher accepts ACTIVE + RETIRED
- Validation rejects REVOKED

---

## 7. Non-Responsibilities

This utility does NOT:
- Insert keys into DB
- Validate compatibility
- Sign events
- Verify events
- Rotate automatically

It only generates cryptographic material.

---

## 8. Risk Considerations

If private key leaks:
- Immediately mark key REVOKED
- Issue new key
- Update environment secrets
- Redeploy producer

---

# END
