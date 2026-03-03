# 94 Minimum Prod Runbook（設計正本）
status: DESIGN_READY
last_updated: 2026-02-28

運用最小手順:
- まず maintenance_mode=1 で変更
- DDL適用（佐藤レビュー後）
- smoke test（Gate→route→deliver）
- 問題なければ maintenance_mode=0
- dispatch_enabled を段階的にON

障害時:
- integration.dispatch_enabled=0 で即止め
- queue を残して再開可能にする
