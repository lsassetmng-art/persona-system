# 61 Integration Policy Model（OS別入場ポリシー 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Civilization Actor（59）の Admission Policy を、Integration が検証できる形で固定。

---

## 1. integration.actor_policy（DBモデル）
- policy_id (text) PK
- os_key (text) 例: 'erpos','business','streaming','game','life','governance','system'
- actor_id (uuid)
- persona_id (uuid)
- owner_user_id (uuid)
- tenant_key (text, nullable) … OSに応じたスコープキー（company_id/world_id/channel_idなどのキー名）
- tenant_value (text, nullable) … その値（uuidをtext化でもOK）
- max_risk_level (int)
- require_signature (bool)
- require_human_approval (bool)
- status (text: ACTIVE/SUSPENDED/REVOKED)
- issued_at, expires_at (timestamptz) ※無期限禁止
- created_at, updated_at

Fail-Closed:
- policyが無い/期限切れ/不一致 → reject
