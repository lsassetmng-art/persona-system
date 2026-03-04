# ============================================================
# ERP ASSET PUBLISH REQUEST DECIDE EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function updates the decision status of an asset publish request.

It performs a direct UPDATE on:

    personaos.asset_publish_request

This function finalizes a publish request by changing status from:

    PENDING → APPROVED / REJECTED / CANCELLED

No RPC is used.

---

## 2. Endpoint Specification

### Method
Not restricted.
All HTTP methods accepted.

### Input (JSON Body)

{
  "request_id": string,
  "decided_by": string,
  "decision": "APPROVED" | "REJECTED" | "CANCELLED",
  "reason": string (optional)
}

Required:
- request_id
- decided_by
- decision

If missing required fields:
400 Bad Request

If decision not in allowed set:
400 Bad Request

---

## 3. Authentication Model

No JWT validation.
No Authorization header required.

Uses service_role key directly.

decided_by is trusted from request body.

---

## 4. Execution Flow

1. Create service_role client
2. Parse JSON body
3. Validate required fields
4. Validate decision enum
5. Execute UPDATE:

   UPDATE personaos.asset_publish_request
   SET
     status = decision,
     decided_at = now(),
     decided_by = decided_by,
     reason = reason
   WHERE
     request_id = :request_id
     AND status = 'PENDING'

6. Return:

   { ok: true }

---

## 5. Responsibility Boundary

Edge layer:
- Field presence validation
- Decision enum validation
- Direct UPDATE execution

Database layer:
- Constraint enforcement
- Data storage

No business validation beyond PENDING check.

---

## 6. Error Handling

- Missing required fields → 400
- Invalid decision → 400
- Update error → 500
- Unhandled exception → 500

No:
- 401/403 authentication
- ownership validation
- conflict (409) detection
- structured error classification
- logging

---

## 7. Security Properties

- Uses service_role key
- No authentication
- No role validation
- No ownership validation
- decided_by fully client-controlled

This function must not be publicly exposed.

---

## 8. Current Limitations

- No JWT validation
- No RLS enforcement
- No authorization control
- No audit logging
- No idempotency handling
- No check for rows affected
- No integration with governance approval system
- Direct table mutation (bypasses centralized workflow)

---

## 9. Architectural Position

ERP → Modules → Asset → Publish Request Decision

This function:
- Finalizes publish requests
- Does NOT integrate with ERP approval system
- Does NOT emit events
- Operates independently of governance layer

---

## 10. Architectural Risk Note

Direct UPDATE bypasses:

- Governance approval engine
- Centralized approval RPC
- SLA tracking
- Audit framework

Future refactor may require integration into governance workflow.

---

# END
