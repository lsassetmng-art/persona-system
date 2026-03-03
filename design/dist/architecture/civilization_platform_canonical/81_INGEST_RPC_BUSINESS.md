# 81 business.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

目的:
- Integration Delivery Worker が呼ぶ “唯一の受け口”
- business.event_outbox へ安全に投入（列差分吸収）

入力:
- route_id/action_id/event_id/correlation_id
- actor_id/owner_user_id/policy_id
- action_key/risk_level/event_version/occurred_at/payload

要件:
- business.system_control を参照し Fail-Closed（os_enabled/dispatch_enabled/maintenance_mode）
- idempotency: action_id を idempotency_key として保存（あれば）
- source_os='integration' を保存（あれば）
- event_type は action_key を使用
