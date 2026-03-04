# ============================================================
# ERP APPROVAL SLA TICK EDGE DESIGN
# Current Implementation Snapshot v1
# ============================================================

## 1. Overview

This Edge Function executes SLA processing for approval requests.

It calls the database RPC:

    approval_sla_tick(p_limit)

This function is intended for:
- Scheduled execution (Cron)
- Background maintenance

It is not user-facing.

---

## 2. Endpoint Specification

### Method
Not validated.
All HTTP methods are accepted.

### Authentication
No JWT validation.
No Authorization header required.

This function assumes restricted deployment access.

---

## 3. Execution Flow

1. Create service_role client
2. Call:

   approval_sla_tick(p_limit = 50)

3. Return RPC result as JSON

---

## 4. RPC Call

admin.rpc("approval_sla_tick", {
    p_limit: 50
})

p_limit:
Maximum number of approval records processed per execution.

---

## 5. Responsibility Boundary

Edge layer:
- RPC invocation only
- Error wrapping

Database RPC (approval_sla_tick):
- SLA evaluation
- Deadline detection
- Status transition
- Escalation logic
- Audit insertion

All business logic is delegated to database layer.

---

## 6. Error Handling

- RPC error → 500
- No structured error classification
- No retry logic
- No logging

---

## 7. Security Properties

- Uses service_role key
- No authentication validation
- Intended to be invoked by:
    - Supabase Cron
    - Internal scheduler
- Must not be publicly exposed

---

## 8. Current Limitations

- No method restriction
- No internal token validation
- No structured logging
- No rate limiting
- No observability instrumentation
- No SLA metrics output

---

## 9. Architectural Position

ERP → Governance → Approval → SLA Processing

This function operates independently of:

- approval_create
- approval_act
- Integration layer
- Persona/Civilization

---

## 10. Operational Assumptions

- Invocation frequency controlled externally
- Idempotency handled by RPC
- Concurrency handled at database layer

---

# END
