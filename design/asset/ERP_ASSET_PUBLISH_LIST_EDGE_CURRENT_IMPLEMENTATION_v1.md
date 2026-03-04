# ============================================================
# ERP ASSET PUBLISH LIST EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function retrieves pending asset publish requests for a specific user.

It queries:

    asset_publish_request

Filtered by:
    status = 'PENDING'
    user_id = provided query parameter

This function is ERP-internal.

---

## 2. Endpoint Specification

### Method
Not restricted.
All HTTP methods are accepted.

### Input

Query parameter:

    user_id (required)

If missing:
400 Bad Request

---

## 3. Authentication Model

No JWT validation.
No Authorization header required.

Uses service_role key directly.

Assumes restricted internal access.

---

## 4. Execution Flow

1. Create service_role client
2. Extract user_id from URL query
3. Validate presence of user_id
4. Execute query:

   SELECT *
   FROM asset_publish_request
   WHERE status = 'PENDING'
     AND user_id = :user_id
   ORDER BY requested_at DESC

5. Return:

   { ok: true, items: data }

---

## 5. Responsibility Boundary

Edge layer:
- Query parameter validation
- Direct DB query

Database layer:
- Data storage
- Status management
- Access policy (if any RLS configured)

---

## 6. Error Handling

- Missing user_id → 400
- Query error → 500
- Unhandled exception → 500

No:
- 401/403 authentication enforcement
- structured error classification
- logging
- rate limiting

---

## 7. Security Properties

- Uses service_role key
- No user authentication validation
- user_id is client-provided and trusted
- No ownership validation
- No RLS enforcement at Edge level

This function must not be publicly exposed.

---

## 8. Current Limitations

- No JWT verification
- No authorization check (user may query arbitrary user_id)
- No pagination
- No limit control
- No structured logging
- No audit tracking
- No observability metrics

---

## 9. Architectural Position

ERP → Modules → Asset → Publish Request Query

This function:
- Reads approval-like publish requests
- Does NOT create publish requests
- Does NOT update status
- Does NOT integrate with Persona

---

## 10. Operational Assumptions

- Invoked by internal admin UI or system
- External exposure considered unsafe
- RLS not enforced here

---

# END
