# 03 Control Layer 標準（全OS共通）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## 目的
OSごとに停止・制御がバラつくと事故時に止められない。
最低限の制御キー体系を全OSで統一する。

## 標準キー（OSごとに持つ）
- os_enabled: "1" / "0"（OS全停止）
- ingest_enabled: "1" / "0"（外部入力停止：Interface入口）
- dispatch_enabled: "1" / "0"（outbox→配送停止）
- apply_enabled: "1" / "0"（状態適用停止：最終防御）
- maintenance_mode: "1" / "0"（運用モード：遅延/拒否の振る舞いを変える）

## 格納場所（推奨）
各OS schema に system_control を持つのが最も明瞭：
- business.system_control
- life.system_control
- game.system_control
- streaming.system_control
- integration.system_control（既存方向）
- personaos.system_control（apply freeze）
- civilization.system_control（world切替）
- governance.system_control（policy freeze）

※ Foundation(system/shared) に集約すると責任境界が壊れるため、原則禁止。

## 判定優先順位（固定）
1) apply_enabled=0 は最強（状態破壊防止）
2) os_enabled=0
3) dispatch_enabled=0
4) ingest_enabled=0
5) maintenance_mode（挙動変更）

## 最低監査（必須）
停止が働いたら必ずログに残す：
- which_key blocked
- requested_action
- request_id / event_id
- timestamp

