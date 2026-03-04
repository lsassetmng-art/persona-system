# ============================================================
# PERSONA SNAPSHOT REVOCATION LIST EDGE
# Current Implementation Snapshot (Public Endpoint)
# ============================================================

Layer:
security / revocation

---

## 1. Purpose

Provides public revocation list for Persona Snapshots.

Used by:
- External verifiers
- Client apps
- Marketplace
- Public validation services

This endpoint exposes which snapshot_ids have been revoked.

---

## 2. Endpoint Characteristics

Method:
GET

Authentication:
None (Public endpoint)

Caching:
- ETag supported
- Cache-Control: public, max-age=300
- 304 returned if ETag matches

---

## 3. Data Source

Schema:
personaos

Table:
persona_snapshot_revocation

Selected fields:
- snapshot_id
- persona_id
- reason_code (abstract only)
- revoked_at

Ordered:
revoked_at DESC

Limit:
5000 rows

---

## 4. Response Format (Phase1 Fixed Schema)

{
  schema_version: "1.0",
  purpose: "personaos_revocation_list",
  issued_at: ISO_TIMESTAMP,
  count: number,
  revoked: [
    {
      snapshot_id,
      persona_id,
      reason_code,
      revoked_at
    }
  ]
}

Stable format. Versioned.

---

## 5. Security Model

- Public read-only
- Service role used internally
- No sensitive fields exposed
- reason_code is abstract classification only

Does NOT expose:
- internal audit logs
- user_id
- private reason text
- investigation metadata

---

## 6. Cache Strategy

Weak ETag generated from body hash.
Supports:

If-None-Match

Cache-Control:
public, max-age=300

Goal:
Reduce repeated verification traffic.

---

## 7. Architectural Role

Snapshot Lifecycle:

Create Snapshot
→ Publish Snapshot
→ Revoke Snapshot (if needed)
→ Revocation List (THIS LAYER)

This layer enables:

Trust without direct database access.

---

## 8. Failure Modes

405:
- Non-GET method

500:
- DB error
- Missing environment variables
- Unexpected exception

304:
- ETag matched

200:
- Success

---

## 9. Non-Responsibilities

This endpoint does NOT:

- Revoke snapshots
- Validate snapshot signatures
- Emit events
- Authenticate users

It only publishes revocation state.

---

## 10. Future Hardening

- Signed revocation list (optional)
- Pagination support
- Incremental delta feed
- CDN integration
- Separate internal/private revocation reason storage

---

## 11. Design Philosophy

Public trust layer.

Minimal.
Deterministic.
Versioned.
Cacheable.
Non-sensitive.

---

# END
