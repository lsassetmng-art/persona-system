# ============================================================
# CIVILIZATION OS — 全体宇宙図（Universe Map）
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
文明・世界・人格・ERP・アプリを含む「宇宙構造」を1枚で固定する。

------------------------------------------------------------
COSMOS STACK
------------------------------------------------------------

[ HUMAN ADMIN / OWNER ]
  - 現実世界の管理者（最終責任）
  - ルール変更の責任主体
        |
        v
[ GOVERNANCE LAYER ]
  - Policy / Approval / Audit / Compliance
  - 変更は proposal -> review -> approval -> activation
        |
        v
[ CIVILIZATION OS CORE ]
  - Runtime Scheduler / Tick Engine
  - Event Universe (standard / registry / outbox)
  - Dispatcher / Apply Engine
  - Checkpoint / Replay
  - Metrics / Observability
        |
        v
[ WORLDS ]
  - Civilization / Life / Business / ERP / Persona
  - 世界間は event のみ（直接更新禁止）
        |
        v
[ PERSONAOS (Truth Owner) ]
  - persona_state の唯一の所有者
  - snapshot の唯一の発行者
        |
        v
[ SNAPSHOT LAYER ]
  - Canonical JSON + Ed25519
  - 静的証明（削除不可、失効のみ、同期は再発行）
        |
        v
[ APPLICATIONS ]
  - PocketSecretary / ERP UI / Mobile Apps / Analytics
  - snapshot consumer（persona_state 直接更新禁止）

------------------------------------------------------------
TRUTH OWNERSHIP（真実の所在）
------------------------------------------------------------
- Persona truth  : PersonaOS.persona_state
- World truth    : Event history (WORLD_EVENT / DOMAIN_EVENT)
- Public truth   : Snapshot (signed certificate)
- Sync           : Re-issue only (再発行のみ)

------------------------------------------------------------
CROSS-WORLD COMMUNICATION（世界間通信）
------------------------------------------------------------
- direct DB mutation prohibited
- boundary crossing requires:
  - schema_hash
  - signature
  - key_id
- validation is fail-closed

------------------------------------------------------------
END
------------------------------------------------------------
