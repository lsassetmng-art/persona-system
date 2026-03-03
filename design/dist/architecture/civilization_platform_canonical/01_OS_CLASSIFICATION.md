# 01 OS正式分類（DB実体ベース）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
source: DB schema list (tables by schema)
last_updated: 2026-02-28

## Foundation Layer（OSではない）
- auth / storage / realtime / cron / vault / net / shared / system

役割:
- 認証・ストレージ・リアルタイム・ジョブ・秘密・HTTPキュー・共通ログ/共通outbox 等

## Cognitive Tier（思考・文明）
### Persona Core OS
- schema: personaos
- 責任: persona_state / growth / memory / emotion / visual / signing / snapshot（人格中枢）

### Civilization OS
- schema: civilization
- 責任: world_registry / cross_world_rule / federation / event_store / snapshot_store（文明層）

### Integration OS
- schema: integration
- 責任: external_event / external_world_outbox / trusted_keys / revoked_keys / ingest_config（境界層）

### Governance OS
- schema: governance
- 責任: civil_policy / proposal / weight / triple_state / governance_event_outbox（統治層）

## Reality Tier（現実寄り）
### Business OS
- schema: business
- 責任: 小規模業務アプリ基盤（approval/task/role/publish/event_outbox 等）
- 注: ERPとは疎結合（連携のみ）。ERPの一部ではない。

### Life OS
- schema: life
- 責任: habit/health/goal 等（個人生活世界）

### Game OS
- schema: game, gaming
- 責任: simulation / game event outbox

### Streaming OS
- schema: streaming
- 責任: 配信/表現（演出ログ等）

## 原則（固定）
- OS間は DB直結しない
- OS間は Interface 経由のみ
- Foundation は “共通機能” を提供するが “意思決定” はしない
