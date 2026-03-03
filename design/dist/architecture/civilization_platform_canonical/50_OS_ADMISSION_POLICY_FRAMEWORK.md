# 50 OS Admission Policy Framework（OS別入場ポリシー枠組み 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorが各OSに入場するための「共通ポリシー枠」を固定する。

---

# 1. 共通スキーマ（概念）
policy_id: text
os_key: text（例: erpos / business / streaming / game / life / governance）
binds:
- actor_id, persona_id, owner_user_id
scope:
- tenant/company/world（OSに応じた単位）
- allowed_namespaces（任意）
- allowed_actions（whitelist参照）
risk:
- max_risk_level（0..5）
gates:
- require_signature: boolean（原則 true）
- require_human_approval: boolean（OSにより）
expiry:
- issued_at
- expires_at（必須・無期限禁止）
status:
- ACTIVE / SUSPENDED / REVOKED

---

# 2. 強制ポイント（必須）
- Integration/Router は policy を検証し、許可外は route しない
- OS側の実行系RPC/関数も policy を検証（推奨：二重防御）
- 参照不能/不整合 → fail-closed（拒否）

---

# 3. policyの粒度（推奨）
- ERP: company_id + schema + rpc 単位（最小）
- Business: app_namespace + action単位
- Streaming: channel_id + action単位（配信操作）
- Game: world_id + character_slot + action単位
- Life: user_id + action単位（個人領域）
- Governance: proposal_domain + action単位

