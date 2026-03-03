# ============================================================
# Civilization OS
# World Registry Specification
# Version: v1.0
# Status: CANONICAL
# ============================================================

## 0. Purpose

Defines how Civilization OS discovers and manages worlds dynamically.

Applies to:
- civilization.get_enabled_worlds()
- civ-dispatcher world loop
- world schema isolation
- runtime enable/disable control

------------------------------------------------------------
# 1. Concept of World
------------------------------------------------------------

A WORLD is:

✔ A logical execution boundary
✔ A database schema
✔ A signing authority scope
✔ An event processing unit

Examples:
  business
  life
  governance
  analytics

Each world is fully isolated.

------------------------------------------------------------
# 2. Registry Source of Truth
------------------------------------------------------------

Function:

civilization.get_enabled_worlds()

Returns:

- world_key (text)
- schema_name (text)
- claim_rpc (text)

Only worlds returned here are processed.

------------------------------------------------------------
# 3. Required World Properties
------------------------------------------------------------

Each world must have:

1) Dedicated schema
2) event_outbox table
3) claim_rpc function
4) mark_event_done RPC
5) system_control table
6) apply endpoint compatibility

------------------------------------------------------------
# 4. World Enable/Disable Logic
------------------------------------------------------------

Global control:
  civilization.system_control

Per-world control:
  <world_schema>.system_control

Required keys:

- os_enabled
- dispatch_enabled

Behavior:

If global disabled:
  Dispatcher halts entirely.

If world disabled:
  That world is skipped.

------------------------------------------------------------
# 5. claim_rpc Contract
------------------------------------------------------------

claim_rpc must:

- Accept batch size parameter (p_batch)
- Atomically claim rows
- Return claimed rows

Must prevent double-claim.

Return fields required:

- event_id
- event_type
- event_version
- schema_hash
- user_id
- occurred_at
- payload
- signature
- key_id

------------------------------------------------------------
# 6. mark_event_done Contract
------------------------------------------------------------

Function:

mark_event_done(p_event_id)

Must:

- Set dispatch_status = DONE
- Set dispatched_at timestamp

Must be idempotent.

------------------------------------------------------------
# 7. World Isolation Rules
------------------------------------------------------------

Dispatcher:

- Must NOT cross-read schemas
- Must bind supabase client to schema
- Must never assume table existence outside schema

World failure must NOT halt other worlds.

------------------------------------------------------------
# 8. Failure Isolation
------------------------------------------------------------

If claim_rpc fails:
  Log error
  Continue next world

If verification fails:
  DEAD only in that world

If apply fails:
  Retry only in that world

No global cascading failure allowed.

------------------------------------------------------------
# 9. World Lifecycle
------------------------------------------------------------

World creation steps:

1) Create schema
2) Create event_outbox
3) Create claim_rpc
4) Create mark_event_done
5) Add to registry
6) Enable system_control

World removal:

1) Disable dispatch_enabled
2) Drain pending events
3) Remove from registry

------------------------------------------------------------
# 10. Invariants
------------------------------------------------------------

✔ World = signing scope
✔ World = schema boundary
✔ World isolation mandatory
✔ Dispatcher must tolerate partial world failure

------------------------------------------------------------
# END OF SPEC
------------------------------------------------------------
