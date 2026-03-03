# CivilizationOS 全層設計 正本 INDEX
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 目的
「途中でバタつかない」ために、実装の前に“全層の設計”を確定する。
ERP（現実/責任世界）と PersonaOS（非現実/文明世界）を混ぜずに、
双方向連携（ERP→PersonaOS / PersonaOS→ERP）を統治可能にする。

## 層（Layers）
- L0 世界観・責任境界
- L1 主体モデル（人/企業/AI社員/役割/代理権）
- L2 データ分類・配置ポリシー
- L3 双方向連携（Interface Layer）
- L4 制御層（Kill switch等）
- L5 監査・説明責任
- L6 運用（Runbook）

## 成果物（このフォルダが正本）
01_L0_WORLDVIEW.md
02_L1_SUBJECT_MODEL.md
03_L2_DATA_POLICY.md
04_L3_INTEGRATION_BIDIRECTIONAL.md
05_L4_CONTROL_LAYER.md
06_L5_AUDIT_GOVERNANCE.md
07_L6_RUNBOOK.md

## 既存の確定事項（実装先行分）
- ERP→PersonaOS: 署名付き外部イベント + outbox + dispatcher + apply
- integration.event_registry（翻訳辞書）
- Phase1 制御層の設計（kill switch / override / version / freeze）
