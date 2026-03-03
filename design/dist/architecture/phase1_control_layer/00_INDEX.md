# Phase 1 制御層（設計正本）INDEX
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 目的
外部連携（ERP→PersonaOS）を **可変・停止・会社別制御・バージョン共存** できる状態にする。
「動く」から「止められる/制御できる」へ。

## 対象スコープ（この設計セットの範囲）
- PersonaOS Project（ihrukfdlcolygyvccujd）側の制御層
- ERP Project（bkvycodiojbwcomnylqa）とは「外部連携」関係のみ（統合しない）

## 成果物（このフォルダの正本）
1. 01_KILL_SWITCH.md
2. 02_COMPANY_OVERRIDE.md
3. 03_VERSIONING.md
4. 04_GROWTH_FREEZE.md
5. 05_DECISION_MATRIX.md

## 既存基盤（前提）
- external_event_ingest（署名検証→保存→outbox投入）
- integration.external_world_outbox（dispatcherが拾う）
- dispatcher v8.2（integrationループ含む）
- persona_apply v3.4（registry翻訳 + DB weight適用）
- integration.event_registry（翻訳辞書）

## Phase 1 完了の定義
- kill switch により「入口」「dispatcher」「apply」を止められる
- companyごとにイベント影響度（weight）を上書きできる
- event仕様versionを共存/拒否できる
- すべてが監査ログで追える（止めた理由・適用したルール・最終判定）
