# ============================================================
# PERSONA EVENT LOG LIST EDGE
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Retrieves persona event history for authenticated user.

Used by:
- Mobile client
- Persona dashboard
- Growth history UI

Layer:
lifecycle/history

---

## 2. Authentication Model

- JWT required (Authorization: Bearer)
- Validated using Supabase auth.getUser()
- user_id derived from JWT
- No body-based user_id accepted

Fail-closed if:
- Missing Authorization
- Invalid JWT

---

## 3. Input

Method: GET

Query params:

- persona_id (required)
- limit (default 50)
- offset (default 0)

---

## 4. Database Query

Schema:
personaos

Table:
persona_event_log

Selected columns:
- id
- event_type
- old_emotion
- new_emotion
- growth_delta
- created_at

Filters:
- persona_id
- user_id (JWT-derived)

Ordered:
created_at DESC

Pagination:
range(offset, offset + limit - 1)

---

## 5. Security Model

- JWT required
- user_id verified
- Cannot access other users' personas
- Service role used for DB access
- Ownership enforced via query filter

---

## 6. Failure Modes

401:
- Missing Authorization
- Invalid JWT

400:
- Missing persona_id

500:
- DB error
- Unexpected exception

200:
- Success

---

## 7. Non-Responsibilities

This endpoint does NOT:
- Modify persona
- Emit events
- Validate signatures
- Perform approval checks
- Trigger growth logic

It is read-only.

---

## 8. Architectural Role

Completes lifecycle visibility:

Create → Generate → Compose → Log → Retrieve

Provides user-facing audit trail.

---

## 9. Future Hardening

- Structured logging with traceId
- RLS-only enforcement (remove service role)
- Rate limiting
- Cursor-based pagination
- Filter by event_type

---

# END
