# ============================================================
# CIVILIZATION GROWTH ENGINE
# ============================================================
status: canonical
scope: civilization.persona.growth.engine
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
文明内の出来事を「人格成長のヒント」に変換する（状態変更はしない）。

## 1. Inputs
- WORLD_EVENT (war/disaster/economy/education)
- ORG_EVENT (promotion/demotion/transfer)
- ROLE_EVENT (job difficulty)

## 2. Mapping
- event_registry.severity -> magnitude
- reason_code fixed enum
- skill_axis derived from event_type

## 3. Outputs
- PersonaGrowthHintEvent (to PersonaOS)
