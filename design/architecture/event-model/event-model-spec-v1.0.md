# ============================================================
# Civilization OS
# Event Model Specification
# Version: v1.0
# Status: CANONICAL
# ============================================================

## 0. Purpose

Defines the structural and lifecycle model of events in Civilization OS.

This spec is independent from cryptographic signing spec.

Applies to:
- event_outbox
- world schemas
- civ-dispatcher
- persona apply engine

------------------------------------------------------------
# 1. Event Philosophy
------------------------------------------------------------

Events are:

✔ Immutable
✔ Append-only
✔ World-scoped
✔ Idempotent
✔ Auditable

Events represent facts, not commands.

------------------------------------------------------------
# 2. Core Fields (event_outbox)
------------------------------------------------------------

Required columns:

- event_id (uuid)
- user_id (uuid)
- event_type (text)
- event_version (int)
- payload (jsonb)
- schema_hash (text)
- occurred_at (timestamptz)
- created_at (timestamptz)
- signature (text)
- key_id (text)

Dispatch tracking:

- dispatch_status (text)
- dispatch_attempts (int)
- next_retry_at (timestamptz)
- dispatched_at (timestamptz)
- last_dispatch_error (text)

------------------------------------------------------------
# 3. Event Lifecycle
------------------------------------------------------------

CREATED
  ↓
SIGNED
  ↓
INSERTED INTO event_outbox
  ↓
CLAIMED BY DISPATCHER
  ↓
VERIFIED
  ↓
APPLIED
  ↓
DONE

Failure paths:

INVALID_FIELDS → DEAD
VERIFY_FAIL → DEAD
APPLY_FAIL → PENDING (retry)
MAX_RETRY → DEAD

------------------------------------------------------------
# 4. Dispatch Status Values
------------------------------------------------------------

PENDING
DONE
DEAD

Optional:
IN_PROGRESS (internal only)

Dispatcher controls transitions.

------------------------------------------------------------
# 5. Idempotency
------------------------------------------------------------

Idempotency key optional column:
  idempotency_key (text)

Dispatcher must treat:
  HTTP 409 from apply as success.

Event_id must be globally unique (UUID v4).

------------------------------------------------------------
# 6. World Isolation
------------------------------------------------------------

Each world:

- Has its own schema
- Has its own event_outbox
- Has its own claim_rpc
- Has its own apply logic

Worlds do NOT cross-write.

------------------------------------------------------------
# 7. Retry Model
------------------------------------------------------------

Backoff schedule (example):

Attempt 1: immediate
Attempt 2: +30s
Attempt 3: +120s
Attempt 4: +600s
Attempt 5: +1800s
> MAX_RETRY = 5

Beyond MAX_RETRY:
  dispatch_status = DEAD

------------------------------------------------------------
# 8. Schema Hash Contract
------------------------------------------------------------

schema_hash ensures:

- Payload compatibility
- Version safety
- Apply contract stability

Dispatcher does NOT interpret payload.
Apply engine validates schema_hash.

------------------------------------------------------------
# 9. Invariants
------------------------------------------------------------

✔ event_id immutable
✔ payload immutable
✔ signature immutable
✔ key_id immutable
✔ occurred_at immutable

No UPDATE allowed to core fields.

------------------------------------------------------------
# 10. Observability
------------------------------------------------------------

Each event processing must log:

- run_id
- world
- schema
- event_id
- attempt
- status transition
- latency

------------------------------------------------------------
# END OF SPEC
------------------------------------------------------------
