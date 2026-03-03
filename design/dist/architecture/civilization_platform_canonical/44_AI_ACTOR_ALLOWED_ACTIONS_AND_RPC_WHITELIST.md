# 44 Allowed Actions and RPC Whitelist（許可行為/RPC 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 方針（超厳格）
AI Actorが実行できるのは「ERPの安全RPC（*_safe）」のみ。
さらに引数/影響範囲を制限する。

---

# 1. Whitelistの単位
- schema + rpc_name + signature_required + approval_gate

例:
- sales.request_order_approval_safe : allowed (requires human approval downstream)
- sales.request_order_approval      : denied（unsafe）

---

# 2. 引数制約（推奨）
- company_id 必須
- actor_id/policy_id 必須（監査のため）
- idempotency_key 必須（再送安全）
- event_id/event_version/source_os 必須（追跡）

---

# 3. 影響レベル（risk_level）
0: READ ONLY
1: 提案/診断（記録のみ）
2: 承認要求（pending化）
3: 予約/下書き作成
4: 確定（原則禁止）
5: 金銭確定（禁止）

軍用デフォルト:
- AI Actorは最大でも 2（承認要求）まで
- 4/5 は人間のみ
