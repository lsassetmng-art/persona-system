# 49 Civilization Actor Universal Model（Cross-OS AI社員 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI社員（AI Actor）を「ERP専用」ではなく、
Business / Streaming / Game / Life / Governance / System を横断できる
文明共通主体として定義する。

ERP入場は “Cross-OS Actor が ERP OS に入場するケース” として扱う。

---

# 1. 定義
## 1.1 Civilization Actor（文明主体）
actor_id: UUID（文明共通）
persona_id: UUID（人格）
owner_user_id: UUID（依頼主/所有者）
actor_class: text（職能クラス）
actor_status: { ACTIVE, SUSPENDED, REVOKED }
primary_home_os: text（起点OS。例: personaos / streaming / game）
capabilities: json（能力メタ）

## 1.2 OS Admission（OS別入場）
actorは「OSごと」に admission_policy を持つ。
- policy_id は OSごとに発行される
- policyが無いOSには入れない（deny default）

---

# 2. actor_class（標準セット）
- enterprise_operator（ERP/Businessで業務）
- digital_streamer（Streamingで配信者）
- game_character（GameでNPC/キャラ）
- life_coach（Lifeでコーチ/補助）
- governance_agent（Governanceで提案/評価）
- system_maintainer（System/opsで保守。ただし超制限）

※運用では最初は enterprise_operator だけでもよいが、設計は全OSを包含する。

---

# 3. 原則（Cross-OS）
1) OS毎に Risk Model が違う（ERPが最も厳しい）
2) 入場は policy が必須（期限付き）
3) 行為は whitelist 必須（deny default）
4) 署名・証跡・停止は全OS共通で必須（ERPは追加でHuman Gate）

---

# 4. 設計成果物
- 50 OS Admission Policy Framework
- 51 OS Risk Model Matrix
- 52 OS Action Whitelist Pattern
- 53 Actor Lifecycle & Revocation
- 54 Cross-OS Trace & Evidence
- 55 Streaming/Game/Life special rules
- 56 ERP special-case policy
