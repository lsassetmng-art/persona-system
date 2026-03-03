# 88 External ERP Delivery Worker（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28
owner: Boss
prepared_by: Zero

ERPは別Project（DATABASE_URL）。Persona側からDB直INSERTは不可。
よって integration.actor_route_queue の route_kind=EXTERNAL_HTTP を配送するワーカーが必要。

要件:
- queue(PENDING) を claim → INFLIGHT
- ERP ingest endpoint へ HTTP POST（pg_net or Edge）
- 200/409 は DONE
- 5xx は retry
- 4xx は DEAD（原則。例外は設計で明示しない限り無し）
- ERP側も policy/署名/whitelist を再検証（Fail-Closed）

停止制御:
- integration.dispatch_enabled
- integration.os_enabled / maintenance_mode
- （任意）erpos dispatch_enabled を “ERP側” で持つ
