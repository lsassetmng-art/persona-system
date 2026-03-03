# ============================================================
# 02 PERSONA SYSTEM STRUCTURE
# ============================================================

2. PERSONA SYSTEM STRUCTURE
============================================================

persona-system/
  core/
  civilization/
  integration/
  governance/
  snapshot/
  expression-layer/
  worlds/

------------------------------------------------------------
2.1 CORE (Tier 0)
------------------------------------------------------------
- state-model
- apply-engine
- axis-engine
- identity-model
- persona-state

Core is the ONLY component allowed to mutate persona state.

------------------------------------------------------------
2.2 CIVILIZATION (Tier 1)
------------------------------------------------------------
- dispatcher
- retry
- routing
- world-bridge

No state mutation here.

------------------------------------------------------------
2.3 INTEGRATION (Tier 1)
------------------------------------------------------------
- interface-event-ingest
- signature-verify
- schema-validate
- gate-control

Fail-closed on validation failure.

------------------------------------------------------------
2.4 GOVERNANCE (Tier 1)
------------------------------------------------------------
- system-control
- fail-closed control
- audit-log

------------------------------------------------------------
2.5 SNAPSHOT (Tier 0 output)
------------------------------------------------------------
- canonical snapshot generation
- public representation only
- no reverse mutation

------------------------------------------------------------
2.6 EXPRESSION-LAYER (Tier 2)
------------------------------------------------------------
- visual
- speech
- streaming overlay
- UI composition

Never mutates core.

------------------------------------------------------------
2.7 WORLDS (Tier 2 Input Domains)
------------------------------------------------------------

worlds/
  life/
  business/
  streaming/
  game/
  governance/
  social/
  learning/

Worlds generate WORLD_EVENT only.
No direct core updates.

============================================================