# 95 Rollback Strategy（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

原則:
- DDLは additive only なので “削除で戻さない”
- rollbackは停止スイッチで行う

手順:
1) integration.dispatch_enabled=0
2) （必要なら）<schema>.dispatch_enabled=0
3) 失敗原因を修正
4) キューの DEAD/PENDING を見て再開判断
