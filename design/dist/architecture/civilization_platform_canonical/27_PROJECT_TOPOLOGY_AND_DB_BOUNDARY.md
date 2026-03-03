# 27 Project Topology and DB Boundary（プロジェクト境界 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
DB/プロジェクト境界を固定し、誤接続・誤越境を設計で封じる。

---

# 1. 接続変数（確定）
- DATABASE_URL = ERP Project only
- PERSONA_DATABASE_URL = Persona Project（文明側OS全集約）

---

# 2. Persona Project（文明側）
含まれるOS（例）:
- civilization
- personaos
- integration
- business（軽量業務基盤）
- life / game / streaming / governance / system / shared など

責務:
- Dispatcher/Apply/Ingest/Signature/Snapshot/World registry
- OS間イベントの運行（ただしERPの現実確定はしない）

---

# 3. ERP Project（現実業務側）
スキーマはドメイン分割:
- sales, purchase, accounting, inventory, approval, workflow, finance, hr, …
（※ business スキーマは存在しない）

責務:
- 現実台帳の確定
- domain単位の停止（system_control）で制御

---

# 4. 越境の唯一経路
ERP ↔ Persona は「Integration（文明側）」のみ。
- 署名・検証・翻訳・weight・route を必須化

禁止:
- 直DB参照での越境更新
- Integrationバイパス
