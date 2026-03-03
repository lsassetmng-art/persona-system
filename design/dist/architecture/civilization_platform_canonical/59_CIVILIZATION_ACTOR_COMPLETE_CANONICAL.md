# 59 Civilization Actor Complete Canonical（最終統合正本）
status: FINAL_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

============================================================
0. 目的
============================================================

CivilizationにおけるAI社員（Civilization Actor）の
最終・唯一の参照設計。

本書は以下を統合する：

- Universal Cross-OS Actor Model
- OS Admission Policy Framework
- Risk Model Matrix
- OS Action Whitelist
- Actor Lifecycle & Revocation
- Cross-OS Trace & Evidence
- Streaming/Game/Life特則
- ERP特則（軍用レベル）
- Bootstrap最小構成
- Stop / Fail-Closed原則
- テスト要件

今後の変更はパッチ方式のみ。
分割設計は禁止。

============================================================
1. 最上位構造
============================================================

Civilization Actor（文明主体）
    ↓
OS Admission Policy
    ↓
OS Risk Model
    ↓
OS Action Whitelist
    ↓
OS Execution Layer
    ↓
Audit & Evidence Layer

============================================================
2. Civilization Actor（最上位定義）
============================================================

actor_id: UUID（文明共通ID）
persona_id: UUID
owner_user_id: UUID
actor_class:
  - enterprise_operator
  - digital_streamer
  - game_character
  - life_coach
  - governance_agent
  - system_maintainer

actor_status:
  - ACTIVE
  - SUSPENDED
  - REVOKED

primary_home_os: text
allowed_os: text[]

原則：
- deny default
- OS単位で入場
- 署名必須
- 証跡必須
- 停止可能

============================================================
3. OS Admission Policy Framework
============================================================

policy_id
os_key
binds(actor_id, persona_id, owner_user_id)
scope(tenant/company/world/user)
allowed_actions[]
max_risk_level
require_signature
require_human_approval
issued_at
expires_at（必須）
status(ACTIVE/SUSPENDED/REVOKED)

Fail-Closed:
検証不能 → 拒否

============================================================
4. Risk Model Matrix
============================================================

0: READ ONLY
1: RECORD ONLY
2: REQUEST（承認要求）
3: DRAFT/RESERVE
4: COMMIT REALITY（原則AI禁止）
5: MONEY/LEGAL（禁止）

OS別最大値:

ERP: 2
Business: 3
Streaming: 3
Game: 3
Life: 2
Governance: 1
System: 1

============================================================
5. OS Action Whitelist
============================================================

whitelist entry:

- os_key
- action_key
- target_schema
- target_rpc
- risk_level
- require_signature
- require_human_approval
- arg_schema_hash
- rate_limit
- is_active

禁止：
- whitelist無し実行
- unsafe RPC（ERP）
- 引数固定なし

============================================================
6. Identity & Signature
============================================================

Ed25519鍵
key_id
sig_ver
revocation対応

署名対象 canonical_action:

{
  action_id,
  event_id,
  correlation_id,
  actor_id,
  persona_id,
  owner_user_id,
  os_key,
  target_schema,
  target_rpc,
  rpc_args_hash,
  event_version,
  occurred_at,
  policy_id
}

signature_base64 必須。

============================================================
7. Cross-OS Trace Model
============================================================

共通キー:

action_id
event_id
correlation_id
actor_id
policy_id
os_key
event_version
rpc_args_hash
signature_base64

証跡配置:

PersonaOS
Integration
各OSログ

append-only推奨。

============================================================
8. Streaming / Game / Life 特則
============================================================

Streaming:
- channel_id scope必須
- 金銭連動はrisk>=2

Game:
- world_id scope必須
- 現実確定なし（課金除く）

Life:
- user_id scope必須
- 提案/申請まで

============================================================
9. ERP 特則（軍用レベル）
============================================================

絶対条件:

- max_risk_level=2
- *_safe RPCのみ
- company_id必須
- policy_id必須
- 署名必須
- Human-in-the-loop必須
- Integration経由のみ

二重防御:
Integration + ERP guard

============================================================
10. Actor Lifecycle & Stop
============================================================

状態:
PROVISIONED
ACTIVE
SUSPENDED
REVOKED

停止順序:

1) maintenance_mode
2) os_enabled
3) policy revoke
4) actor suspend
5) key revoke
6) whitelist disable

Fail-Closed。

============================================================
11. Bootstrap Minimum（最初の1体）
============================================================

actor_class: enterprise_operator
allowed_os: erpos

policy:
erp_enterprise_operator_v1
allowed_actions:
  - erp.sales.request_order_approval_safe
risk=2
expires_at必須

承認必須。
金銭確定禁止。

============================================================
12. テスト要件
============================================================

- Stop test成功
- Idempotency test成功
- Signature reject test成功
- Policy expiry test成功
- Whitelist外拒否成功
- ERP guard test成功
- event_version passthrough確認

============================================================
13. 最終固定原則
============================================================

1) Civilization Actor が最上位
2) ERPは特則
3) deny default
4) Fail-Closed
5) 署名・証跡必須
6) 分割設計禁止（本書が唯一の正本）

============================================================

END OF CANONICAL DESIGN
