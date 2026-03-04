# ============================================================
# ERP ASSET PUBLISH REQUEST CREATE EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function creates a new asset publish request.

It performs a direct INSERT into:

    personaos.asset_publish_request

No RPC is used.

This function is ERP-internal.

---

## 2. Endpoint Specification

### Method
Not restricted.
All HTTP methods accepted.

### Input (JSON Body)

{
  "user_id": string,
  "persona_id": string (optional),
  "asset_schema": string,
  "asset_table": string,
  "asset_id": string | uuid,
  "reason": string (optional)
}

Required:
- user_id
- asset_schema
- asset_table
- asset_id

Optional:
- persona_id
- reason

If missing required fields:
400 Bad Request

---

## 3. Authentication Model

No JWT validation.
No Authorization header required.

Uses service_role key directly.

user_id is trusted from request body.

---

## 4. Execution Flow

1. Create service_role client
2. Parse JSON body
3. Validate required fields
4. Insert into:

   personaos.asset_publish_request

   {
     user_id,
     persona_id (nullable),
     asset_schema,
     asset_table,
     asset_id,
     status: "PENDING",
     reason (nullable)
   }

5. Return:

   { ok: true, request_id }

---

## 5. Responsibility Boundary

Edge layer:
- Field presence validation
- Direct insert execution

Database layer:
- Data storage
- Constraint enforcement
- Unique rules (if defined)
- Foreign key validation (if defined)

No business validation at Edge layer.

---

## 6. Error Handling

- Missing required fields → 400
- Insert error → 500
- Unhandled exception → 500

No:
- 401/403 handling
- structured error classification
- idempotency handling
- duplicate detection
- logging

---

## 7. Security Properties

- Uses service_role key
- No user authentication
- No ownership validation
- No RLS enforcement
- user_id fully client-controlled

This function must not be publicly exposed.

---

## 8. Current Limitations

- No JWT validation
- No schema whitelist validation
- No asset ownership validation
- No duplicate prevention
- No rate limiting
- No structured logging
- No integration event emission
- Direct table mutation (bypasses RPC governance)

---

## 9. Architectural Position

ERP → Modules → Asset → Publish Request Creation

This function:
- Creates publish request record
- Does NOT approve
- Does NOT integrate with governance approval system
- Does NOT emit events

---

## 10. Architectural Risk Note

Direct INSERT bypasses:

- Approval RPC layer
- Governance validation
- Centralized workflow engine

Future refactor may require migration to RPC-based creation.

---

# END
