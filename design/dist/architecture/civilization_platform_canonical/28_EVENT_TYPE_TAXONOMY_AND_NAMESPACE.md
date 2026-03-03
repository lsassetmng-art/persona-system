# 28 Event Type Taxonomy and Namespace（イベント語彙 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
event_type の命名と分類を統一し、翻訳や監査の基盤を固定する。

---

# 1. 命名規約（推奨）
- <domain>.<entity>.<action>.<variant?>
例:
- sales.order.approval_requested.v1
- approval.request.created.v1
- persona.growth.applied.v2
- integration.external.ingested.v1

---

# 2. Kind分類（固定）
Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

- FACT_EVENT: Reality由来（ERP/Business）
- POLICY_EVENT: Governance由来
- SUGGESTION: Persona由来（AI社員）
- APPROVAL: 承認結果
- EXECUTION: 現実確定行為

---

# 3. versionルール（再掲）
- 破壊変更は version++
- 同一 event_type で version 共存可
- 境界イベントは event_version 必須

---

# 4. ソースOS表記（固定）
source_os は system_control の schema 名と一致させるのを推奨（追跡容易化）。
例:
- source_os='sales'
- source_os='personaos'
- source_os='civilization'
