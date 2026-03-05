# ============================================================
# CIVILIZATION GOVERNANCE MODEL
# Triple / Admin control / approvals / safe overrides
# ============================================================
status: canonical
scope: civilization.governance.model
owner: Boss
prepared_by: Zero
version: 1.0

Actors:
- Admin (human): ultimate authority outside the simulation
- Triple: indirect ruler inside civilization, operates via events
- Observers: assigned by admin, collect metrics and reports

Rules:
- any override must be gated and signed
- governance actions are auditable events
- no silent changes; all changes produce logs + checkpoint annotation

Control surface (examples):
- runtime_enabled, dispatch_enabled, apply_enabled, simulation_enabled
- quarantine review actions
- allowlist updates for bridges and loop exceptions

