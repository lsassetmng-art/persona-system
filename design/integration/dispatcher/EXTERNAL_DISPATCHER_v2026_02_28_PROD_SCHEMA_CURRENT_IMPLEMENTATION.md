# ============================================================
# EXTERNAL DISPATCHER
# Version: 2026-02-28.PROD.SCHEMA
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Dispatch integration events to external OS targets.

Responsibilities:
- Read actor_route_queue
- Resolve external target
- HMAC-sign outbound payload
- POST to external endpoint
- Mark route done or retry

Layer: integration/dispatcher

---

## 2. Architectural Position

Persona-System
→ Integration Layer
→ External Dispatcher

Schema fixed:
integration

This dispatcher does NOT belong to:
- runtime/producer
- runtime/dispatcher
- runtime/validation

It operates in the Integration boundary.

---

## 3. High-Level Flow

1. Query integration.actor_route_queue
   WHERE status = 'PENDING'
   LIMIT 20

2. For each route:
   - Resolve external_target_registry by target_key
   - Build JSON body:
       {
         event_id,
         action_key,
         payload
       }
   - Generate HMAC-SHA256 signature
   - POST to target.endpoint_url
   - If HTTP 2xx:
       call mark_route_done
     else:
       call mark_route_retry

3. Complete run

---

## 4. Security Model

### Execution
- service_role only
- schema fixed to integration

### Outbound Security
- HMAC-SHA256
- Shared secret per external target
- Signature header: x-signature

### No inbound authentication required
Triggered by scheduler / internal cron.

---

## 5. Database Objects Used

Tables:
- integration.actor_route_queue
- integration.external_target_registry

RPC:
- integration.mark_route_done
- integration.mark_route_retry

---

## 6. Observability

Structured logs include:
- runId
- routeId
- event_id
- HTTP status
- error messages

Levels:
INFO / WARN / ERROR / FATAL

---

## 7. Retry Logic

If HTTP failure:
→ mark_route_retry RPC

If exception:
→ log only (no automatic DB update beyond RPC failure)

Retry policy managed by DB layer.

---

## 8. Failure Modes

- SELECT_FAIL → 500
- TARGET_NOT_FOUND → log error, continue
- HTTP non-2xx → retry
- Route exception → log error
- Dispatcher crash → 500

Fail-open at route level, fail-closed at run level.

---

## 9. Non-Responsibilities

Dispatcher does NOT:
- Validate event signatures
- Apply business logic
- Emit civilization events
- Manage SLA
- Perform schema compatibility validation

Those belong to:
runtime/validation
runtime/dispatcher

---

## 10. Version Notes

v2026-02-28.PROD.SCHEMA
- integration schema fixed
- full structured logging
- service_role enforced
- HMAC outbound signing
- production hardened logging

---

# END
