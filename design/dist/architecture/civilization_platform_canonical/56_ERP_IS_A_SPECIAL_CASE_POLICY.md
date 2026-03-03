# 56 ERP Is a Special Case Policy（ERP特別扱い 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
ERPは「現実の経営情報」「現実確定」であり、文明OS群の中で最も厳格に扱う。

---

# 1. ERPの絶対ルール
- AI Actor は max_risk_level=2（REQUEST）まで
- *_safe RPC のみ許可（unsafe禁止）
- company_id 必須（テナント隔離）
- 署名必須（Ed25519）
- policy_id 必須・期限必須（無期限禁止）
- Human-in-the-loop 原則必須（承認 UI 経由で確定）

---

# 2. 越境経路
ERP ↔ Persona は Integration を唯一経路とする。
- Integration が policy + whitelist + signature を満たさない要求を通さない
- ERP側でも guard + policy検証（二重防御）

---

# 3. 監査
- ERP側ログ（audit/decision/approval）に actor_id/policy_id/event_id を必ず残す
- 否認防止のため rpc_args_hash を保存する（推奨）

