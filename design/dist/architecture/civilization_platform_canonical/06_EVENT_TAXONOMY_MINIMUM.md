# 06 Event Taxonomy Minimum（最低限標準）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## イベント種別（分類）
- FACT_EVENT: 事実（Reality起点が基本）
- POLICY_EVENT: ポリシー/統治（Governance起点）
- SUGGESTION: 提案（Cognitive起点）
- APPROVAL: 承認結果（Reality内部）
- EXECUTION: 実行（Reality内部）

## 命名規約（推奨）
- <DOMAIN>_<VERB>_<OBJECT> 形式
- 例: BUSINESS_TASK_CREATED, LIFE_HABIT_LOGGED, CIVIL_POLICY_UPDATED
- Cognitive側の“内的イベント”は別空間でよい（personaos.event_registry）

## 必須フィールド（Interface通過時）
- event_id (uuid)
- source_os (text)
- target_os (text)
- event_type (text)
- event_version (int, default 1)
- occurred_at (timestamptz)
- payload (jsonb, 最小化)
- signature (境界イベントのみ)

