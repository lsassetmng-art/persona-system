# L3 双方向連携（Interface Layer）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## A) ERP → PersonaOS（確定）
- 署名付き事実イベント
- Verify → Store → Outbox → Dispatcher → Apply
- 翻訳：integration.event_registry（ERP語彙→文明語彙）
- weight：registry + company override（Phase1）

## B) PersonaOS → ERP（設計完了させる：実装は後）
### 目的
AI社員がERPに来て「診断/提案/オペ支援/コンサル」を行う。

### 絶対制約
- AI社員はERPのDBを直接更新しない（禁止）。
- 実行は必ず承認・監査・最小権限を通す。

### 推奨アーキテクチャ（境界層）
PersonaOS から出るものは “Suggestion（提案）” として表現する。

- suggestion_outbox（PersonaOS or Interface）
- approval_workflow（ERP側：承認が実行権限を持つ）
- execution_outbox（ERP側：承認済みタスクを実行）
- audit_log（両側に証跡）

### 提案の型（例）
- DIAGNOSIS（診断）
- RECOMMENDATION（推奨）
- DRAFT_OPERATION（実行案：下書き）
- AUTO_OPERATION（自動実行：※強い代理権が必要）

### 受け渡し単位
- “SQL” を渡さない（危険）
- “操作意図” と “差分（diff）” を渡す
- ERP側で検証してから実行

