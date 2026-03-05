# ============================================================
# CIVILIZATION SYSTEM MASTER MAP
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS の全体構造（最上位地図）を1枚で示す。

------------------------------------------------------------
MASTER MAP (ONE-PAGE)
------------------------------------------------------------

                           [ HUMAN ADMIN ]
                                 |
                                 | (governance decisions)
                                 v
+-------------------------------------------------------------------+
|                           GOVERNANCE LAYER                         |
|   - policy gates (runtime_enabled, simulation_enabled, world gate) |
|   - approvals / quarantine review / audit log                       |
+-------------------------------+-----------------------------------+
                                |
                                v
+-------------------------------------------------------------------+
|                              RUNTIME                               |
|   Scheduler -> Tick -> EventGen -> Dispatcher -> Apply -> Checkpoint|
|                                -> Snapshot -> Monitoring           |
+-------------------------------+-----------------------------------+
                                |
                                v
+-------------------------------------------------------------------+
|                           EVENT SYSTEM                              |
|   - EVENT_STANDARD_V2                                               |
|   - schema_hash + versioning                                        |
|   - signature verify (fail-closed)                                  |
|   - retry/dead/quarantine                                           |
+-------------------------------+-----------------------------------+
                                |
                                v
+-------------------------------------------------------------------+
|                        SIMULATION LAYER                             |
|   - Tick Engine (day)                                               |
|   - Population Engine                                               |
|   - Economic Balance Engine                                         |
|   - Diplomacy / Trade / War / Collapse models                        |
|   Output: WORLD_EVENT (immutable)                                   |
+-------------------------------+-----------------------------------+
                 |                                  |
                 |                                  |
                 v                                  v
+------------------------------+        +------------------------------+
|        PERSONAOS (STATE)     |        |           ERP (BUSINESS)     |
|  - persona_state owner       |        |  - domain state owner        |
|  - apply engine mutates      |        |  - business outbox           |
|  - snapshot issuer (Ed25519) |        |  - interface events          |
+---------------+--------------+        +---------------+--------------+
                ^                               |
                | PersonaImpact/GrowthHint      | ERP Interface Events
                | (events only)                 | (signed)
                +---------------+---------------+
                                |
                                v
+-------------------------------------------------------------------+
|                           OPERATIONS                                |
|   - SLA / Monitoring / Incident Response                            |
|   - Failure Matrix / Recovery Guide / Hardening Plan                |
|   - dashboards: throughput, retries, dead/quarantine, checkpoints    |
+-------------------------------------------------------------------+

------------------------------------------------------------
BOUNDARY RULES (CANONICAL)
------------------------------------------------------------
1) PersonaOS is the only owner of persona state.
2) Civilization never directly mutates PersonaOS state.
3) ERP and Civilization communicate by signed events only.
4) Apply Engine is the only mutator in each state domain.
5) Snapshots are immutable public truth. Sync is re-issue only.
6) Validation is fail-closed. Unknown => QUARANTINE (reviewed).

------------------------------------------------------------
END
------------------------------------------------------------
