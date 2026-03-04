# ============================================================
# ERP APPROVAL EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function exposes ERP approval workflow over HTTP.

It acts as a thin HTTP wrapper around the database RPC:

    approval_act

The function is ERP-internal only.
It does NOT integrate with Persona or Civilization.

---

## 2. Endpoint Specification

### Method
POST only

Other methods return:
405 Method Not Allowed

---

## 3. Authentication Model

- Authorization header required
- JWT validated via anon client
- actor_id derived from JWT (u.user.id)
- actor_id is NOT accepted from request body

If JWT invalid:
401 Unauthorized

---

## 4. Request Payload

{
  "request_id": string,
  "action": string,
  "comment": string (optional, default "")
}

Validation:
- request_id required
- action required
- No enum validation performed at Edge level

---

## 5. Execution Flow

1. Validate method
2. Extract Authorization header
3. Create anon client (JWT verification)
4. Create admin client (service_role)
5. Resolve actor_id from JWT
6. Parse JSON body
7. Call RPC:

   approval_act(
       p_request_id,
       p_actor_id,
       p_action,
       p_comment
   )

8. Return RPC result as JSON

---

## 6. Responsibility Boundary

Edge layer:
- HTTP validation
- JWT validation
- RPC delegation

Database RPC (approval_act):
- Business logic
- State transition validation
- Idempotency control
- Authorization logic

---

## 7. Error Handling

Edge handles:

- Method != POST → 405
- JWT failure → 401
- Missing request_id or action → 400
- RPC error → 500

No:
- 409 conflict mapping
- structured error classification
- retry logic
- logging

---

## 8. Security Properties

- service_role key never exposed
- actor_id trusted from Supabase auth
- direct DB mutation from client not allowed

---

## 9. Current Limitations

- No action whitelist validation
- No structured audit logging
- No idempotency guard at Edge layer
- No conflict status mapping
- No integration event emission
- No observability instrumentation

---

## 10. Architectural Position

ERP → Governance → Approval → RPC

This function does NOT interact with:
- ERP integration layer
- Event system
- Persona/Civilization

---

# END
