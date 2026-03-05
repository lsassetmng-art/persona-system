# ============================================================
# CIVILIZATION WORLD BOUNDARY RULES
# Cross-domain mutation constraints
# ============================================================
status: canonical
scope: civilization.world.boundary.rules
owner: Boss
prepared_by: Zero
version: 1.0

Boundary rule:
- World simulation does not directly mutate PersonaOS state.
- ERP does not directly mutate PersonaOS state.
- All cross-domain effects must be expressed as versioned events.

Allowed directions:
ERP -> INTERFACE_EVENT -> Civilization
World -> WORLD_EVENT -> Civilization
Civilization -> DOMAIN_EVENT -> PersonaOS (impact/growth abstraction)

Forbidden:
- direct DB writes across domains
- hidden RPC shortcuts
- implicit default filling that changes meaning

