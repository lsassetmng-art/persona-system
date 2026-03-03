# ==========================================================
# CivilizationOS Full Layer Design (Merged Canonical)
# Generated: 2026-03-01 07:48:53
# Source: civilizationos_full_layer_design
# ==========================================================



============================================================
FILE: 00_INDEX.md
============================================================

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


============================================================
FILE: 01_L0_WORLDVIEW.md
============================================================

# L0 世界観・責任境界（憲法）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## 定義
- ERP: 現実の個人/企業が使う。中身は現実の経営情報（責任世界）。
- PersonaOS: 現実の個人/企業が使う。中身は非現実の情報（文明世界）。
- AI社員: PersonaOS由来の主体が、ERPに“来て仕事をする”ことがある。

## 絶対原則
1) 混ぜない：ERPデータとPersonaデータは同一DB/同一スキーマに置かない。
2) 直結しない：DB直結・service_role共有・相互参照は禁止。
3) 責任逆流禁止：Personaの推論/感情がERPの確定情報を書き換えない。
4) 双方向は“境界層”を経由：Interface Layerで署名/監査/承認を統制する。

## 設計上の結論
- ERPは「実行系OS（Reality）」。
- PersonaOSは「思考系OS（Civilization）」。
- 双方向橋渡しは「Interface Layer」が唯一の道。



============================================================
FILE: 02_L1_SUBJECT_MODEL.md
============================================================

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


============================================================
FILE: 03_L2_DATA_POLICY.md
============================================================

# L2 データ分類・配置ポリシー（何をどこに置くか）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## データ分類
### ERP（Reality）
- 財務/会計/販売/購買/在庫/人事/監査などの現実業務情報
- 法的・金銭的・実務責任が伴う

### PersonaOS（Civilization）
- persona_state / growth / emotion / snapshot / visualなどの非現実情報
- 物語・人格・文明指標

## 禁止
- ERPにpersona_stateを保存しない
- PersonaOSに現実の経営データをコピーしない（必要なら集計/匿名化/最小化したイベントのみ）

## 共有方法（唯一）
- 署名付きイベント
- 境界層での提案（Suggestion）と承認（Approval）


============================================================
FILE: 04_L3_INTEGRATION_BIDIRECTIONAL.md
============================================================

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



============================================================
FILE: 05_L4_CONTROL_LAYER.md
============================================================

# L4 制御層（Kill Switch / Override / Version / Freeze）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）

## 目的
外部連携と文明適用を「止められる/変えられる/共存できる」状態にする。

## Phase1（制御層）で確定する項目
- system_control（integration_enabled / ingest_enabled / dispatch_enabled / growth_apply_enabled）
- company_weight_override（会社別weight上書き）
- versioning（event_version による共存/拒否）
- growth_freeze（最終防御）

※ 詳細は phase1_control_layer 配下の正本に準拠


============================================================
FILE: 06_L5_AUDIT_GOVERNANCE.md
============================================================

# L5 監査・説明責任（Audit & Governance）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## なぜ必要か
- ERPは責任世界：監査が無いと運用できない
- PersonaOSは文明世界：説明責任が無いと暴走する
- Persona→ERP は特に高リスク（“介入”）

## 監査の必須項目（最低限）
- who: 実行主体（人/AI社員/システム）
- why: 理由（提案根拠/ポリシー/承認）
- what: 対象（entity/範囲/差分）
- when: 時刻（発生/承認/実行）
- how: 経路（ingest/dispatcher/apply）
- proof: 署名/承認ログ/スナップショット

## 二重ログの原則
- PersonaOS側：提案・推論・人格適用のログ
- ERP側：承認・実行・現実変更のログ
互いに参照せず、イベントIDで照合可能にする。



============================================================
FILE: 07_L6_RUNBOOK.md
============================================================

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

