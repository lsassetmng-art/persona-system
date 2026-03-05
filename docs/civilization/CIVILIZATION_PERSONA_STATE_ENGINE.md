# ============================================================
# CIVILIZATION PERSONA STATE ENGINE
# Civilization -> Persona effect model (indirect, event-driven)
# ============================================================
status: canonical
scope: civilization.persona.state.engine
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Principle
Civilization does NOT directly edit persona state.
All influence is expressed as events, interpreted by PersonaOS.

# 1. Interaction modes
- WORLD_EVENT => produces PersonaImpactEvent (abstract)
- DOMAIN_EVENT => produces PersonaGrowthEvent (abstract magnitude)
- INTERFACE_EVENT (admin-signed) => may trigger controlled persona updates

# 2. Persona impact abstraction
Civilization emits:
- persona_id (or cohort selector)
- app_namespace
- magnitude (1..100)
- reason_code (enum)
- context snapshot references (optional)

PersonaOS decides actual state mutation.

# 3. Safety rules
- no direct cross-schema writes
- no leaking private user info into world
- all events must carry causality fields

