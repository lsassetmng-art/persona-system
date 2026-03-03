# 83 game.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- game.event_outbox に投入
- idempotency_key = action_id::text
- user_id = owner_user_id
- event_type = action_key
- system_control で Fail-Closed
