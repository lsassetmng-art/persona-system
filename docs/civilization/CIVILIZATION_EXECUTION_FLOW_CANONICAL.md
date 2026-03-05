# ============================================================
# CIVILIZATION EXECUTION FLOW (CANONICAL)
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization Runtime の「実行順序」を固定する。

------------------------------------------------------------
GLOBAL EXECUTION FLOW
------------------------------------------------------------

Scheduler
   ↓
Tick Engine
   ↓
Event Generation
   ↓
Dispatcher
   ↓
Apply Engine
   ↓
Checkpoint
   ↓
Snapshot
   ↓
Monitoring / Metrics

------------------------------------------------------------
STEP 1: Scheduler
------------------------------------------------------------

Responsible for triggering simulation cycles.

Responsibilities:

- determine run schedule
- select world instances
- prevent starvation
- enforce runtime gates

Rules:

Scheduler never mutates state.

------------------------------------------------------------
STEP 2: Tick Engine
------------------------------------------------------------

Tick Engine advances simulation time.

tick++

Triggers:

- population updates
- economy rebalance
- diplomacy updates
- war escalation

Tick produces WORLD_EVENT only.

------------------------------------------------------------
STEP 3: Event Generation
------------------------------------------------------------

Simulation engines emit events.

Examples:

PopulationDeltaEvent
EconomyDeltaEvent
WarPhaseEvent
MigrationEvent

Rules:

- events must follow EVENT_STANDARD
- schema_hash required
- versioned contract required

------------------------------------------------------------
STEP 4: Dispatcher
------------------------------------------------------------

Dispatcher routes events to apply engine.

Responsibilities:

- claim events
- verify signature
- validate schema
- ensure idempotency

Failure handling:

invalid_signature → DEAD  
schema_mismatch → DEAD  
runtime_error → RETRY  

------------------------------------------------------------
STEP 5: Apply Engine
------------------------------------------------------------

Only component allowed to mutate state.

Responsibilities:

- apply event effects
- update simulation state
- produce follow-up events if necessary

Rules:

- idempotent execution
- fail-closed validation

------------------------------------------------------------
STEP 6: Checkpoint
------------------------------------------------------------

Checkpoint saves deterministic state snapshot.

Purpose:

- recovery
- replay
- audit

Frequency:

- periodic
- after major state transitions

------------------------------------------------------------
STEP 7: Snapshot
------------------------------------------------------------

Persona Snapshot generation.

Properties:

- immutable
- signed (Ed25519)
- canonical JSON

Snapshots represent identity state at a moment in time.

------------------------------------------------------------
STEP 8: Monitoring
------------------------------------------------------------

Observability layer.

Tracks:

- queue depth
- retry rate
- dead events
- checkpoint success
- runtime health

------------------------------------------------------------
FAILURE SAFETY
------------------------------------------------------------

Principles:

fail-closed
no silent fallback
idempotent replay

Dispatcher crash → safe restart  
Replay mismatch → halt  

------------------------------------------------------------
END
------------------------------------------------------------
