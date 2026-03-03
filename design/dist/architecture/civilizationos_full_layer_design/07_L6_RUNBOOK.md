# L6 運用（Runbook：停止/解除/障害/ローテ）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## 目的
バタつきを防ぐ。運用手順が無いと本番は崩壊する。

## 章立て（Phase1で最低限作る）
1) Kill Switch：止め方（入口/dispatcher/apply）
2) 解除手順：段階的復帰
3) 署名鍵ローテ：追加→切替→失効
4) 失敗率上昇時：replay窓/maintenance_mode
5) DEAD増加時：原因分類（署名/レジストリ/適用エンジン）
6) Persona→ERP 介入時：承認手順と緊急停止

## “止める”判断基準（例）
- signature_invalid_rate > X%
- dead_rate > Y%
- apply_engine_error_rate > Z%
- 異常なweight設定検知（急増）

