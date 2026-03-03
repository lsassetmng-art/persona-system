# 86 system.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- system.event_outbox に投入
- user_id = owner_user_id
- idempotency_key = action_id::text
- Fail-Closed（system.system_control）
