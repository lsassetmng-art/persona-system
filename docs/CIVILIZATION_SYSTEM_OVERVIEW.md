# ============================================================
# CIVILIZATION SYSTEM OVERVIEW (5-min)
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS を「5分で理解する」ための概要設計書。

------------------------------------------------------------
1. WHAT IS CIVILIZATION OS?
------------------------------------------------------------

Civilization OS is not a game.

It is a runtime system that combines:

1) Persona Identity (Snapshot-based)
2) Civilization Simulation (World dynamics)
3) ERP Economy (Business reality)

Civilization OS outputs events and snapshots, not "live mutable public state".

------------------------------------------------------------
2. CORE PRINCIPLES (NON-NEGOTIABLE)
------------------------------------------------------------

- PersonaOS is the only owner of persona state.
- Snapshot is the only public truth of persona identity.
- Civilization does not directly mutate persona state.
- Cross-schema direct mutation is forbidden.
- Events are immutable.
- Re-sync happens by re-issuing snapshots, never by overwriting history.
- Fail-closed validation is mandatory (signature/schema_hash).

------------------------------------------------------------
3. TOP-LEVEL LAYERS
------------------------------------------------------------

Constitution
  - 000_FULL_00_96_CANONICAL (highest canonical)

Architecture
  - master structure
  - dependency graph
  - freeze policy

Runtime
  - scheduler
  - dispatcher
  - apply engine
  - checkpoint / replay

Event System
  - EVENT_STANDARD_V2
  - schema_hash + versioning

Simulation
  - tick engine
  - population engine
  - economic balance engine
  - war escalation model
  - collapse model

Integration
  - Persona interface (growth hints / impacts)
  - ERP bridge (economic interface)

Operations
  - SLA / monitoring / incident response
  - hardening plan / failure matrix / recovery guide

------------------------------------------------------------
4. EXECUTION FLOW (ONE LINE)
------------------------------------------------------------

scheduler
  -> tick
    -> event generation
      -> dispatcher
        -> apply engine (only mutator)
          -> checkpoint
            -> snapshot
              -> monitoring

------------------------------------------------------------
5. WHY CHECKPOINT / REPLAY?
------------------------------------------------------------

Checkpoint provides:

- deterministic recovery
- replay validation
- audit evidence

Replay mismatch is a SEV1 integrity event.

------------------------------------------------------------
6. HOW PERSONA CONNECTS
------------------------------------------------------------

Civilization emits:

- PersonaImpactEvent
- PersonaGrowthHintEvent

PersonaOS consumes them and updates persona_state.

Civilization only keeps a read projection (from snapshots).

------------------------------------------------------------
7. HOW ERP CONNECTS
------------------------------------------------------------

ERP emits INTERFACE_EVENT (signed).
Civilization normalizes it into economy inputs (abstract).

Optionally Civilization emits MarketSignalEvent back to ERP.

------------------------------------------------------------
8. QUICK "READ ORDER"
------------------------------------------------------------

1) CIVILIZATION_OS_ARCHITECTURE_MAP.md
2) CIVILIZATION_EXECUTION_FLOW_CANONICAL.md
3) EVENT_STANDARD_V2_CANONICAL
4) CIVILIZATION_SIMULATION_ENGINE.md
5) CIVILIZATION_PERSONA_INTERFACE.md
6) CIVILIZATION_ERP_BRIDGE_MODEL.md
7) Operations (SLA/Monitoring/Incident)

------------------------------------------------------------
END
------------------------------------------------------------
