# ============================================================
# ERP APPROVAL CREATE EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function creates a new approval request in ERP.

It is a thin HTTP wrapper around the database RPC:

    approval_create

This function is ERP-internal only.

It does NOT interact with:
- Persona
- Civilization
- Integration layer
- Event system

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
  "request_type": string,
  "reference_schema": string,
  "reference_table": string,
  "reference_id": string | uuid,
  "payload": object (optional, default {})
}

Required:
- request_type
- reference_schema
- reference_table
- reference_id

Optional:
- payload (default {})

Edge performs presence validation only.

No enum validation.
No schema whitelist validation.
No payload structure validation.

---

## 5. Execution Flow

1. Validate method == POST
2. Extract Authorization header
3. Create anon client (JWT validation)
4. Create admin client (service_role)
5. Resolve actor_id from JWT
6. Parse JSON body
7. Validate required fields
8. Call RPC:

   approval_create(
       p_request_type,
       p_reference_schema,
       p_reference_table,
       p_reference_id,
       p_payload,
       p_actor_id
   )

9. Return:

   { ok: true, request_id: data }

---

## 6. Responsibility Boundary

Edge layer:
- HTTP validation
- JWT validation
- Required field presence validation
- RPC delegation

Database RPC (approval_create):
- Business rule validation
- Duplicate prevention
- Schema whitelist enforcement
- Authorization checks
- State initialization
- Audit insertion

---

## 7. Error Handling

Edge handles:

- Method != POST → 405
- JWT failure → 401
- Missing required fields → 400
- RPC error → 500

No:
- 409 conflict mapping
- structured error classification
- logging
- retry logic

---

## 8. Security Properties

- service_role key never exposed
- actor_id trusted from Supabase auth
- direct DB mutation not allowed from client
- all business logic delegated to RPC

---

## 9. Current Limitations

- No whitelist validation for schema/table
- No request_type validation
- No payload size validation
- No structured audit logging
- No observability instrumentation
- No rate limiting

---

## 10. Architectural Position

ERP → Governance → Approval → approval_create RPC

This function creates approval records but does not execute approval decisions.

Decision execution is handled separately via:

    approval_act

---

# END
