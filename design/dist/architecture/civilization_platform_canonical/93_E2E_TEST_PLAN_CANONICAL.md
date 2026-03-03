# 93 E2E Test Plan Canonical（設計正本）
status: DESIGN_READY
last_updated: 2026-02-28

T-1: Gate reject（policy無し）
T-2: Gate reject（whitelist無し）
T-3: Gate reject（signature_verified=false）
T-4: Route enqueue（PENDING 生成）
T-5: Internal deliver（deliver_internal_batch で DONE）
T-6: OS停止で拒否（<schema>.dispatch_enabled=0）
T-7: Retry（OS側RPCエラー → attempts+1, next_retry_at）
T-8: Dead（attempts>=5 → DEAD）
T-9: Idempotency（action_id再送 → Duplicate）
T-10: ERP external（設計完了後に追加）
