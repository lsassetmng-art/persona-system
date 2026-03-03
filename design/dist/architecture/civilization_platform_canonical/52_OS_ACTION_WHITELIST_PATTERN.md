# 52 OS Action Whitelist Pattern（OS別ホワイトリスト設計 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorが実行できる行為を OSごとに whitelist 化し、deny default を固定する。

---

# 1. whitelistエントリ（概念）
- os_key
- action_key（OS内の抽象行為）
- target_schema / target_rpc（DB型OSの場合）
- risk_level
- require_signature
- require_human_approval
- arg_schema_hash（引数スキーマ固定）
- rate_limit（推奨）
- is_active

---

# 2. OS別の action_key 例
ERP:
- erp.sales.request_order_approval_safe
Business:
- business.task.create_draft
Streaming:
- streaming.channel.schedule_stream
- streaming.asset.request_overlay
Game:
- game.world.spawn_npc_draft
- game.character.emote
Life:
- life.habit.suggest
- life.goal.request_change
Governance:
- governance.policy.propose

---

# 3. 禁止
- whitelist無しでの実行
- unsafe RPC（*_safe以外）の許可（ERP）
- 引数スキーマの未固定（後から抜け穴になる）
