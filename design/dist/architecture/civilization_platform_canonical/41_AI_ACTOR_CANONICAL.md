# 41 AI Actor Canonical（AI社員/入場Persona 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
PersonaOS上のPersonaが、ERP（現実業務）へ「AI社員」として入場し業務行為を行うための
最小かつ厳格なモデルを固定する。

前提（確定）:
- ERP = 現実の経営情報・現実確定（DATABASE_URL）
- PersonaOS = 非現実情報・人格/行動生成（PERSONA_DATABASE_URL）
- 越境は Integration（文明側）を唯一経路とする

---

# 1. 定義
## 1.1 AI Actor（AI社員）
ERPに対して「提案/診断/実行要求」を出せる主体。
ただし現実確定は原則「人間承認」または「限定自動」だけ許す。

## 1.2 Admission（入場）
AI ActorがERP側の認可（役割/スコープ/許可RPC）を得て、
署名付きで行動を要求できる状態。

---

# 2. 設計原則（軍用レベル）
1) Fail-Closed：不明・欠落・検証不能はすべて拒否
2) Least Privilege：許可は最小集合、denyがデフォルト
3) Non-repudiation：行動は署名・証跡により否認不可能
4) Human-in-the-loop：現実確定は原則人間承認
5) Kill-switch：瞬時停止（persona / os / route / rpc 単位）
6) Traceability：event_id/correlation_idでE2E追跡可能

---

# 3. 層（5層モデル）
L1 Persona Identity（PersonaOS）
L2 Keys & Signatures（署名/失効）
L3 Admission Policy（ERP側入場資格）
L4 Allowed Actions（許可RPC/スコープ）
L5 Evidence & Audit（否認防止/監査）

---

# 4. 生成物（本設計群）
- 42: Identity & Keys
- 43: Admission Policy
- 44: Allowed Actions/RPC whitelist
- 45: Audit Evidence/Non-repudiation
- 46: Runtime Guards/Kill-switch
- 47: Workflow/Approval gates
- 48: Threat model/controls
