# 31 Signature and Trust Chain Spec（署名/信頼鎖 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
外部入力・AI社員出力・スナップショットを「改ざん不能」として扱うための信頼鎖を固定する。

---

# 1. 署名対象（再掲）
canonical_event = {
  event_id, event_type, event_version, source_os, target_os, occurred_at, payload
}

---

# 2. 署名アルゴリズム
- Ed25519
- signature_base64
- signature_alg='ed25519'

---

# 3. 信頼鎖（Integration）
- trusted_keys / revoked_keys を参照
- signature_verified=true のみ採用
- key_id / sig_ver / event_version を保存

---

# 4. AI社員（Persona）の署名
- PersonaOSの signing_key_registry / persona_signing_key を参照
- persona_snapshot と紐づける（責任追跡）

---

# 5. 禁止
- 署名なしの境界入力採用
- 署名対象canonicalの改変（フィールド追加含む）
