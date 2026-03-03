# 54 Cross-OS Trace and Evidence Model（横断追跡/証跡 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorが OS を跨いでも、event_id を軸に「何が起きたか」を再構成できる状態を固定する。

---

# 1. 共通追跡キー（必須）
- action_id（行為単位UUID）
- event_id（イベントUUID）
- correlation_id（E2E）
- actor_id / persona_id / owner_user_id
- os_key（source/target）
- event_version
- occurred_at
- signature_base64（行為署名）
- rpc_args_hash / payload_hash（否認防止）

---

# 2. 証跡配置（推奨）
- PersonaOS: persona_action_log（意思決定/理由）
- Integration: external_event（境界）
- 各OS: domain log（業務/配信/ゲーム/ライフ/ガバナンス）

---

# 3. 重要原則
- 証跡は append-only を推奨
- 改ざん可能領域がある場合は「ハッシュ連鎖」を検討（将来拡張）
