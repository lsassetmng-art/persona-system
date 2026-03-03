# 42 AI Actor Identity and Keys（同一性/鍵 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. Identity（同一性）
AI Actor は必ず以下で一意に識別される。

- actor_id（文明共通ID）: UUID
- persona_id（PersonaOSの人格ID）: UUID
- user_id（オーナー/依頼主）: UUID
- actor_type: { consultant, operator, auditor, supervisor }（設計上は4種。運用は最小から）
- actor_status: { ACTIVE, SUSPENDED, REVOKED }

---

# 1. Key管理（必須）
- Ed25519 鍵ペア
- key_id（テキスト）
- sig_ver（整数：鍵の世代）
- revocation（失効）: 即時反映

要求:
- actorは必ず「署名鍵」を持つ
- 署名検証できない行動要求はERPに到達してはならない

---

# 2. 署名対象（canonical_action）
canonical_action = {
  action_id,          -- uuid（行動単位）
  event_id,           -- uuid（イベント追跡）
  correlation_id,     -- uuid/text（E2E）
  actor_id, persona_id, user_id,
  target_project,     -- 'ERP'
  target_schema,      -- 'sales' etc
  target_rpc,         -- 'sales.request_order_approval_safe' etc
  rpc_args_hash,      -- jsonの正規化→hash
  occurred_at,
  event_version,
  source_os,          -- 'personaos' or 'civilization'
  policy_id           -- admission policy binding
}

signature_base64 = Ed25519(sign( canonical_action_json ))

---

# 3. 失効（Revocation）
- key_id単位で失効できる
- actor_id単位で失効できる
- admission policy単位で失効できる

Fail-Closed:
- 失効リスト参照不可 → 拒否
