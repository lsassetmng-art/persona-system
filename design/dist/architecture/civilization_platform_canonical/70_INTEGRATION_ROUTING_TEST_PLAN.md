# 70 Integration Routing Test Plan（Routingテスト計画 正本）
status: DESIGN_READY
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## T-R1: registry未登録は拒否（Fail-Closed）
- route_registry に無い os_key を指定
- 期待: 例外（routing拒否）

## T-R2: registry is_enabled=false は拒否
- route_registry.is_enabled=false
- 期待: 例外（routing拒否）

## T-R3: gate通過後に queue へ積まれる
- policy/whitelist/署名検証済み/重複なし
- 期待: actor_route_queue に PENDING で1件

## T-R4: action_id 重複は拒否
- 同じ action_id を再送
- 期待: unique_violation → “Duplicate action_id” 相当

## T-R5: integration.os_enabled=0 で拒否
- integration.system_control.os_enabled=0
- 期待: Gateで拒否

※配送実体（queue→OS outbox/ERP送信）は後段テスト（別設計）。
