# 05 Audit Standard（全OS共通）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 監査が必要な理由
- Reality Tier: 現実責任（誤りが損害になる）
- Cognitive Tier: 説明責任（暴走が信用を破壊する）
- Interface: 事故の震源になりやすい

## 監査最小セット（全OS共通）
- actor_type: human / ai_employee / system
- actor_id
- company_id（存在するOSのみ）
- action: ingest / dispatch / apply / propose / approve / execute
- target: entity/type/id
- reason: policy_key / approval_id / rule_id など
- request_id / event_id（相関ID）
- occurred_at / recorded_at
- result: ok / blocked / retry / dead
- error: message（あれば）

## 二重ログ原則（固定）
- Cognitive側の提案ログ と Reality側の実行ログ は別物
- 相関は event_id / request_id で行う
- 片方のDBを参照して“正”にしない（責任境界）

