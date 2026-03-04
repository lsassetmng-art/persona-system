# ============================================================
# SNAPSHOT REVOKE EDGE (PersonaOS)
# Current Implementation Snapshot v1
# ============================================================

Layer:
security / snapshot / revoke

---

## 1. Purpose

Revokes an issued Persona Snapshot.

This layer:
- Marks snapshot as revoked
- Inserts revocation record
- Enables public revocation list update

This is the formal invalidation boundary.

---

## 2. Authentication

Header required:

x-internal-token

Must match:
INTERNAL_DISPATCH_TOKEN (env)

Service Role required.

Fail-Closed if invalid.

---

## 3. Input (POST JSON)

{
  snapshot_id,
  reason_code?  // default: "manual"
}

Required:
- snapshot_id

---

## 4. Flow

1️⃣ Validate method (POST)
2️⃣ Validate internal token
3️⃣ Load snapshot
4️⃣ If already revoked → return success
5️⃣ Update persona_snapshot.is_revoked = true
6️⃣ Insert into persona_snapshot_revocation table
7️⃣ Return result

---

## 5. Database Tables

personaos.persona_snapshot
personaos.persona_snapshot_revocation

---

## 6. Idempotency

If snapshot.is_revoked == true:
Returns:

{
  ok: true,
  already_revoked: true
}

No duplicate revocation insert attempt.

---

## 7. Failure Modes

400:
- snapshot_id missing

403:
- invalid token

404:
- snapshot_not_found

500:
- update failure
- insert failure
- unexpected exception

---

## 8. Architectural Position

Snapshot Lifecycle:

Issue
→ Revoke (THIS LAYER)
→ Public Revocation List
→ External Verifier

Revocation list endpoint depends on this table.

---

## 9. Security Model

- Internal only
- Service role
- No public access
- No reason detail leakage
- reason_code abstract only

---

## 10. Non-Responsibilities

Does NOT:
- Delete snapshot
- Validate signature
- Emit events
- Modify persona state
- Cascade to dispatcher

Pure revocation marker.

---

## 11. Future Hardening

- Transaction wrapping (update + insert)
- Audit logging
- Signed revocation anchor
- Soft-reason classification policy
- Role-based revoke authorization

---

## 12. Design Philosophy

Revocation must be:

✔ Explicit
✔ Traceable
✔ Publicly verifiable
✔ Non-destructive
✔ Idempotent

Snapshots are never deleted.
Only invalidated.

---

# END
