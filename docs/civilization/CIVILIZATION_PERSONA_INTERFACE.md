# ============================================================
# CIVILIZATION PERSONA INTERFACE
# ============================================================
status: canonical
scope: civilization.persona.interface
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Principle
PersonaOS only is state owner. Civilization never directly writes persona_state.

## 1. Outgoing Event Types (abstract)
- PersonaImpactEvent: {persona_id|cohort, magnitude(1..100), reason_code, context_refs}
- PersonaGrowthHintEvent: {persona_id, skill_axis, magnitude, reason_code}

## 2. Rate Limits
Plan-based caps (FREE/PRO/ENTERPRISE) apply.
If exceeded => event queued or dropped with audit log (policy-driven).

## 3. Privacy
No user-private information in civilization events.
All persona references are IDs; context is snapshot refs only.
