# 07 Change Rules（変更ルール：バタつき防止）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 原則
- 設計→実装の順。設計が正本に反映されるまで実装しない。
- OS境界/接続/制御/監査を変える変更は “設計正本の更新” が先。

## 変更種別と手順
### A) OS追加
1) 01_OS_CLASSIFICATION.md に追加
2) 02_OS_CONNECTION_MATRIX.md に接続定義
3) 03_CONTROL_LAYER_STANDARD.md の適用方針
4) 05_AUDIT_STANDARD.md の監査対象確定

### B) 接続追加/変更
- 02_OS_CONNECTION_MATRIX.md を更新
- 禁止事項に触れる場合は却下（直結・責任逆流）

### C) 制御キー追加
- 03_CONTROL_LAYER_STANDARD.md に追加
- 運用（Runbook）を同時更新する

### D) イベント語彙追加
- 06_EVENT_TAXONOMY_MINIMUM.md に分類と必須フィールドを追記
- Integration OS の event_registry 側に翻訳を追加（設計→実装の順）

