# 69 Integration Route Functions（Routing関数群 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Gate通過 → route queue へ積むための関数を固定する。

---

## 1. エントリポイント
integration.route_actor_action(...):
- まず gate_validate_actor_action(...) を呼ぶ
- route_registry を確認（Fail-Closed）
- integration.actor_route_queue に1件 INSERT（PENDING）

---

## 2. actor_route_queue の要件（最小・汎用）
- route_id (uuid) PK
- action_id (uuid) UNIQUE（idempotency）
- event_id (uuid)
- correlation_id (text)
- actor_id/persona_id/owner_user_id
- policy_id
- os_key（target）
- action_key
- target_schema/target_rpc
- risk_level
- tenant_key/tenant_value
- event_version / occurred_at / source_os
- payload (jsonb)
- key_id / signature_verified / signature_base64（証跡）
- route_kind（INTERNAL_DB/EXTERNAL_HTTP）
- status (PENDING/INFLIGHT/DONE/DEAD)
- attempts / next_retry_at / last_error
- created_at / updated_at

---

## 3. 禁止
- queueを経由せずにOSへ配送
- registryを無視した配送
