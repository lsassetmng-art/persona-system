# L1 主体モデル（人/企業/AI社員/役割/代理権）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## 主体（Subjects）
- HumanUser（現実ユーザー）
- CompanyTenant（現実テナント）
- AIEmployee（文明主体：PersonaOS起源）
- Role（コンサル/オペレーター/診断/監査補助…）

## 重要：代理権（Agency）
- AI社員がERPで作業する場合、“代理権”が必要。
- 代理権はデフォルトで **無し**。
- 代理権は「最小権限」「期限」「監査」「取り消し」が必須。

## 最小権限の原則
- AI社員はERP DBを直接書き換えない。
- AI社員の行為は原則「提案（Suggestion）」として発生し、
  人間または承認ワークフローによって初めてERPの実行になる。

## 設計成果（Phase2で設計する対象）
- ai_employee_registry（PersonaOS側/または境界層）
- agency_grant（代理権付与/期限/ロール）
- intervention_policy（何が可能か：read/advise/execute）
