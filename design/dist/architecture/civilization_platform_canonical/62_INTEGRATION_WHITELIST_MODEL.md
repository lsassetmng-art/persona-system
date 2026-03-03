# 62 Integration Whitelist Model（行為ホワイトリスト 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
OSごとに許可される action を固定し、deny default を実現する。

---

## 1. integration.actor_whitelist（DBモデル）
- os_key (text)
- action_key (text) … 抽象行為キー（例: erp.sales.request_order_approval_safe）
- target_schema (text) … DB型OSのschema（ERP等）
- target_rpc (text) … 実行RPC名（*_safe推奨）
- risk_level (int)
- require_signature (bool)
- require_human_approval (bool)
- arg_schema_hash (text, nullable) … 引数スキーマ固定（将来）
- rate_limit_per_min (int, default 60)
- is_active (bool)
- created_at, updated_at
PK: (os_key, action_key)

Fail-Closed:
- whitelistに無い / is_active=false → reject
