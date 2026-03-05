# ============================================================
# CIVILIZATION OS ARCHITECTURE MAP
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS 全体構造を一枚で理解するための設計図。

------------------------------------------------------------
GLOBAL STRUCTURE
------------------------------------------------------------

                +----------------------+
                |     CONSTITUTION     |
                | 000_FULL_CANONICAL   |
                +----------+-----------+
                           |
                           v

                +----------------------+
                |      ARCHITECTURE    |
                |  Master Structure    |
                +----------+-----------+
                           |
                           v

                +----------------------+
                |        RUNTIME       |
                | Dispatcher / Tick   |
                +----------+-----------+
                           |
                           v

                +----------------------+
                |     EVENT SYSTEM     |
                | EVENT_STANDARD_V2    |
                +----------+-----------+
                           |
                           v

------------------------------------------------------------
PERSONA SYSTEM
------------------------------------------------------------

persona-system
│
├── core
│   ├── persona_state
│   ├── axis_engine
│   └── apply_engine
│
├── civilization
│   ├── dispatcher
│   ├── retry
│   └── routing
│
├── integration
│   ├── signature_verify
│   └── interface_event_ingest
│
├── snapshot
│   └── canonical_snapshot
│
└── expression-layer
    ├── visual
    └── voice

Rules:

worlds emit WORLD_EVENT only  
core mutates persona_state only

------------------------------------------------------------
CIVILIZATION SIMULATION LAYER
------------------------------------------------------------

civilization/

simulation engines:

tick_engine
population_engine
economic_engine
war_escalation_model
collapse_model

These generate civilization events.

No direct state mutation.

------------------------------------------------------------
RUNTIME LAYER
------------------------------------------------------------

runtime/

scheduler
dispatcher
apply_engine
checkpoint
replay

Execution flow:

scheduler
  ↓
tick_engine
  ↓
dispatcher
  ↓
apply_engine
  ↓
checkpoint

------------------------------------------------------------
ERP SYSTEM
------------------------------------------------------------

erp-system/

core
domains
integration
management

domains produce DOMAIN_EVENT

Integration generates INTERFACE_EVENT.

------------------------------------------------------------
BOUNDARY RULE
------------------------------------------------------------

ERP → INTERFACE_EVENT → Persona Integration → Civilization → Core

Direct mutation is forbidden.

Signature required.

schema_hash required.

Fail-closed validation mandatory.

------------------------------------------------------------
OBSERVABILITY
------------------------------------------------------------

monitoring

metrics
retry
dead
quarantine
checkpoint

incident response

SLA monitoring

------------------------------------------------------------
FINAL MODEL
------------------------------------------------------------

Civilization OS is composed of:

Persona Core
+
Civilization Simulation
+
ERP Economy
+
Signed Snapshot Identity

Together forming a Civilization Runtime System.

------------------------------------------------------------
END
------------------------------------------------------------

