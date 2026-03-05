# ============================================================
# CIVILIZATION GALAXY MAP
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS を「銀河図」として1枚にまとめ、初見でも迷子にならないようにする。

------------------------------------------------------------
GALAXY DIAGRAM
------------------------------------------------------------

                         +--------------------------+
                         |       HUMAN ADMIN        |
                         |          (Boss)          |
                         +------------+-------------+
                                      |
                                      v
                         +--------------------------+
                         |        GOVERNANCE        |
                         | policy/approval/audit    |
                         | compliance/roles         |
                         +------------+-------------+
                                      |
                                      v
+------------------------------------------------------------------+
|                         CIVILIZATION OS CORE                     |
|------------------------------------------------------------------|
| Runtime: scheduler -> tick -> dispatch -> apply -> checkpoint     |
| Event Universe: standard/registry/outbox/retry/dead/quarantine    |
| Simulation: time/population/economy/diplomacy/war/disaster        |
| Integrity: schema_hash + Ed25519 + determinism + replay           |
| Observability: metrics/logs/alerts                                |
+-----------------------------+------------------------------------+
                              |
                              v
        +--------------------------------------------------+
        |                      WORLDS                      |
        |--------------------------------------------------|
        | Civilization World (macro)                       |
        | Life World                                       |
        | Business World                                   |
        | ERP World                                        |
        | Persona World                                    |
        +------------------------+-------------------------+
                                 |
                                 v
        +--------------------------------------------------+
        |                   EVENT STREAM                   |
        |--------------------------------------------------|
        | WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT      |
        | (boundary crossing requires schema_hash+signature)|
        +------------------------+-------------------------+
                                 |
                                 v
        +--------------------------------------------------+
        |                     PERSONAOS                    |
        |--------------------------------------------------|
        | persona_state (truth owner)                       |
        | growth/events/logs                                |
        | snapshot generator                                |
        +------------------------+-------------------------+
                                 |
                                 v
        +--------------------------------------------------+
        |                    SNAPSHOT LAYER                |
        |--------------------------------------------------|
        | canonical JSON + Ed25519                          |
        | immutable certificate (revocable only)            |
        +------------------------+-------------------------+
                                 |
                                 v
        +--------------------------------------------------+
        |                  EXTERNAL APPLICATIONS           |
        |--------------------------------------------------|
        | PocketSecretary / ERP UI / mobile apps / analytics|
        | snapshot consumer (no direct persona_state write) |
        +--------------------------------------------------+

------------------------------------------------------------
END
------------------------------------------------------------
