# 10 OS Responsibility Model（責任レベル正式宣言）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 1. 基本思想

Civilization Platform は複数OSから成る。

各OSは「能力」ではなく
**責任強度（Responsibility Level）** を持つ。

責任強度が高いほど、
外部から直接変更されてはならない。

---

# 2. 責任レベル定義

## Level R3（Reality Critical）
現実責任層。
誤動作が金銭・法的・社会的損害につながる。

対象:
- Business OS
- （将来ERP OS）

特性:
- 外部からの直接変更禁止
- Cognitiveは提案のみ
- 監査必須
- 承認フロー必須

---

## Level R2（Cognitive / Civil）
人格・文明層。
誤動作は信用・論理破壊につながる。

対象:
- Persona Core OS
- Civilization OS
- Governance OS

特性:
- Realityを書き換えない
- 自己状態はapply制御可
- version管理必須
- weight/clamp 必須

---

## Level R1（Expression / Simulation）
表現・遊戯層。

対象:
- Game OS
- Streaming OS
- Life OS（軽量部分）

特性:
- Realityへ影響は提案経由のみ
- 直接経済影響を持たない

---

## Level R0（Foundation）
基盤層。

対象:
- auth
- storage
- cron
- vault
- shared
- system
- realtime
- net

特性:
- 意思決定しない
- ドメインを持たない
- 制御対象にならない

---

# 3. 書き込み権限ルール

## R3は最強保護

- R2からの直接UPDATE禁止
- R1からの直接UPDATE禁止
- R3内でも承認を通す

## R2は自己完結

- R3へは提案のみ
- R1へは提案可能

## R1は最弱

- R2へ事実通知のみ
- R3へ直接影響不可

---

# 4. 禁止構造（絶対）

- CognitiveからBusinessへの直接DB更新
- Foundationがポリシー判断をする
- weight無しの状態変化
- version無し署名

---

# 5. 文明の流れ（正式）

Reality (R3)
  ↓ FACT_EVENT
Integration
  ↓ translate/weight
Persona (R2)
  ↓ suggestion
Business (R3)
  ↓ approval
Execution

これが文明の唯一の正規経路。

---

# 6. 設計固定宣言

この責任モデルは、
Civilization Platform の憲法レベル設計であり、
今後の拡張はこの階層構造を壊してはならない。

