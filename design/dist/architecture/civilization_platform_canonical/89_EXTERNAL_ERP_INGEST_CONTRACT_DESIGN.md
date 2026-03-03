# 89 ERP Ingest Contract（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

ERP側は “受け口” を1つに固定する（設計）
- HTTP: /erp_ingest_from_integration (Edge Function など)
または
- DB: erp.integration_external_event (受理テーブル) にINSERT（ただしProject分離のため通常はHTTP）

入力は actor_route_queue と同等（最小）:
- action_id（idempotency）
- event_id / correlation_id
- actor_id / persona_id / owner_user_id
- policy_id
- action_key
- risk_level
- event_version
- occurred_at
- payload
- signature_base64 / key_id / signature_verified

ERP側で Fail-Closed:
- policy/whitelist/署名検証済み/停止スイッチ
- 受理後は ERP側 outbox/approval/workflow に変換
