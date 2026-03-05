# ============================================================
# CIVILIZATION WORLD ISOLATION POLICY
# Multiverse safety / cross-world constraints
# ============================================================
status: canonical
scope: civilization.world.isolation.policy
owner: Boss
prepared_by: Zero
version: 1.0

Default:
- Worlds are isolated.
- A world may not modify another world's state.

Cross-world interactions:
- only via explicit MultiverseBridgeEvent (versioned + gated)
- must include allowlisted world pairs and purpose

Fail-closed:
- unknown bridge event => QUARANTINE
- missing allowlist => QUARANTINE

