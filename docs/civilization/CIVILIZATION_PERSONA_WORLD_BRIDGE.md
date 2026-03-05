# ============================================================
# CIVILIZATION PERSONA WORLD BRIDGE
# ============================================================
status: canonical
scope: civilization.persona.world.bridge
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
Persona が文明内で「どの世界・国家・組織に所属しているか」を表す橋渡し。
ただし state owner は PersonaOS。

## 1. Link Concept
- PersonaOS holds: persona_affiliation snapshot
- Civilization holds: citizen index (read-only from snapshots)

## 2. Flow
PersonaOS Snapshot -> Civilization Ingest (read) -> citizen index updated
Civilization Events -> PersonaImpactEvent (write to PersonaOS as event)

## 3. Constraints
- no cross-schema direct mutation
- snapshot is only truth for persona identity
