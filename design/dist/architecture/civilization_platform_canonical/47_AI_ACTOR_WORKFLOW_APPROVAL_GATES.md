# 47 Workflow and Approval Gates（承認ゲート 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 原則
AI Actorは「確定」ではなく「承認要求」まで。
現実確定は人間承認（Human-in-the-loop）。

---

# 1. 承認フロー（例：sales）
AI Actor:
- request_order_approval_safe を呼ぶ
ERP:
- order_header を pending_approval にする
- approval_request を作る
人間:
- approval UI で承認/否認
ERP:
- 承認後にのみ確定処理へ進む

---

# 2. 例外（限定自動）
- 事前に policy_id が「risk_level<=1」かつ「条件一致」のみ
- 条件はERP側で最終判定（AI側の自己申告禁止）

---

# 3. 禁止
- AI Actorが承認権限を持つ（supervisor型は“提案”に限定）
- AI Actorが金銭確定を行う
