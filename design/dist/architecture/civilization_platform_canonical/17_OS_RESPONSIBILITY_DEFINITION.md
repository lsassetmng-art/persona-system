# 17 OS Responsibility Definition（OS責務 完全定義）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
ErpOS / PersonaOS / BusinessOS / LifeOS / GameOS / StreamingOS / CivilizationOS / GovernanceOS / IntegrationOS
の「責務・境界・データ性質・許可される行為」を固定する。

---

# 1. 共通の大原則（再掲）
- Reality（現実）と Cognitive（非現実）は分離する
- OS間通信は Integration が唯一の公式窓口
- R3 > R2 > R1 > R0 の責任階層を破らない
- 署名・version・監査・停止可能性は必須

---

# 2. OS一覧（目的と中身）

## 2.1 ERP OS（ErpOS）【R3: Reality Critical】
### 対象ユーザー
- 現実の企業・個人（実運用）

### データの性質
- 現実の経営情報（財務/会計/販売/購買/在庫/人事/監査…）
- 法的・金銭的責任が発生するデータ

### やること（許可）
- 取引を確定する（Execution）
- 会計・在庫・支払等の現実確定
- 監査証跡の保存
- 承認フロー（approval）により意思決定

### やらないこと（禁止）
- Personaの内部状態を直接変更しない
- 推論結果を事実として保存しない（提案として保存）
- 署名なしの越境入力を採用しない

### 受け入れるイベント
- FACT_EVENT（署名・検証済み）
- APPROVAL（承認済み）
- EXECUTION（確定行為）

---

## 2.2 Business OS（BusinessOS）【R3: Reality Critical】
### 位置づけ
- 「小さな業務アプリを動かす基盤」
- ERPと連携するが、ERPそのものではない

### データの性質
- 小規模業務の現実データ（タスク/承認/通知/決裁ログ等）
- 企業運用に近いが、ERP全域ほどの重責ではない

### やること（許可）
- タスク管理・承認・通知・意思決定ログ
- 軽量業務プロセスを確定する
- ERPへの連携用 FACT_EVENT の生成（署名対象）

### やらないこと（禁止）
- ERPの中核台帳を直接持たない（会計台帳など）
- Personaの推論を事実として確定しない

---

## 2.3 Persona OS（PersonaOS / PersonaCoreOS）【R2: Cognitive】
### 対象ユーザー
- 現実の企業・個人（利用者は現実だが中身は非現実）

### データの性質
- 非現実の情報（人格/感情/成長/記憶/ビジュアル状態）
- 「人のように振る舞うための内部状態」

### やること（許可）
- persona_state の更新（apply）
- growth/memory の蓄積
- visual generation / snapshot 署名
- AI社員（persona）生成・管理

### やらないこと（禁止）
- ERP/Businessの現実データを直接変更しない
- 自己推論を現実確定として書かない

### 出すイベント
- SUGGESTION（提案）
- DIAGNOSIS（診断）
- CONSULT_RESULT（助言）
※すべて “実行ではない”

---

## 2.4 Integration OS（IntegrationOS）【R2: Gateway/Cognitive】
### 目的
- OS間の唯一の公式窓口（verify/route/translate/weight）

### データの性質
- external_event（署名付き入力）
- event_registry（翻訳表 + weight）
- trusted_keys / revoked_keys（信頼基盤）

### やること（許可）
- 署名検証
- event_type 翻訳（erp_event_type → persona_event_type 等）
- weight 適用ルールの供給（ただし実際のapply計算はDB関数でやる）

### やらないこと（禁止）
- domain state を持たない
- 現実確定をしない

---

## 2.5 Civilization OS（CivilizationOS）【R2: Governance Runtime】
### 目的
- multi-world の管理
- dispatcher基盤（世界を回す）

### データの性質
- world_registry / cross_world_rule / snapshot_store 等
- 世界のメタ管理（統治）

### やること（許可）
- world enable/disable
- dispatcherの共通ロジック
- retry/dead letter の共通回収

### やらないこと（禁止）
- 各OSのドメイン判断をしない

---

## 2.6 Governance OS（GovernanceOS）【R2: Policy】
### 目的
- 統治（政策・規範・評価）
- “文明のルール”を生成する

### データの性質
- policy / proposal / triple_state 等
- OS横断の規範

### やること（許可）
- POLICY_EVENT の発行
- ルール改定提案

### やらないこと（禁止）
- ERPの現実確定を直接実行しない（承認を通す）

---

## 2.7 Life OS（LifeOS）【R1: Personal Reality-lite】
### 目的
- 個人生活の記録/習慣/健康

### 特性
- R3ほど重くないが、個人現実に近い
- 原則は提案/支援が中心

### 禁止
- 企業ERPの直接更新

---

## 2.8 Game OS（GameOS）【R1: Simulation】
### 目的
- 仮想世界のゲーム状態

### 禁止
- 現実台帳の確定は不可

---

## 2.9 Streaming OS（StreamingOS）【R1: Expression】
### 目的
- 演出・配信・VTuber/Actor運用

### 禁止
- 現実台帳の確定は不可

---

# 3. 「AI社員がERPに来る」公式経路（固定）
AI社員は PersonaOS に所属するが、ERPに関与できる。

ただし直接実行しない。

経路：
1) ERP/Business が FACT_EVENT を Integration に出す（署名）
2) Integration が翻訳/weight して PersonaOS に渡す
3) PersonaOS が SUGGESTION / DIAGNOSIS を生成
4) BusinessOS が approval を通す
5) 承認されたものだけが ERP/Business の Execution になる

AI社員は「提案者」であり「実行者」ではない。

---

# 4. 絶対禁止まとめ
- PersonaOS → ERP/Business の直接更新
- Integration 経由なしの越境
- 署名なし越境入力の採用
- event_version 無しの境界イベント
- system_control 無しOS追加

---

# 5. 凍結宣言
本定義は文明の責務分離の正本であり、
今後の拡張はこの枠組みを破らない。

