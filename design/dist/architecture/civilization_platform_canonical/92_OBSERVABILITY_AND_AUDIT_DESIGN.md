# 92 Observability & Audit（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

最低限ログ:
- integration.actor_route_queue（状態・attempts・last_error）
- shared.dispatcher_run_log（バッチ結果）
- shared.dispatcher_dead_letter（DEAD）

検索キー:
- event_id / action_id / actor_id / policy_id / os_key / correlation_id

エラーは 2000文字で切る（DB安全）
