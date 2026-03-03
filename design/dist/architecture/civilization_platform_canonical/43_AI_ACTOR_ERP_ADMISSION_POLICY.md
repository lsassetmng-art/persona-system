# 43 AI Actor ERP Admission Policy（ERP入場資格 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI ActorがERPで「何者として」「どこまで」振る舞えるかを固定する。
AdmissionはERP側で発行され、Integrationが強制する。

---

# 1. Admission Policy（概念）
policy_id: text
binds:
- actor_id / persona_id / user_id
- company_id（ERPテナント）
- allowed_schemas（例: sales, approval）
- allowed_rpcs（完全ホワイトリスト）
- max_risk_level（0..5）
- require_human_approval: boolean（原則 true）
- expires_at（必須：期限）

---

# 2. Admissionの強制点（必須）
- Integrationで policy_id を検証し、許可外は route しない
- ERP側RPCは policy_id を引数に取り、DBでも検証（推奨）
- policyの欠落/期限切れ/不一致 → 拒否

---

# 3. デフォルト（軍用）
- deny by default
- allowは最小
- expires_atは短い（運用で延長、無期限禁止）
