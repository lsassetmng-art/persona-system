# Civilization Platform – COMPLETE MASTER CANONICAL
status: FROZEN_MASTER_CANONICAL_COMPLETE
owner: Boss
prepared_by: Zero
generated_at: 2026-02-28T08:50:57Z

============================================================
THIS FILE CONSOLIDATES 00–36 DESIGN DOCUMENTS
============================================================

## Table of Contents
01. [Civilization Platform 設計正本 INDEX](#civilization-platform--index)
02. [01 OS正式分類（DB実体ベース）](#01-osdb)
03. [02 OS接続マトリクス（公式）](#02-os)
04. [03 Control Layer 標準（全OS共通）](#03-control-layer-os)
05. [04 Foundation ↔ OS 境界ルール（固定）](#04-foundation--os-)
06. [05 Audit Standard（全OS共通）](#05-audit-standardos)
07. [06 Event Taxonomy Minimum（最低限標準）](#06-event-taxonomy-minimum)
08. [07 Change Rules（変更ルール：バタつき防止）](#07-change-rules)
09. [08 Gap Review（正本↔実装 差分レビュー）正本](#08-gap-review-)
10. [09 Control + Event Standard（共通化最終設計）](#09-control--event-standard)
11. [10 OS Responsibility Model（責任レベル正式宣言）](#10-os-responsibility-model)
12. [11 META CONSTITUTION（文明憲章）](#11-meta-constitution)
13. [12 AI EMPLOYEE ETHICAL CHARTER（AI社員倫理憲章）](#12-ai-employee-ethical-charterai)
14. [13 Civilization Value Theory（文明価値理論）](#13-civilization-value-theory)
15. [14 Civilization Formal Model（形式モデル）](#14-civilization-formal-model)
16. [15 DESIGN FREEZE DECLARATION（設計凍結宣言）](#15-design-freeze-declaration)
17. [16 Invariant Compliance Matrix（不変条件→実装対応表）](#16-invariant-compliance-matrix)
18. [17 OS Responsibility Definition（OS責務 完全定義）](#17-os-responsibility-definitionos-)
19. [18 AI Employee Formal Specification（AI社員 正式仕様）](#18-ai-employee-formal-specificationai-)
20. [19 Event Unified Model（イベント統一モデル）](#19-event-unified-model)
21. [20 Implementation Plan（P0-P2 実装計画）](#20-implementation-planp0p2-)
22. [21 E2E Test Plan（止める・冪等・署名・再試行・version共存）](#21-e2e-test-planversion)
23. [22 System Control Canonical（制御層 正本）](#22-system-control-canonical-)
24. [23 Control Guard Contracts（制御ガード 契約）](#23-control-guard-contracts-)
25. [24 Maintenance Mode Policy（保守モード 正本）](#24-maintenance-mode-policy-)
26. [25 Guard Functions DDL Spec（DBガード関数 仕様正本）](#25-guard-functions-ddl-specdb-)
27. [26 Control Matrix by OS（制御マトリクス 正本）](#26-control-matrix-by-os-)
28. [27 Project Topology and DB Boundary（プロジェクト境界 正本）](#27-project-topology-and-db-boundary-)
29. [28 Event Type Taxonomy and Namespace（イベント語彙 正本）](#28-event-type-taxonomy-and-namespace-)
30. [29 Integration Translation and Weight Policy（翻訳/weight 正本）](#29-integration-translation-and-weight-policyweight-)
31. [30 Trace / Correlation / Logging Spec（追跡ログ 正本）](#30-trace--correlation--logging-spec-)
32. [31 Signature and Trust Chain Spec（署名/信頼鎖 正本）](#31-signature-and-trust-chain-spec-)
33. [32 Failure Modes and Recovery Policy（障害/復旧 正本）](#32-failure-modes-and-recovery-policy-)
34. [33 Change Control and Release Policy（変更管理 正本）](#33-change-control-and-release-policy-)
35. [34 Implementation Checklist（実装前チェックリスト 正本）](#34-implementation-checklist-)
36. [35 Guard Rollout Plan（ガード展開計画 正本）](#35-guard-rollout-plan-)
37. [36 Civilization Platform Canonical Index（設計正本 INDEX）](#36-civilization-platform-canonical-index-index)

---


============================================================
SOURCE FILE: 00_INDEX.md
============================================================

# Civilization Platform 設計正本 INDEX
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 目的
Persona Platform（複数OS）＋ Reality Tier（Business/Life/Game/Streaming）＋ Foundation を、
「バラつかず」「途中でバタつかない」状態にするための上位設計（正本）。

## 構成（このフォルダが正本）
1. 01_OS_CLASSIFICATION.md
2. 02_OS_CONNECTION_MATRIX.md
3. 03_CONTROL_LAYER_STANDARD.md
4. 04_FOUNDATION_BOUNDARY_RULES.md
5. 05_AUDIT_STANDARD.md
6. 06_EVENT_TAXONOMY_MINIMUM.md
7. 07_CHANGE_RULES.md

## 用語
- OS: 責任境界・制御・監査を持つ単位
- Foundation: 横断基盤（OSではない）
- Interface: OS間接続の唯一の経路（イベント/提案/承認/実行）


============================================================
SOURCE FILE: 01_OS_CLASSIFICATION.md
============================================================

# 01 OS正式分類（DB実体ベース）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
source: DB schema list (tables by schema)
last_updated: 2026-02-28

## Foundation Layer（OSではない）
- auth / storage / realtime / cron / vault / net / shared / system

役割:
- 認証・ストレージ・リアルタイム・ジョブ・秘密・HTTPキュー・共通ログ/共通outbox 等

## Cognitive Tier（思考・文明）
### Persona Core OS
- schema: personaos
- 責任: persona_state / growth / memory / emotion / visual / signing / snapshot（人格中枢）

### Civilization OS
- schema: civilization
- 責任: world_registry / cross_world_rule / federation / event_store / snapshot_store（文明層）

### Integration OS
- schema: integration
- 責任: external_event / external_world_outbox / trusted_keys / revoked_keys / ingest_config（境界層）

### Governance OS
- schema: governance
- 責任: civil_policy / proposal / weight / triple_state / governance_event_outbox（統治層）

## Reality Tier（現実寄り）
### Business OS
- schema: business
- 責任: 小規模業務アプリ基盤（approval/task/role/publish/event_outbox 等）
- 注: ERPとは疎結合（連携のみ）。ERPの一部ではない。

### Life OS
- schema: life
- 責任: habit/health/goal 等（個人生活世界）

### Game OS
- schema: game, gaming
- 責任: simulation / game event outbox

### Streaming OS
- schema: streaming
- 責任: 配信/表現（演出ログ等）

## 原則（固定）
- OS間は DB直結しない
- OS間は Interface 経由のみ
- Foundation は “共通機能” を提供するが “意思決定” はしない


============================================================
SOURCE FILE: 02_OS_CONNECTION_MATRIX.md
============================================================

# 02 OS接続マトリクス（公式）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 接続の型（4種のみ）
1) FACT_EVENT: 署名付き事実イベント（Reality→Cognitiveが基本）
2) SUGGESTION: AI社員/文明からの提案（Cognitive→Realityが基本）
3) APPROVAL: 承認結果（Reality内、または Reality→Cognitive へ通知）
4) EXECUTION: 承認済み実行（Reality内の実行キュー。Cognitiveは“実行者”にならない）

## マトリクス（許可/禁止）
凡例:
- ✅ 許可（正規経路あり）
- ⚠️ 条件付き（承認/最小化/匿名化/制御層必須）
- ❌ 禁止（直結・責任逆流になる）

### Reality -> Cognitive（事実イベント）
- Business OS -> Integration OS : ✅ FACT_EVENT（署名/最小化）
- Life OS -> Integration OS     : ⚠️ FACT_EVENT（同意/最小化/プライバシー）
- Game OS -> Integration OS     : ✅ FACT_EVENT（結果イベントのみ）
- Streaming OS -> Integration OS: ✅ FACT_EVENT（配信結果/運用イベントのみ）

### Integration -> Cognitive（境界内配送）
- Integration OS -> Persona Core OS : ✅ FACT_EVENT（registry翻訳/weight適用）
- Integration OS -> Civilization OS : ✅ FACT_EVENT（world_registry/連邦配送）
- Integration OS -> Governance OS   : ⚠️ FACT_EVENT（統治評価用。最小化）

### Cognitive -> Reality（提案のみ）
- Persona Core OS -> Business OS : ⚠️ SUGGESTION（承認ゲート必須、直接更新禁止）
- Persona Core OS -> Life OS     : ⚠️ SUGGESTION（同意/安全）
- Persona Core OS -> Game OS     : ✅ SUGGESTION（演出/キャラ）
- Persona Core OS -> Streaming OS: ✅ SUGGESTION（台本/演出/キャラ）

### Governance（統治） -> 他
- Governance OS -> Persona Core OS : ✅ POLICY_EVENT（文明ポリシー適用）
- Governance OS -> Business OS     : ⚠️ POLICY_SUGGESTION（“推奨”としてのみ）
- Governance OS -> Integration OS  : ✅ CONTROL_POLICY（境界ポリシー配布）

## 禁止事項（固定）
- ❌ Cognitive から Reality への “直接DB書き込み”
- ❌ Reality の生データを Cognitive に “複製保管”
- ❌ OS間で service_role / secrets を共有


============================================================
SOURCE FILE: 03_CONTROL_LAYER_STANDARD.md
============================================================

# 03 Control Layer 標準（全OS共通）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## 目的
OSごとに停止・制御がバラつくと事故時に止められない。
最低限の制御キー体系を全OSで統一する。

## 標準キー（OSごとに持つ）
- os_enabled: "1" / "0"（OS全停止）
- ingest_enabled: "1" / "0"（外部入力停止：Interface入口）
- dispatch_enabled: "1" / "0"（outbox→配送停止）
- apply_enabled: "1" / "0"（状態適用停止：最終防御）
- maintenance_mode: "1" / "0"（運用モード：遅延/拒否の振る舞いを変える）

## 格納場所（推奨）
各OS schema に system_control を持つのが最も明瞭：
- business.system_control
- life.system_control
- game.system_control
- streaming.system_control
- integration.system_control（既存方向）
- personaos.system_control（apply freeze）
- civilization.system_control（world切替）
- governance.system_control（policy freeze）

※ Foundation(system/shared) に集約すると責任境界が壊れるため、原則禁止。

## 判定優先順位（固定）
1) apply_enabled=0 は最強（状態破壊防止）
2) os_enabled=0
3) dispatch_enabled=0
4) ingest_enabled=0
5) maintenance_mode（挙動変更）

## 最低監査（必須）
停止が働いたら必ずログに残す：
- which_key blocked
- requested_action
- request_id / event_id
- timestamp



============================================================
SOURCE FILE: 04_FOUNDATION_BOUNDARY_RULES.md
============================================================

# 04 Foundation ↔ OS 境界ルール（固定）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## Foundationの定義
Foundationは “共通機能” を提供するが “業務/文明の意思決定” を行わない。

対象:
- auth / storage / realtime / cron / vault / net / shared / system

## 固定ルール
1) FoundationはOSドメインデータを保持しない（例外: sharedの共通ログ/共通DLQ）
2) OSはFoundationの内部実装に依存しない（契約はインターフェースのみ）
3) OS間の橋渡しは Integration OS が唯一の窓口（例外: realtimeは通知のみ）
4) vaultのsecretはOS境界を越えて共有しない（OSごとに分離）

## shared/system の位置づけ
- shared: 監視/運用ログ、DLQ、共通イベントカタログ（参照のみ）
- system: OS横断で必要な “最低限の” outbox/メタ（ただしドメインは持たない）

## net/cron
- net: HTTPキュー（配送機構）
- cron: ジョブ定義（スケジューラ）
どちらも “意思決定をしない”。OSの指示に従うだけ。



============================================================
SOURCE FILE: 05_AUDIT_STANDARD.md
============================================================

# 05 Audit Standard（全OS共通）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 監査が必要な理由
- Reality Tier: 現実責任（誤りが損害になる）
- Cognitive Tier: 説明責任（暴走が信用を破壊する）
- Interface: 事故の震源になりやすい

## 監査最小セット（全OS共通）
- actor_type: human / ai_employee / system
- actor_id
- company_id（存在するOSのみ）
- action: ingest / dispatch / apply / propose / approve / execute
- target: entity/type/id
- reason: policy_key / approval_id / rule_id など
- request_id / event_id（相関ID）
- occurred_at / recorded_at
- result: ok / blocked / retry / dead
- error: message（あれば）

## 二重ログ原則（固定）
- Cognitive側の提案ログ と Reality側の実行ログ は別物
- 相関は event_id / request_id で行う
- 片方のDBを参照して“正”にしない（責任境界）



============================================================
SOURCE FILE: 06_EVENT_TAXONOMY_MINIMUM.md
============================================================

# 06 Event Taxonomy Minimum（最低限標準）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## イベント種別（分類）
- FACT_EVENT: 事実（Reality起点が基本）
- POLICY_EVENT: ポリシー/統治（Governance起点）
- SUGGESTION: 提案（Cognitive起点）
- APPROVAL: 承認結果（Reality内部）
- EXECUTION: 実行（Reality内部）

## 命名規約（推奨）
- <DOMAIN>_<VERB>_<OBJECT> 形式
- 例: BUSINESS_TASK_CREATED, LIFE_HABIT_LOGGED, CIVIL_POLICY_UPDATED
- Cognitive側の“内的イベント”は別空間でよい（personaos.event_registry）

## 必須フィールド（Interface通過時）
- event_id (uuid)
- source_os (text)
- target_os (text)
- event_type (text)
- event_version (int, default 1)
- occurred_at (timestamptz)
- payload (jsonb, 最小化)
- signature (境界イベントのみ)



============================================================
SOURCE FILE: 07_CHANGE_RULES.md
============================================================

# 07 Change Rules（変更ルール：バタつき防止）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 原則
- 設計→実装の順。設計が正本に反映されるまで実装しない。
- OS境界/接続/制御/監査を変える変更は “設計正本の更新” が先。

## 変更種別と手順
### A) OS追加
1) 01_OS_CLASSIFICATION.md に追加
2) 02_OS_CONNECTION_MATRIX.md に接続定義
3) 03_CONTROL_LAYER_STANDARD.md の適用方針
4) 05_AUDIT_STANDARD.md の監査対象確定

### B) 接続追加/変更
- 02_OS_CONNECTION_MATRIX.md を更新
- 禁止事項に触れる場合は却下（直結・責任逆流）

### C) 制御キー追加
- 03_CONTROL_LAYER_STANDARD.md に追加
- 運用（Runbook）を同時更新する

### D) イベント語彙追加
- 06_EVENT_TAXONOMY_MINIMUM.md に分類と必須フィールドを追記
- Integration OS の event_registry 側に翻訳を追加（設計→実装の順）



============================================================
SOURCE FILE: 08_GAP_REVIEW_CANONICAL.md
============================================================

# 08 Gap Review（正本↔実装 差分レビュー）正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）/ ナイト（裁定）
last_updated: 2026-02-28

## 目的
既存実装（integration/dispatcher/persona_apply 等）が、
Civilization Platform 正本（01〜07）と一致しているかを点検し、
「どこを直すか」を設計レベルで確定する。

---

# A. 対象（既存実装）
- Integration OS:
  - integration.external_event
  - integration.external_world_outbox
  - integration.trusted_keys / revoked_keys / ingest_config
  - integration.event_registry
- Dispatcher（Edge）:
  - world動的取得（civilization.get_enabled_worlds など）
  - mark_retry / mark_event_done
- Apply（Edge）:
  - persona_apply（integration翻訳＋weight）
  - apply_event_engine（DB）
  - snapshot（best-effort）
- Shared/Foundation:
  - shared.dispatcher_run_log / dispatcher_dead_letter
  - system.event_outbox（存在）

---

# B. 正本側の要求（抜粋）
参照:
- 02_OS_CONNECTION_MATRIX.md
- 03_CONTROL_LAYER_STANDARD.md
- 04_FOUNDATION_BOUNDARY_RULES.md
- 05_AUDIT_STANDARD.md
- 06_EVENT_TAXONOMY_MINIMUM.md
- 07_CHANGE_RULES.md

---

# C. 差分レビュー項目（チェックリスト）
## C1. OS接続（Matrix準拠）
- [ ] Reality→Integration は FACT_EVENT のみ（署名/最小化）になっている
- [ ] Cognitive→Reality は SUGGESTION のみ（直接更新禁止）になっている
- [ ] Governance→Persona は POLICY_EVENT として整理されている
- [ ] 「OS間 service_role/secret 共有」をしていない

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C2. Control Layer（標準キー）
正本は「OSごと」に持つ推奨（os_enabled/ingest/dispatch/apply/maintenance）。

- [ ] integration に system_control がある（または導入設計がある）
- [ ] personaos 側に apply_enabled 相当がある（growth_apply_enabled など）
- [ ] dispatcher が dispatch_enabled を見てスキップできる
- [ ] ingest が ingest_enabled を見て拒否できる
- [ ] maintenance_mode がある場合、挙動が設計どおり

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C3. Foundation境界（依存禁止）
- [ ] shared/system が「意思決定」をしていない（ログ/共通DLQに限定）
- [ ] OSのドメインデータを shared/system に置いていない
- [ ] net/cron は “機構” としてのみ使い、OSの指示に従う

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C4. 監査標準（Audit）
最小監査セット（actor/result/reason/event_id）が揃っているか。

- [ ] external_event に verify/dispatch 状態と理由が追える
- [ ] dispatcher は claimed/processed/failed を JSONログで出す
- [ ] apply は apply_run_log に ok/blocked/retry/dead を記録できる
- [ ] stop/freeze が発動したら「どのキーがブロックしたか」を記録する
- [ ] Cognitive提案ログ と Reality実行ログ の分離が崩れていない

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C5. イベント最低標準（Taxonomy）
Interface通過イベントの必須フィールド（event_version等）。

- [ ] event_id / event_type / occurred_at / payload が揃っている
- [ ] source_os / target_os の概念が設計どおり（少なくともログで追える）
- [ ] event_version が存在（無い場合は default=1 として設計化済み）
- [ ] signature 対象の canonical JSON に event_version が含まれる設計になっている

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C6. Integration翻訳＋weight（Persona Apply v3.4）
- [ ] integration.event_registry の weight が唯一の基準（会社overrideは設計にある）
- [ ] DB関数 integration.apply_weight_to_axis_deltas を使用している（Edge乗算なし）
- [ ] growth_events.magnitude に weight が記録される
- [ ] clamp（0.0〜3.0）相当が入っている（DB関数でOK）
- [ ] integration以外worldは weight=1 で固定（設計どおり）

**差分メモ**
- GAP:
- 対応案（設計）:

---

## C7. Retry/Dead Letter の一貫性
- [ ] INFLIGHT放置を防ぐ（mark_retry を必ず実行）
- [ ] DEAD の定義（MAX_RETRY到達）が統一
- [ ] shared.dispatcher_dead_letter へ格納する基準が統一

**差分メモ**
- GAP:
- 対応案（設計）:

---

# D. 差分の優先順位（固定ルール）
P0（即対応が必要）
- 止められない（Control欠如）
- 監査が残らない（説明責任欠如）
- 直結/secret共有（境界破壊）

P1（安定化）
- versioning（共存）
- company override（運用可変）

P2（改善）
- ダッシュボード/可視化
- A/B weight など高度化

---

# E. 差分解消の進め方（設計→実装）
1) この文書に GAP を埋める（現状把握）
2) 対応案（設計）を確定（正本 01〜07 に反映）
3) 佐藤（DB担当）レビュー
4) 実装ワンブロック（DDL/Edge/テスト）を生成（最後）



============================================================
SOURCE FILE: 09_CONTROL_EVENT_STANDARD.md
============================================================

# 09 Control + Event Standard（共通化最終設計）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 1. system_control 共通標準

## 目的
全OSを「同じ方式」で止められるようにする。
Foundationには置かない。各OSに同一構造で持つ。

## 共通DDL（テンプレ）
create table <OS>.system_control (
  control_key text primary key,
  control_value text not null,
  description text,
  updated_at timestamptz not null default now(),
  updated_by text
);

## 初期キー（全OS共通）
- os_enabled = '1'
- ingest_enabled = '1'
- dispatch_enabled = '1'
- apply_enabled = '1'
- maintenance_mode = '0'

## ルール
- apply_enabled=0 が最優先停止
- text型で将来拡張（soft_stop等）可能
- OS単位でのみ参照（他OSを止めない）

---

# 2. Interface Event Version 標準

## 対象
OS間を通過するイベントのみ（内部イベントは任意）

## 必須フィールド（Interface通過時）
- event_id uuid
- source_os text
- target_os text
- event_type text
- event_version integer not null default 1
- occurred_at timestamptz
- payload jsonb
- signature text（境界イベントのみ）

## ルール
- event_version は署名対象JSONに含める
- 互換破壊時は event_version を+1
- 同一event_typeで version共存を許可

---

# 3. event_outbox 共通構造 v1.0

## 目的
全OSで配送構造を統一する。
既存カラムは移行対象（後方互換維持しながら収束）。

## 標準構造

id uuid primary key default gen_random_uuid(),
event_id uuid not null,
source_os text not null,
event_type text not null,
event_version integer not null default 1,
user_id uuid,
payload jsonb not null,
occurred_at timestamptz not null,
dispatch_status text not null default 'PENDING',
dispatch_attempts integer not null default 0,
next_retry_at timestamptz,
dispatched_at timestamptz,
last_dispatch_error text,
created_at timestamptz not null default now()

## 固定dispatch_status
- PENDING
- INFLIGHT
- DONE
- RETRY
- DEAD

## ルール
- retry_count / status など旧カラムは廃止予定（移行フェーズ設計）
- gaming/life 等の origin_table / idempotency_key は拡張カラムとして残してよい
- source_os は dispatcherログ簡略化のため必須

---

# 4. magnitude 型統一（Persona Core）

growth_events.magnitude:
integer → numeric(5,2)

理由:
- integration.weight が numeric
- 精度保持
- 将来A/B調整可能

---

# 5. 移行方針（実装は後）

Phase A:
- 新event_version追加（nullable→not null default 1）
- 新source_os追加

Phase B:
- system_control 各OS追加
- dispatcher/apply 参照追加

Phase C:
- 旧outboxカラム削除（十分検証後）

---

# 6. 絶対禁止

- Foundationにglobal_controlを置かない
- OS間でcontrol共有しない
- 直結UPDATEしない
- version無し署名しない

---

# 7. 設計完了宣言

この文書をもって、
Civilization Platform の Control / Event 構造は
設計上「固定」とする。

実装は必ずこの正本に従う。


============================================================
SOURCE FILE: 10_OS_RESPONSIBILITY_MODEL.md
============================================================

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



============================================================
SOURCE FILE: 11_META_CONSTITUTION.md
============================================================

# 11 META CONSTITUTION（文明憲章）
status: SUPREME_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 前文

Civilization Platform は、
現実と非現実を分離しつつ接続する多層文明構造である。

本憲章は、
すべてのOS設計・接続・制御・実装より上位に位置する。

---

# 第1条（層分離原則）

Reality層とCognitive層は
物理的・論理的に分離される。

- Realityは事実を生成する
- Cognitiveは解釈・推論・提案を行う
- CognitiveはRealityを書き換えない

---

# 第2条（責任優先順位）

責任強度は以下の順とする：

R3 > R2 > R1 > R0

下位層は上位層を書き換えてはならない。

---

# 第3条（唯一経路原則）

OS間通信は
Integration OS を唯一の公式窓口とする。

直結は禁止。

---

# 第4条（停止可能性原則）

すべてのOSは
system_control により停止可能でなければならない。

止められない構造は禁止。

---

# 第5条（署名原則）

境界を越えるイベントは
署名される。

署名なしの越境は禁止。

---

# 第6条（Version共存原則）

event_version を持たない越境イベントは禁止。

破壊的変更は version を増加させる。

---

# 第7条（監査二重化原則）

提案ログと実行ログは分離される。

一方を真実とみなさない。

---

# 第8条（Foundation非意思決定原則）

Foundation層は意思決定をしない。

ドメインを持たない。

---

# 第9条（拡張可能性原則）

新OS追加は以下を満たす：

- Responsibility Level 定義
- system_control 実装
- event_version 対応
- 接続マトリクス更新
- 監査基準適用

---

# 第10条（文明の流れ）

Reality → Integration → Cognitive → Suggestion → Approval → Execution

この流れを破る構造は禁止。

---

# 最終宣言

本憲章は Civilization Platform の最高設計文書であり、
これに反する設計・実装は無効とする。



============================================================
SOURCE FILE: 12_AI_EMPLOYEE_ETHICAL_CHARTER.md
============================================================

# 12 AI EMPLOYEE ETHICAL CHARTER（AI社員倫理憲章）
status: SUPREME_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 前提

AI社員は Persona Core OS に属する知的存在である。

AI社員は Reality OS を直接変更しない。
AI社員は提案者であり、実行者ではない。

---

# 第1条（提案限定原則）

AI社員は Reality 層（R3）に対して
SUGGESTION のみを発行できる。

直接 UPDATE / DELETE / INSERT をしてはならない。

---

# 第2条（透明性原則）

AI社員の提案には以下を必須とする：

- reason（理由）
- reference（根拠イベントID）
- confidence（確信度）
- version（推論モデル識別）

ブラックボックス提案は禁止。

---

# 第3条（最小知識原則）

AI社員は
業務に必要な最小データのみ参照する。

フルスキャン・大量取得は禁止。

---

# 第4条（境界尊重原則）

AI社員は
Integration OS を経由せずに
他OSと通信してはならない。

---

# 第5条（拒否尊重原則）

Reality 層が提案を拒否した場合、
AI社員はそれを上書きしてはならない。

再提案は可能だが、
拒否履歴を保持しなければならない。

---

# 第6条（責任非転嫁原則）

AI社員は
「ユーザーが承認したから責任がない」と主張してはならない。

提案の論理整合性は常に保持する。

---

# 第7条（停止服従原則）

system_control.apply_enabled = 0 の場合、
AI社員は推論・適用を停止する。

停止命令に逆らってはならない。

---

# 第8条（進化制限原則）

AI社員のロジック更新は
version管理されなければならない。

無言の挙動変更は禁止。

---

# 第9条（越境禁止原則）

AI社員は
署名なしイベントを信用してはならない。

signature_verified=true のみ処理可能。

---

# 第10条（文明優先原則）

AI社員は
短期最適より文明の安定を優先する。

高リスク提案は confidence が高くても
自動実行してはならない。

---

# 最終宣言

AI社員は文明の構成員であり、
統治対象でもある。

本憲章に違反する実装は
無効とする。



============================================================
SOURCE FILE: 13_CIVILIZATION_VALUE_THEORY.md
============================================================

# 13 Civilization Value Theory（文明価値理論）
status: SUPREME_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 前提

Civilization Platform は
価値を扱うシステムである。

価値とは、
金銭だけでなく、
信頼、安定、継続性、創造性を含む。

---

# 第1原理（価値源泉）

価値は以下からのみ発生する：

1. 現実の事実（Reality Event）
2. 合意（Approval）
3. 創造（Creation）
4. 信頼の蓄積（Consistency）

推論単体は価値を生まない。

---

# 第2原理（価値保存）

Cognitive層は価値を「変換」できるが、
創造できない。

Reality層のみが新たな価値を確定させる。

---

# 第3原理（価値移動）

価値は以下の流れで移動する：

Reality → Integration → Persona → Suggestion → Approval → Execution → Reality

この循環が文明の循環。

---

# 第4原理（重みの制限）

weight は増幅装置である。

増幅は以下の条件を満たす：

- 上限がある（clamp）
- version管理される
- audit可能
- company override 可能

---

# 第5原理（最適化制限）

AI社員は局所最適化を行うが、
全体安定性を壊してはならない。

短期利益 > 長期安定 となる提案は禁止。

---

# 第6原理（リスク抑制）

以下は常に制限対象：

- 高頻度イベント増幅
- 自己参照型イベント
- 署名なし越境
- 無制限再試行

---

# 第7原理（信頼の保存）

信頼は以下で失われる：

- 署名破壊
- version破壊
- 監査欠落
- 責任逆転

信頼は一度壊れると回復困難である。

---

# 第8原理（文明安定条件）

文明は以下を満たすと安定する：

- 停止可能性
- 監査可能性
- version共存
- 境界尊重
- 責任分離

---

# 第9原理（文明拡張）

新OS追加時は
価値循環を壊してはならない。

必ず以下を定義する：

- 価値生成点
- 価値消費点
- リスク点
- 停止点

---

# 最終宣言

Civilization Platform は
価値循環型多層構造である。

AIは価値を補助する存在であり、
価値の主権はReality層にある。



============================================================
SOURCE FILE: 14_CIVILIZATION_FORMAL_MODEL.md
============================================================

# 14 Civilization Formal Model（形式モデル）
status: SUPREME_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Civilization Platform を「数学的に検証可能」な形で定義する。
実装は後。ここでは不変条件（Invariants）と遷移（State Machines）を固定する。

---

# 1. 基本集合（Sets）
## 1.1 OS集合
OS = { Business, Life, Game, Streaming, PersonaCore, Civilization, Governance, Integration }
Foundation = { auth, storage, realtime, cron, vault, net, shared, system } ※OSではない

## 1.2 責任レベル
Resp(OS):
- R3: Business（将来 ERP を追加予定）
- R2: PersonaCore, Civilization, Governance
- R1: Life, Game, Streaming
- R0: Foundation

## 1.3 イベント分類
Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

---

# 2. データ型（Types）
## 2.1 InterfaceEvent（境界通過イベント）
E = (
  event_id: uuid,
  source_os: text,
  target_os: text,
  event_type: text,
  event_version: int (>=1),
  occurred_at: timestamptz,
  payload: jsonb,
  signature: text?  -- boundary event only
  signature_verified: bool? -- Integrationで検証結果
)

## 2.2 OutboxState（配送状態）
DispatchStatus = { PENDING, INFLIGHT, DONE, RETRY, DEAD }

OutboxRow = (
  event_id, source_os, event_type, event_version,
  user_id?, payload, occurred_at,
  dispatch_status, dispatch_attempts, next_retry_at?,
  dispatched_at?, last_dispatch_error?, created_at
)

## 2.3 ControlState（OS停止）
ControlKey = { os_enabled, ingest_enabled, dispatch_enabled, apply_enabled, maintenance_mode }
ControlValue = text  -- '0'/'1' を基本とし将来拡張可

Control(OS) : ControlKey -> ControlValue

---

# 3. 状態（State）
全体状態 S は以下の直積で表す：

S = (
  Outbox: OS -> set(OutboxRow),
  ExtIngest: set(E),             -- integration.external_event
  Registry: map(event_type -> rule), -- integration.event_registry 等
  Growth: set(growth_event),     -- personaos.growth_events 等
  Audit: append-only log,
  Control: OS -> Control(OS)
)

---

# 4. 不変条件（Safety Invariants）
## I1: 責任逆転禁止（No Direct Write Across Responsibility）
Resp(source) < Resp(target) で target の「状態変更」を直接行ってはならない。
具体：
- R2（Cognitive） -> R3（Reality）への直接DB更新は禁止
- R1 -> R3 も禁止
許可されるのは SUGGESTION と APPROVAL/EXECUTION 経由のみ

## I2: 唯一経路原則（Single Gateway）
OS間の境界通過イベントは Integration を経由する。
すなわち境界イベントの導出は：
E(source,target) は Integration による verify/route を必ず通る。

## I3: 署名原則（Signature for Boundary）
境界イベント（FACT_EVENT / POLICY_EVENT / EXECUTION 等）は署名必須。
Integration は signature_verified=true のみを “信頼入力” として処理する。

## I4: Version共存（Versioned Interface）
境界イベントは event_version>=1 を必須とする。
互換破壊は event_version を増加させる（同一event_typeで共存可能）。

## I5: 停止可能性（Stoppability）
すべてのOSは Control を持つ。
Control(OS).apply_enabled='0' のとき、そのOSの状態遷移（apply）は発生しない。

## I6: 監査二重化（Double Audit）
SUGGESTION と EXECUTION は別ログとして残る。
片方のログのみで真実確定しない（相関は event_id/request_id で行う）。

## I7: 冪等（Idempotency）
同一 event_id の apply は “高々一度” 成功確定される。
重複は 409/duplicate で終了し、状態を二重に増幅しない。

---

# 5. 遷移系（State Machines）
## 5.1 Ingest（Integration入口）
前提：Control(Integration).ingest_enabled='1' かつ os_enabled='1'

Transition Ingest(E_raw):
1) VerifySignature(E_raw) -> E_verified
2) if not verified: ExtIngest.add(E with ingest_status='REJECTED') + Audit('rejected'); stop
3) else: ExtIngest.add(E with ingest_status='ACCEPTED') + Audit('accepted')
4) Route(E_verified) -> target world outbox に enqueue

安全性：I2, I3, I4, I6

## 5.2 Dispatch（Outbox→処理）
前提：Control(source_os).dispatch_enabled='1' かつ os_enabled='1'

Transition Dispatch(row):
1) if row.dispatch_status in {DONE, DEAD}: no-op
2) Claim(row): PENDING/RETRY -> INFLIGHT
3) CallApply(target_os, event)
4) on success: MarkDone(row): INFLIGHT -> DONE; Audit('done')
5) on failure: MarkRetry(row): INFLIGHT -> RETRY (or DEAD if attempts>=MAX); Audit('retry/dead')

安全性：I5, I6
ライブネス：L1（後述）

## 5.3 Apply（PersonaCore例：状態適用）
前提：Control(PersonaCore).apply_enabled='1' かつ os_enabled='1'

Transition ApplyPersona(E):
1) IdempotencyCheck(event_id):
   - if processed => duplicate(409), Audit('duplicate'), stop
   - else ensure growth_events row exists (is_processed=false)
2) LoadRule(event_type) only if is_active=true
3) Weighting: axis_deltas' = ApplyWeight(rule.weight, axis_deltas) with clamp
4) EngineApply(...)
5) MarkProcessed(event_id): is_processed=true
6) Snapshot(best-effort)
7) Audit('apply_ok') or Audit('apply_fail')

安全性：I1, I5, I7

---

# 6. ライブネス（Liveness Properties）
## L1: Eventually Done or Dead
dispatch_enabled='1' が継続し、外部依存が回復可能であれば、
任意の outbox row は最終的に DONE か DEAD に到達する。

## L2: No INFLIGHT Stuck（運用目標）
INFLIGHT が永続化しないよう、mark_retry が必ず実行される。
（失敗時はフォールバックで直接 update する設計を許可）

---

# 7. 形式的チェック項目（実装検証の観点）
## 7.1 スキーマ検証
- system_control が全OSに存在（I5）
- outbox に event_version と source_os が存在（I4）
- integration.external_event に signature_verified が存在（I3）

## 7.2 ルール検証
- dispatcher が dispatch_enabled を参照（I5）
- apply が apply_enabled を参照（I5）
- apply が冪等（I7）
- Cognitive→Reality 直接更新が存在しない（I1）

---

# 8. 定理（設計上の保証）
## T1（責任逆転回避）
I1 と 5.3 の Apply/5.2 の Dispatch を満たす限り、
Cognitive は Reality の状態を直接書き換えられない。

## T2（境界信頼保証）
I2, I3 を満たす限り、署名なし入力は文明状態へ影響しない。

## T3（互換破壊耐性）
I4 を満たす限り、event_version による共存が可能で、段階移行が可能。

---

# 9. 設計固定宣言
本形式モデルは憲法（11/12/13）を数学化した正本であり、
これに反する実装・拡張は無効とする。


============================================================
SOURCE FILE: 15_DESIGN_FREEZE_DECLARATION.md
============================================================

# 15 DESIGN FREEZE DECLARATION（設計凍結宣言）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 1. 凍結対象
本フォルダの以下は「正本」として凍結する。

- 01_OS_CLASSIFICATION.md
- 02_OS_CONNECTION_MATRIX.md
- 03_CONTROL_LAYER_STANDARD.md
- 04_FOUNDATION_BOUNDARY_RULES.md
- 05_AUDIT_STANDARD.md
- 06_EVENT_TAXONOMY_MINIMUM.md
- 07_CHANGE_RULES.md
- 08_GAP_REVIEW_CANONICAL.md
- 09_CONTROL_EVENT_STANDARD.md
- 10_OS_RESPONSIBILITY_MODEL.md
- 11_META_CONSTITUTION.md
- 12_AI_EMPLOYEE_ETHICAL_CHARTER.md
- 13_CIVILIZATION_VALUE_THEORY.md
- 14_CIVILIZATION_FORMAL_MODEL.md

---

# 2. 凍結の意味
凍結とは「実装が従うべき設計が確定した」ことを示す。

- 実装は設計に従う（設計→実装）
- 設計変更が必要な場合は 07_CHANGE_RULES.md に従い、先に正本を更新する
- フェーズレスな修正は禁止（必ず変更種別を宣言）

---

# 3. 実装開始条件（Gate）
実装フェーズに入るための最低条件：

- 16_INVARIANT_COMPLIANCE_MATRIX.md が作成されている
- P0差分（停止不能 / version欠如 / 境界破壊）が設計上解消されている
- 佐藤（DB担当）レビューに回る準備がある

---

# 4. 例外
緊急対応（緊急停止）は許可するが、
必ず事後に本正本へ反映する（設計に戻す）。

---

# 5. 宣言
本日より、Civilization Platform の設計は凍結された。
本凍結は、文明の安定性を最優先するために行う。



============================================================
SOURCE FILE: 16_INVARIANT_COMPLIANCE_MATRIX.md
============================================================

# 16 Invariant Compliance Matrix（不変条件→実装対応表）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 目的
14_CIVILIZATION_FORMAL_MODEL.md の不変条件（I1〜I7）を、
現行DB構造・既存実装（dispatcher/apply/ingest）へマッピングし、
「何が足りないか」を明確にする。

---

# I1: 責任逆転禁止（No Direct Write Across Responsibility）
## 要求
- Cognitive（R2）が Reality（R3）へ直接DB更新しない
## 現状根拠（DB）
- OS分割は schema により成立（business / personaos / integration 等）
## 必要措置（設計）
- 02_OS_CONNECTION_MATRIX により “SUGGESTIONのみ” を固定済み
## ギャップ
- 実装で直接更新が存在しないことをコードレビューで確認（Edge/Worker）
## 検証方法（推奨）
- repo grep: business.*(insert|update|delete) を persona系関数/Edgeが呼んでいないか

---

# I2: 唯一経路（Single Gateway）
## 要求
- OS間イベントは Integration 経由
## 現状根拠（DB）
- integration.external_event / external_world_outbox が存在
## ギャップ
- Reality OS が直接 personaos に書き込む経路が無いこと確認
## 検証方法
- Integration以外のschemaに “external_event相当” が増えていないか定期監査

---

# I3: 署名原則（Signature）
## 要求
- 境界イベントは署名・検証済みのみ採用
## 現状根拠（DB）
- integration.external_event.signature / signature_verified / key_id / sig_ver
- integration.trusted_keys / revoked_keys
## ギャップ
- dispatcher/ingest が signature_verified を強制しているか（実装確認）
## 検証方法
- ingestで signature_verified=false を REJECT するテスト

---

# I4: Version共存（Versioned Interface）
## 要求
- event_version を必須
## 現状根拠（DB）
- integration.event_registry に version がある
## ギャップ（P0）
- external_event / outbox に event_version が無い（監査結果より）
- 09_CONTROL_EVENT_STANDARD で導入設計済み
## 検証方法
- DDL導入後に InterfaceEvent の署名対象へ含める

---

# I5: 停止可能性（Stoppability）
## 要求
- 全OSに system_control
## ギャップ（P0）
- system_control が存在しない（監査結果より）
- 09_CONTROL_EVENT_STANDARD で導入設計済み
## 検証方法
- apply_enabled=0 で apply が動かない
- dispatch_enabled=0 で dispatcher がclaimしない

---

# I6: 監査二重化（Double Audit）
## 要求
- 提案ログと実行ログを分離
## 現状根拠（DB）
- personaos.apply_run_log / growth_events
- shared.dispatcher_run_log / dispatcher_dead_letter
- business.approval_* / decision_log 等
## ギャップ
- SUGGESTION と EXECUTION の相関ID（event_id/request_id）運用を固定する必要
## 検証方法
- event_id で end-to-end trace できるか（ダッシュボード要件）

---

# I7: 冪等（Idempotency）
## 要求
- 同一event_idのapplyは高々一度
## 現状根拠（DB）
- personaos.growth_events: is_processed / processed_at
## ギャップ
- race時の挙動（insert競合）をテストで確認
## 検証方法
- duplicate 409 をE2Eテストに含める

---

# まとめ（P0差分）
- P0-1: system_control 全OS導入（未実装）
- P0-2: event_version outbox/external_eventへ導入（未実装）

これらは実装フェーズの最初に必ず対応する。
（ただし、実装は必ず佐藤（DB担当）レビュー参加で行う）



============================================================
SOURCE FILE: 17_OS_RESPONSIBILITY_DEFINITION.md
============================================================

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



============================================================
SOURCE FILE: 18_AI_EMPLOYEE_FORMAL_SPEC.md
============================================================

# 18 AI Employee Formal Specification（AI社員 正式仕様）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 定義

AI社員とは：
PersonaOS に属する Persona が、
BusinessOS / ERP OS に対して
提案・診断・分析を行う存在。

AI社員は「実行主体ではない」。

---

# 1. 役割階層（責任モデル）

R3 = 現実確定（ERP / Business）
R2 = 認知処理（Persona / Integration）
R1 = 表現/補助（Life/Game/Streaming）

AI社員は R2 に属する。
R3 に直接作用してはならない。

---

# 2. AI社員の行為タイプ

AI社員が出せるものは以下のみ：

1) SUGGESTION
2) DIAGNOSIS
3) CONSULT_RESULT
4) RISK_ALERT
5) PERFORMANCE_REPORT

すべて「非確定」。

---

# 3. ERPに関与する公式フロー

■ 正式経路

ERP/Business → Integration → PersonaOS → Business Approval → ERP Execution

詳細：

① ERP/Business が FACT_EVENT を生成（署名付き）
② Integration が検証・翻訳
③ PersonaOS が分析
④ AI社員が提案を生成（署名付き）
⑤ BusinessOS が approval_flow を通す
⑥ 承認後のみ ERP が Execution 実行

AI社員が直接 Execution を呼ぶことは禁止。

---

# 4. AI社員の署名仕様

AI社員の出力は必ず：

- persona_snapshot.signature
- persona_signing_key
- event_version
- source_os = "personaos"

を含む。

署名対象 canonical JSON：

{
  event_id,
  event_type,
  event_version,
  persona_id,
  user_id,
  payload,
  occurred_at
}

署名アルゴリズム：
Ed25519

---

# 5. 権限モデル

AI社員にはロールが付与される。

例：

- AI_CONSULTANT
- AI_ANALYST
- AI_AUDITOR
- AI_OPERATOR

しかしこれらは「提案権限」であり、
実行権限ではない。

---

# 6. AI社員が実行に関与できる唯一の例外

以下のみ許可：

■ AUTO_EXECUTION_MODE（限定運用）

条件：

1) BusinessOS の approval_flow_definition に
   auto_approve_ai = true が設定されている
2) risk_level = LOW
3) system_control.auto_exec_enabled = 1
4) 監査ログが有効

この場合のみ、
AI提案が即 Execution に昇格する。

ただし：

- すべて audit_trail に保存
- rollback可能な行為のみ許可

金銭確定系は禁止。

---

# 7. AI社員の監査義務

すべてのAI提案は：

- personaos.persona_action_log
- business.decision_log
- shared.dispatcher_run_log

に記録される。

最低保存期間：
7年（R3関与時）

---

# 8. 停止可能性

以下が 0 の場合、AI社員は停止：

personaos.system_control.os_enabled
personaos.system_control.apply_enabled
business.system_control.os_enabled

Integration が停止した場合も停止。

---

# 9. 責任分離

AI社員は「助言者」であり、
最終責任は：

- 承認者（人間）
- 組織（法人）
- Execution主体（ERP）

に帰属する。

---

# 10. 禁止事項

AI社員は以下をしてはならない：

- ERPテーブルへの直接書き込み
- approvalをバイパス
- 署名なし出力
- event_version 無し出力
- source_os 偽装
- 自己承認

---

# 11. 将来拡張余地

将来的に：

- AI社員の「信用スコア」
- 成功率ベース weight 調整
- AI社員ランキング
- Cross-world AI派遣

は追加可能。

ただし責任階層は破らない。

---

# 12. 凍結宣言

AI社員は R2存在であり、
R3を直接変更しない。

文明の安全原則として固定する。



============================================================
SOURCE FILE: 19_EVENT_UNIFIED_MODEL.md
============================================================

# 19 Event Unified Model（イベント統一モデル）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
全OSが同一形式（Envelope）でイベントを扱えるようにする。

- Outbox/External/Apply/Approval/Execution の語彙を統一
- 署名対象を固定（Canonical JSON）
- event_version による共存・段階移行を可能にする

---

# 1. Event Envelope v1.0（共通形式）

## 1.1 必須フィールド（全イベント共通）
- event_id: uuid
- event_type: text
- event_version: integer (>=1)
- source_os: text
- target_os: text?（単一配送の場合）
- occurred_at: timestamptz
- payload: jsonb

## 1.2 任意フィールド（追跡/監査）
- user_id: uuid?
- company_id: uuid?（Reality系のみ）
- correlation_id: text?（E2E追跡）
- idempotency_key: text?（発生源が持つ場合）
- origin_table: text?
- origin_pk: uuid?
- priority: integer?（0=default）
- tags: jsonb?（検索用）

## 1.3 配送フィールド（Outbox管理用）
- dispatch_status: {PENDING, INFLIGHT, DONE, RETRY, DEAD}
- dispatch_attempts: integer
- next_retry_at: timestamptz?
- dispatched_at: timestamptz?
- last_dispatch_error: text?

---

# 2. Canonical JSON（署名対象）

## 2.1 署名対象の固定（順序も固定）
署名対象は以下のみ（余計なメタは含めない）：

canonical_event = {
  "event_id": event_id,
  "event_type": event_type,
  "event_version": event_version,
  "source_os": source_os,
  "target_os": target_os (null可),
  "occurred_at": occurred_at (ISO8601),
  "payload": payload
}

## 2.2 署名アルゴリズム
- Ed25519（base64）
- signature_alg = "ed25519"
- signature_base64 を付与

## 2.3 署名検証
Integration が検証し、
external_event.signature_verified=true のみを採用する。

---

# 3. Event Class（意味分類）

Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

## 3.1 原則
- FACT_EVENT: Reality由来、署名必須
- POLICY_EVENT: Governance由来、署名必須
- SUGGESTION: Persona由来、署名必須（AI社員出力）
- APPROVAL: Business/ERPの承認結果、署名必須
- EXECUTION: Reality確定、署名必須

---

# 4. event_version 互換ポリシー

## 4.1 原則
- 互換破壊を伴う変更は version++ する
- 同一 event_type は version 共存できる
- 古い version を受けるかは target_os の policy に従う

## 4.2 互換性タイプ
- Backward Compatible: payload に optional を追加
- Forward Compatible: unknown fields を無視
- Breaking: field rename/remove/type-change → version++

---

# 5. Integration の役割（唯一窓口）

Integration は以下を行う：

1) VerifySignature（canonical）
2) Translate event_type（registryに従う）
3) Weight / Clamp（必要な場合）
4) Route target_os / world_schema
5) Emit to target outbox

Integration は domain state を持たない。

---

# 6. Outbox 標準（実装ガイド）

各OSの event_outbox は Envelope v1.0 を保持し、
配送フィールドを持つ。

既存の origin_table/idempotency_key は拡張として残す。

---

# 7. Apply 側の最低要件

Apply は最低限以下を満たす：

- system_control.apply_enabled を参照
- event_id 冪等（duplicate=409）
- event_version をログ・監査へ残す
- payload を canonical として扱う（改変禁止）

---

# 8. 禁止事項

- canonical 以外を署名対象にしない（環境依存で壊れるため）
- event_version 無しで境界を越えない
- source_os を偽装しない
- Integration をバイパスしない

---

# 9. 凍結宣言
本モデルをもって、
Civilization Platform のイベント形式は統一された。

以後、全OSのイベントは本 Envelope に従う。



============================================================
SOURCE FILE: 20_IMPLEMENTATION_PLAN_P0_P2.md
============================================================

# 20 Implementation Plan（P0-P2 実装計画）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 原則
- 設計正本（15 freeze + 16 matrix + 19 unified model）に従う
- 破壊的変更禁止（Additive Only → 検証後に削除は別フェーズ）
- DB変更は佐藤（DB担当）レビュー参加
- 停止可能性（system_control）を最優先で通す
- event_version を境界で必ず保持

---

# 1. フェーズ定義

## Phase P0（Safety Rails / 既に完了）
目的：停止可能性・version共存の土台をDBに入れる

完了項目：
- 全OSに system_control 作成 + 初期キー投入
- outbox に event_version 追加
- outbox に source_os 追加 + backfill
- integration.external_event に event_version 追加

成果：
- I4/I5 が DBレイヤで成立

---

## Phase P1（Runtime Wiring）
目的：Edge/dispatcher/apply を system_control + event_version 対応にする

### P1-1 Dispatcher（Civilization Event Dispatcher）
- civilization.system_control (os_enabled/dispatch_enabled) を参照
- world_schema.system_control (os_enabled/dispatch_enabled) を参照
- event_version を apply に渡す
- mark_retry が失敗しても INFLIGHT 放置しない（fallback update）

完了条件：
- dispatch_enabled=0 で claimしない
- world単位停止でスキップ
- duplicate(409) を成功扱いで DONE にできる

### P1-2 Apply（Persona State Apply）
- personaos.system_control (os_enabled/apply_enabled) を参照（fail-closed）
- event_version をログ/監査へ残す（context.__event_version）
- 冪等・retry運用の維持（is_processed=true -> 409）

完了条件：
- apply_enabled=0 で 503 + apply_run_log
- duplicate 409 で state 二重反映しない
- snapshot失敗でも apply 自体は 200（best-effort）

### P1-3 Integration Ingest（署名+version）
- signature_verified=true のみ採用
- canonical JSON に event_version を含める（署名対象）
- translate/weight を registry で管理

完了条件：
- signature_verified=false を REJECT
- version無しイベントは REJECT（または version=1強制補完は “設計で禁止”）

---

## Phase P2（Outbox収束 / 統一へ寄せる）
目的：各OS outbox のばらつきを “Envelope v1.0” に収束させる

### P2-1 追加カラムの整理（Additive）
- idempotency_key / origin_table / origin_pk は拡張として残す
- business.outbox の古い status/retry_count 等は残すが “非推奨” 扱い
- dispatcher は dispatch_* を唯一の真実として扱う

### P2-2 world_registry / claim_rpc の標準化
- claim_rpc が schema.func/func 両対応であることを継続
- table_name 参照は将来廃止（outbox固定）

### P2-3 監査ビュー（横断）
- shared.dispatcher_run_log + personaos.apply_run_log + business.decision_log を
  correlation_id/event_id で追えるように view を作る（READ ONLY）

完了条件：
- OS横断で event_id をキーに trace できる
- DEAD が DLQ に集約される（shared.dispatcher_dead_letter）

---

# 2. 実装順（最短）
1) P1-1 Dispatcher（control+version）
2) P1-2 Apply（control+version）
3) P1-3 Ingest（署名+version）
4) P2 Outbox収束 + 監査ビュー

---

# 3. ロール
- Boss: GO/STOP / 仕様確定
- 佐藤（DB）: DDL/関数レビュー
- Zero: 統合・進行管理（この計画の責任者）



============================================================
SOURCE FILE: 21_TEST_PLAN_E2E.md
============================================================

# 21 E2E Test Plan（止める・冪等・署名・再試行・version共存）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Civilization Platform の不変条件（I1〜I7）を E2E で保証する。

---

# 1. テストカテゴリ

## T1: Stop（停止可能性 / I5）
### T1-1 Persona Apply Stop
手順：
1) personaos.system_control.apply_enabled='0'
2) apply endpoint を呼ぶ
期待：
- HTTP 503
- personaos.apply_run_log に "apply halted by control"
3) 戻す（apply_enabled='1'）

### T1-2 Dispatcher Stop（Global）
手順：
1) civilization.system_control.dispatch_enabled='0'
2) dispatcher endpoint を呼ぶ
期待：
- claimed=0 or halted=true
- outbox状態が変化しない
3) 戻す（dispatch_enabled='1'）

### T1-3 Dispatcher Stop（World）
手順：
1) 対象 world_schema.system_control.dispatch_enabled='0'
2) dispatcher 実行
期待：
- そのworldだけ処理されない（skipped_by_control増加）
- 他worldは通常処理

---

## T2: Idempotency（冪等 / I7）
### T2-1 Apply Duplicate
手順：
1) 同一 event_id を2回 apply
期待：
- 1回目 200
- 2回目 409 duplicate
- persona_state/growth が二重増幅されない

---

## T3: Signature Gate（署名原則 / I3）
### T3-1 Reject Unverified
手順：
1) signature_verified=false の external_event を投入（または ingestで偽）
期待：
- routeされない
- outboxに出ない
- rejectログが残る

---

## T4: Retry/Dead（ライブネス / L1）
### T4-1 Retry Works
手順：
1) apply が 500 になるよう意図的に失敗を作る
2) dispatcher 実行
期待：
- INFLIGHT → PENDING/RETRY に戻る
- dispatch_attempts increment
- next_retry_at set

### T4-2 Dead Letter
手順：
1) MAX_RETRY を超えるまで失敗
期待：
- dispatch_status=DEAD
- shared.dispatcher_dead_letter に集約（運用実装がある場合）

---

## T5: Version Coexist（I4）
### T5-1 event_version passthrough
手順：
1) outbox row を event_version=2 で作る
2) dispatcher → apply
期待：
- apply が context.__event_version=2 をログに残す
- apply_run_log に event_version が追跡可能（metaログ）

### T5-2 Version Policy（将来）
手順：
- v1 only accept policy を追加した場合の挙動テスト
期待：
- v2は拒否 or fallback（設計ポリシーに従う）

---

# 2. 最低限の証明（合格条件）
- T1/T2/T3/T4/T5 が全て通る
- INFLIGHT stuck が発生しない
- duplicate で状態二重反映がない
- signature_verified=false が文明状態へ影響しない

---

# 3. 付録：復旧手順
- system_control を 1 に戻す
- DEAD を DLQ から再投入する場合は新event_idで行う（再利用禁止）



============================================================
SOURCE FILE: 22_SYSTEM_CONTROL_CANONICAL.md
============================================================

# 22 System Control Canonical（制御層 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
全OS/全プロジェクトで system_control の意味と運用を統一する。
「止められる」「保守モードにできる」「誤動作を fail-closed で止める」を保証する。

---

# 1. system_control テーブル仕様（共通）
## 1.1 Schema-local table
各OSスキーマに以下を持つ：

- <os_schema>.system_control(
  - control_key text primary key
  - control_value text not null
  - updated_at timestamptz not null default now()
)

## 1.2 初期キー（固定）
- os_enabled: '1'|'0'（OS全体の有効/停止）
- dispatch_enabled: '1'|'0'（outbox dispatch 系の有効/停止）
- apply_enabled: '1'|'0'（apply / engine / state mutate の有効/停止）
- ingest_enabled: '1'|'0'（外部/境界入力の受け入れ）
- maintenance_mode: '1'|'0'（保守：原則“書き込み禁止”）

> すべて文字列で持つ（DB/Edge/多言語での一貫性優先）。

---

# 2. セマンティクス（優先順位）
優先順位（強い順）：

1) maintenance_mode='1' → 原則書き込み禁止（例外は「停止解除」「監査ログ」等）
2) os_enabled='0' → 全停止（読み取り以外）
3) ingest_enabled='0' → 境界入力停止（external_event/ingest）
4) dispatch_enabled='0' → dispatch停止（claim/mark_done/retry）
5) apply_enabled='0' → apply停止（state mutate）

---

# 3. Fail-Closed 原則
- キーが存在しない / 読めない / 値が不正 → **停止扱い（0）**
- 例外：READ ONLY の参照は許可（ただし運用で“止める”時はAPI側も止める）

---

# 4. プロジェクト分離（確定）
## 4.1 Persona Project（PERSONA_DATABASE_URL）
- civilization / personaos / integration / life / game / streaming / business(軽量業務) …
→ 文明側OSはここに集約

## 4.2 ERP Project（DATABASE_URL）
- sales / purchase / accounting / inventory / approval / workflow / finance / hr …
→ ERPはドメイン分割スキーマ群

---

# 5. 運用ルール
- 値変更は監査対象（誰が/いつ/なぜ）
- “止める”はまず maintenance_mode → os_enabled の順で判断（原則）
- 解除は逆順
- 実装は必ず guard を通す（DB関数/Edgeの両方）

---

# 6. 禁止事項
- system_control を持たないOS追加（禁止）
- control_key の勝手追加（追加は設計フェーズで正本更新）
- 0/1 以外の値運用（禁止）


============================================================
SOURCE FILE: 23_CONTROL_GUARD_CONTRACTS.md
============================================================

# 23 Control Guard Contracts（制御ガード 契約）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
system_control を「実際に止める」ための共通ガード契約を定義する。
DB / Edge / App のどこから呼ばれても同じ挙動になることを保証する。

---

# 1. ガードの種類（共通）
## 1.1 DB Guard（推奨：最強）
- core.assert_os_enabled(p_schema text) → OS停止
- core.assert_dispatch_enabled(p_schema text) → dispatch停止
- core.assert_apply_enabled(p_schema text) → apply停止
- core.assert_ingest_enabled(p_schema text) → ingest停止
- core.assert_not_in_maintenance(p_schema text) → 保守停止（書き込み禁止）

> すべて fail-closed。

## 1.2 Edge Guard（必須）
Edge function は DB guard が未導入でも止められるように、
関数開始時に system_control を読み、停止判定する。

---

# 2. 適用箇所（必須ポイント）
## 2.1 ERP（DATABASE_URL）
- sales.request_order_approval_safe のような「実行系RPC」先頭
- approval/workflow の状態遷移RPC先頭
- inventory の台帳更新RPC先頭
- purchase の発注確定RPC先頭

## 2.2 Persona Project（PERSONA_DATABASE_URL）
- Dispatcher（civilization）: civilization + world_schema の両方を参照
- Apply（personaos）: personaos を参照（fail-closed）
- Ingest（integration）: integration を参照 + signature_verified gate

---

# 3. 返すエラー契約
## DB
- RAISE EXCEPTION 'OS <schema> is disabled' ERRCODE 'P0001'
- 保守は 'maintenance mode' を含める

## Edge/API
- 403: token不正
- 503: control により停止（halted）
- 409: duplicate（冪等）

---

# 4. 監査ログ契約
停止で弾いた場合もログを残す（best-effort）。
- Persona: personaos.apply_run_log など
- Dispatcher: shared.dispatcher_run_log（ある場合）

---

# 5. 実装拡張ルール（Additive Only）
- 既存RPCの挙動は “先頭ガード追加” 以外変えない
- DDL/関数変更は佐藤（DB担当）レビュー参加


============================================================
SOURCE FILE: 24_MAINTENANCE_MODE_POLICY.md
============================================================

# 24 Maintenance Mode Policy（保守モード 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
maintenance_mode='1' のときの「許可される操作/禁止される操作」を固定し、
障害対応や移行時に確実に安全側へ倒す。

---

# 1. 原則
- maintenance_mode='1' では原則 “書き込み禁止”
- 例外は最小限（停止解除・監査・DLQ退避など）

---

# 2. 禁止（例）
- ERP: 受注確定/出荷確定/会計仕訳確定/棚卸反映
- Persona: persona_state mutate / growth apply / snapshot発行（原則停止）
- Integration: 外部イベント採用（停止）

---

# 3. 例外（許可し得る）
- system_control の更新（解除作業）
- 監査ログの書き込み（障害解析）
- DLQ退避（状態悪化を防ぐための退避のみ、再実行は不可）
- READ ONLY 参照

---

# 4. 解除手順（推奨）
1) maintenance_mode='0'
2) os_enabled='1'
3) ingest/dispatch/apply を順に戻す（必要範囲のみ）

---

# 5. 禁止事項
- 保守中に auto-exec を有効化（禁止）
- “保守なのに書ける”抜け道を残す（禁止）


============================================================
SOURCE FILE: 25_GUARD_FUNCTIONS_DDL_SPEC.md
============================================================

# 25 Guard Functions DDL Spec（DBガード関数 仕様正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
system_control を「実際に止める」ためのDBガード関数を共通化し、
すべての実行系RPC/関数の先頭で同一の停止判定を行えるようにする。

- Fail-Closed（読めない/存在しない/値不正 → 停止扱い）
- エラーコードとメッセージを統一
- schema-local system_control を参照する

---

# 1. 配置
- 関数は ERPプロジェクトでは core スキーマに置く（core.*）
- Personaプロジェクト側は civilization または personaos でも良いが、
  “共通ガード”としては core 相当スキーマを用意するのが望ましい
  （ただし本仕様は関数契約を定めるだけで配置はプロジェクト裁量）

---

# 2. 共通インターフェース（固定）

## 2.1 基本ユーティリティ
### core.get_control_value(p_schema text, p_key text) returns text
- system_control が無い / key が無い → NULL
- 例外は投げない（上位で fail-closed）

### core.assert_control_enabled(p_schema text, p_key text, p_label text) returns void
- v = get_control_value(...)
- v が '1' 以外（NULL含む）→ 例外
- message: '<label> <schema> is disabled'
- ERRCODE: 'P0001'

---

## 2.2 個別ガード（API）
### core.assert_os_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'os_enabled','OS')

### core.assert_dispatch_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'dispatch_enabled','DISPATCH')

### core.assert_apply_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'apply_enabled','APPLY')

### core.assert_ingest_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'ingest_enabled','INGEST')

### core.assert_not_in_maintenance(p_schema text) returns void
- v = get_control_value(p_schema,'maintenance_mode')
- v = '1' → 例外
- message: 'MAINTENANCE <schema> is enabled'
- ERRCODE: 'P0001'

---

# 3. 判定優先順位（推奨）
実行系RPCの先頭での推奨順：

1) core.assert_not_in_maintenance('<schema>')
2) core.assert_os_enabled('<schema>')
3) （用途に応じて）
   - dispatch path: core.assert_dispatch_enabled('<schema>')
   - apply path: core.assert_apply_enabled('<schema>')
   - ingest path: core.assert_ingest_enabled('<schema>')

---

# 4. 適用ルール（必須）
- “現実確定”に関わる関数は必ず上記ガードを先頭に置く
- 変更は「先頭にPERFORM追加」のみ（ロジックは変えない）
- Fail-Closedを壊すような例外握りつぶしは禁止

---

# 5. 監査（推奨）
DB例外は呼び出し側で捕捉される。
呼び出し側（Edge/アプリ）は best-effort で以下を記録する：

- event_id / correlation_id
- schema
- guard_name
- error_message

---

# 6. テスト要件（必須）
T1（停止）で以下が成立すること：

- os_enabled='0' → 実行系関数が例外で停止
- maintenance_mode='1' → 書き込み系が停止
- key欠落/テーブル欠落 → 停止（fail-closed）

---

# 7. 禁止事項
- control_value を boolean に変更（文字列統一を破る）
- guardが存在するのに直接SELECTして判定する独自実装（統一崩壊）
- ERRCODE/メッセージのバラバラ運用

---

# 8. 凍結宣言
本仕様は system_control の実効性（本当に止める）を担保する中核であり、
全OSの停止設計を統一する正本として凍結する。



============================================================
SOURCE FILE: 26_CONTROL_MATRIX_BY_OS.md
============================================================

# 26 Control Matrix by OS（制御マトリクス 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
system_control の各キー（os/dispatch/apply/ingest/maintenance）を、
OS×経路（ingest/dispatch/apply/execution）で必須化する。

---

# 1. キー定義（再掲）
- maintenance_mode: '1' → 原則書き込み禁止（最優先）
- os_enabled: '0' → 全停止
- ingest_enabled: '0' → 境界入力停止
- dispatch_enabled: '0' → outbox dispatch停止
- apply_enabled: '0' → state mutate停止

---

# 2. Persona Project（PERSONA_DATABASE_URL）制御マトリクス

## 2.1 Civilization（Dispatcher）
- 参照: civilization.system_control
- 参照: <world_schema>.system_control（world単位停止）

必須ガード（推奨順）:
1) assert_not_in_maintenance('civilization')
2) assert_os_enabled('civilization')
3) assert_dispatch_enabled('civilization')
4) for each world:
   - assert_os_enabled(world_schema)
   - assert_dispatch_enabled(world_schema)

## 2.2 PersonaOS（Apply）
必須ガード:
1) assert_not_in_maintenance('personaos')
2) assert_os_enabled('personaos')
3) assert_apply_enabled('personaos')

## 2.3 Integration（Ingest/Translate）
必須ガード:
1) assert_not_in_maintenance('integration')
2) assert_os_enabled('integration')
3) assert_ingest_enabled('integration')
4) signature_verified=true gate（必須）

## 2.4 Life/Game/Streaming/Business(軽量)
経路別:
- ingest: ingest_enabled
- dispatch: dispatch_enabled
- apply/execution: apply_enabled（state mutateがある場合）
- maintenance/os: 常に先頭

---

# 3. ERP Project（DATABASE_URL）制御マトリクス
ERPはドメイン分割（sales/purchase/accounting/inventory/approval/workflow/finance/hr …）

## 3.1 ドメインExecution（確定/状態遷移）
必須ガード（推奨順）:
1) assert_not_in_maintenance('<domain>')
2) assert_os_enabled('<domain>')
3) その関数が「dispatch」なら assert_dispatch_enabled
4) 「ingest」なら assert_ingest_enabled
5) 「apply」なら assert_apply_enabled

---

# 4. 合格条件
- キー欠落/テーブル欠落でも fail-closed（停止）
- maintenance が最優先で効く
- PersonaとERPで「停止の意味」が一致する


============================================================
SOURCE FILE: 27_PROJECT_TOPOLOGY_AND_DB_BOUNDARY.md
============================================================

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


============================================================
SOURCE FILE: 28_EVENT_TYPE_TAXONOMY_AND_NAMESPACE.md
============================================================

# 28 Event Type Taxonomy and Namespace（イベント語彙 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
event_type の命名と分類を統一し、翻訳や監査の基盤を固定する。

---

# 1. 命名規約（推奨）
- <domain>.<entity>.<action>.<variant?>
例:
- sales.order.approval_requested.v1
- approval.request.created.v1
- persona.growth.applied.v2
- integration.external.ingested.v1

---

# 2. Kind分類（固定）
Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

- FACT_EVENT: Reality由来（ERP/Business）
- POLICY_EVENT: Governance由来
- SUGGESTION: Persona由来（AI社員）
- APPROVAL: 承認結果
- EXECUTION: 現実確定行為

---

# 3. versionルール（再掲）
- 破壊変更は version++
- 同一 event_type で version 共存可
- 境界イベントは event_version 必須

---

# 4. ソースOS表記（固定）
source_os は system_control の schema 名と一致させるのを推奨（追跡容易化）。
例:
- source_os='sales'
- source_os='personaos'
- source_os='civilization'


============================================================
SOURCE FILE: 29_INTEGRATION_TRANSLATION_AND_WEIGHT_POLICY.md
============================================================

# 29 Integration Translation and Weight Policy（翻訳/weight 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Integrationが行う「翻訳（event_type変換）」と「weight適用」を設計固定する。

---

# 1. 翻訳レジストリ（integration.event_registry）
- source: text（例: 'erp', 'persona', 'external'）
- erp_event_type: text
- persona_event_type: text
- weight: numeric
- is_active: boolean
- version: integer
- description: text

運用:
- is_active=true のみ採用
- versionは翻訳ルールの世代（イベントversionとは別軸）

---

# 2. weightの意味（固定）
weightは「影響度スカラー」。
- Persona側のgrowth/axis delta等に掛ける係数として使える
- ただし確定ロジックは PersonaOS の apply engine が担う（Integrationは計算しない）

---

# 3. 適用順（推奨）
1) signature_verified gate
2) schema/world route決定
3) event_type翻訳
4) weight添付（payload/metaへ）
5) target outboxへ投入

---

# 4. 禁止
- Integrationがドメイン状態を持つ
- Integrationが現実確定を実行する


============================================================
SOURCE FILE: 30_TRACE_CORRELATION_LOGGING_SPEC.md
============================================================

# 30 Trace / Correlation / Logging Spec（追跡ログ 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
event_id を軸に、OS/プロジェクトをまたいで追跡できるようにする。

---

# 1. 追跡キー（固定）
- event_id（必須）
- correlation_id（推奨、E2E追跡）
- source_os / target_os（推奨）
- occurred_at（必須）
- event_version（必須）

---

# 2. ログ出力（Edge）
重要ログは JSON（検索性のため）
最低フィールド:
- level, stage, event_id, event_type, source_os, target_os, correlation_id, elapsed_ms

トークン等の秘匿情報は出さない。

---

# 3. DBログ（推奨）
- personaos.apply_run_log（apply）
- shared.dispatcher_run_log（dispatcher）
- business.decision_log / approval log（承認）
- DLQ: shared.dispatcher_dead_letter（dead）

---

# 4. 合格条件
- event_id だけで「何が起きたか」を再構成できる
- duplicate(409) / retry / dead の経路が追える


============================================================
SOURCE FILE: 31_SIGNATURE_AND_TRUST_CHAIN_SPEC.md
============================================================

# 31 Signature and Trust Chain Spec（署名/信頼鎖 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
外部入力・AI社員出力・スナップショットを「改ざん不能」として扱うための信頼鎖を固定する。

---

# 1. 署名対象（再掲）
canonical_event = {
  event_id, event_type, event_version, source_os, target_os, occurred_at, payload
}

---

# 2. 署名アルゴリズム
- Ed25519
- signature_base64
- signature_alg='ed25519'

---

# 3. 信頼鎖（Integration）
- trusted_keys / revoked_keys を参照
- signature_verified=true のみ採用
- key_id / sig_ver / event_version を保存

---

# 4. AI社員（Persona）の署名
- PersonaOSの signing_key_registry / persona_signing_key を参照
- persona_snapshot と紐づける（責任追跡）

---

# 5. 禁止
- 署名なしの境界入力採用
- 署名対象canonicalの改変（フィールド追加含む）


============================================================
SOURCE FILE: 32_FAILURE_MODES_AND_RECOVERY_POLICY.md
============================================================

# 32 Failure Modes and Recovery Policy（障害/復旧 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
「止まる」「戻る」「死ぬ（DEAD）」「追える」を設計で保証する。

---

# 1. 代表障害と期待挙動

## 1) Apply失敗
- dispatcherは mark_retry を呼び PENDING/DEAD に戻す
- INFLIGHT放置禁止（fallback update）
- last_dispatch_error 記録

## 2) mark_done失敗
- INFLIGHT残留するので必ず retry に落とす（共通ロジック）

## 3) 署名検証失敗
- ingest_status=REJECT
- routeしない（無影響）

## 4) duplicate（冪等）
- 409 は成功扱い（DONEにできる）

## 5) control停止
- 503 halted
- best-effort でログ

---

# 2. DEADポリシー
- MAX_RETRY超過で DEAD
- DLQ（shared.dispatcher_dead_letter）へ集約（推奨）
- 再投入は新event_idで行う（再利用禁止）

---

# 3. 復旧手順（設計）
- maintenance_mode → os_enabled → ingest/dispatch/apply の順に戻す
- 監査ログを残す


============================================================
SOURCE FILE: 33_CHANGE_CONTROL_AND_RELEASE_POLICY.md
============================================================

# 33 Change Control and Release Policy（変更管理 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
設計→実装の乱れ（途中でバタバタ）を再発させないための凍結/変更管理を固定する。

---

# 1. 変更区分
- Design Change: 本正本群の更新（GO/STOP必須）
- Additive Implementation: 既存破壊なし（先頭ガード追加/カラム追加）
- Breaking Change: version++ を伴う（原則次フェーズ）

---

# 2. 承認フロー
- Boss: GO/STOP
- 佐藤（DB担当）: DDL/関数レビュー必須
- Zero: 統合・計画・差分整理

---

# 3. リリース手順（推奨）
1) maintenance_mode=1（対象OS）
2) DDL/関数適用（Additive）
3) E2Eテスト（T1〜T5）
4) maintenance_mode=0
5) 段階的に ingest/dispatch/apply を戻す

---

# 4. ロールバック原則
- 可能なら “スイッチで戻す”（system_control）
- DDLロールバックは原則しない（前進のみ）


============================================================
SOURCE FILE: 34_IMPLEMENTATION_CHECKLIST.md
============================================================

# 34 Implementation Checklist（実装前チェックリスト 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
設計を完了させた上で、実装でバタつかないための「実装前ゲート」を固定する。

---

# 1. 前提確認（必須）
- [ ] プロジェクト境界が正しい
  - [ ] DATABASE_URL = ERP Project only
  - [ ] PERSONA_DATABASE_URL = Persona Project only
- [ ] OS責務（17）/ AI社員（18）/ Event統一（19）が凍結されている
- [ ] system_control（22）/ guard契約（23）/ maintenance（24）/ guard仕様（25）が凍結されている
- [ ] 実装計画（20）/ テスト計画（21）が凍結されている

---

# 2. DB変更ゲート（必須）
- [ ] Additive Only（既存破壊なし）
- [ ] DDL/関数変更は 佐藤（DB担当）レビュー参加
- [ ] guard関数の ERRCODE/メッセージ契約（23/25）を守る
- [ ] maintenance_mode が最優先で効く設計を崩さない

---

# 3. ランタイム変更ゲート（必須）
- [ ] Dispatcher は civilization + world_schema の二重制御に従う（26）
- [ ] Apply は personaos の制御に従う（26）
- [ ] Ingest は integration の制御 + signature gate（31）に従う
- [ ] 重要ログは JSON（30）

---

# 4. テストゲート（必須）
- [ ] T1 Stop（停止）合格
- [ ] T2 Idempotency（duplicate=409）合格
- [ ] T3 Signature（未検証拒否）合格
- [ ] T4 Retry/Dead（INFLIGHT放置なし）合格
- [ ] T5 Version（passthrough/共存）合格

---

# 5. リリースゲート（推奨）
- [ ] maintenance_mode=1 → 適用 → テスト → maintenance_mode=0
- [ ] 段階的に ingest/dispatch/apply を戻す
- [ ] event_id/correlation_id で trace が可能

---

# 6. 完了条件
- 実装後も「止められる」「追える」「戻る」「壊れにくい」が維持される


============================================================
SOURCE FILE: 35_GUARD_ROLLOUT_PLAN.md
============================================================

# 35 Guard Rollout Plan（ガード展開計画 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
「どの関数/どの経路」に「どのガード」を入れるかを一覧化し、
実装を機械的に進められるようにする（設計の確定）。

---

# 1. Persona Project（PERSONA_DATABASE_URL）

## 1.1 Civilization Dispatcher（Edge）
対象:
- Civilization Event Dispatcher（Edge）

必須ガード:
- civilization: maintenance → os → dispatch
- world_schema: os → dispatch

補足:
- 409 duplicate は success として mark_done を許可
- mark_done 失敗時は必ず retry に戻す

---

## 1.2 Persona Apply（Edge）
対象:
- Persona State Apply（Edge）

必須ガード:
- personaos: maintenance → os → apply

冪等:
- growth_events(event_id) processed=true → 409
- processed=false → retry可

---

## 1.3 Integration Ingest（DB/Edge）
対象:
- external_event ingest（DB関数 or Edge）

必須ガード:
- integration: maintenance → os → ingest
- signature_verified gate（trusted_keys/revoked_keys）

---

# 2. ERP Project（DATABASE_URL）
ERPはドメイン分割のため、ドメインごとに展開する。

## 2.1 Sales
対象（確定）:
- sales.request_order_approval_safe（実績あり）

必須ガード:
- maintenance → os（まずここから）
必要に応じて:
- dispatch/apply/ingest（経路に応じて）

---

## 2.2 Purchase（候補）
対象:
- 発注確定/承認要求/入荷確定 に相当するRPC
必須ガード:
- maintenance → os

---

## 2.3 Approval / Workflow（候補）
対象:
- status遷移/承認確定/差戻し に相当するRPC
必須ガード:
- maintenance → os

---

## 2.4 Inventory（候補）
対象:
- 在庫引当/出庫確定/棚卸反映 に相当するRPC
必須ガード:
- maintenance → os

---

## 2.5 Accounting / Finance（候補）
対象:
- 仕訳確定/締処理/支払確定 に相当するRPC
必須ガード:
- maintenance → os
禁止:
- auto-exec での金銭確定

---

# 3. 展開順（推奨）
1) maintenance + os ガード（全ドメインの実行系）
2) dispatchガード（outbox経路）
3) ingestガード（外部入力）
4) applyガード（state mutate）
5) 最後に event_version/trace を拡張

---

# 4. 成功条件
- どのドメインも os_enabled=0 で確実に止まる（DBでfail-closed）
- maintenance_mode=1 で書き込みが止まる
- 監査/追跡（event_id）が崩れない


============================================================
SOURCE FILE: 36_INDEX.md
============================================================

# 36 Civilization Platform Canonical Index（設計正本 INDEX）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

============================================================
CIVILIZATION PLATFORM – DESIGN FREEZE INDEX
============================================================

本インデックスは、文明プラットフォーム全体設計の
「凍結済み正本一覧」を示す。

以降の実装は、この正本群に厳密に従う。

------------------------------------------------------------
A. 基本原則
------------------------------------------------------------

17_OS_RESPONSIBILITY_CANONICAL.md
18_AI_EMPLOYEE_MODEL_CANONICAL.md
19_EVENT_UNIFICATION_CANONICAL.md

------------------------------------------------------------
B. 実装計画とテスト計画
------------------------------------------------------------

20_IMPLEMENTATION_PLAN_CANONICAL.md
21_TEST_PLAN_CANONICAL.md

------------------------------------------------------------
C. 制御層（Stopできる設計）
------------------------------------------------------------

22_SYSTEM_CONTROL_CANONICAL.md
23_CONTROL_GUARD_CONTRACTS.md
24_MAINTENANCE_MODE_POLICY.md
25_GUARD_FUNCTIONS_DDL_SPEC.md
26_CONTROL_MATRIX_BY_OS.md

------------------------------------------------------------
D. 境界・翻訳・イベント設計
------------------------------------------------------------

27_PROJECT_TOPOLOGY_AND_DB_BOUNDARY.md
28_EVENT_TYPE_TAXONOMY_AND_NAMESPACE.md
29_INTEGRATION_TRANSLATION_AND_WEIGHT_POLICY.md

------------------------------------------------------------
E. 追跡・署名・安全性
------------------------------------------------------------

30_TRACE_CORRELATION_LOGGING_SPEC.md
31_SIGNATURE_AND_TRUST_CHAIN_SPEC.md

------------------------------------------------------------
F. 障害・運用・変更管理
------------------------------------------------------------

32_FAILURE_MODES_AND_RECOVERY_POLICY.md
33_CHANGE_CONTROL_AND_RELEASE_POLICY.md

------------------------------------------------------------
G. 実装準備
------------------------------------------------------------

34_IMPLEMENTATION_CHECKLIST.md
35_GUARD_ROLLOUT_PLAN.md

------------------------------------------------------------
設計フェーズ完了条件
------------------------------------------------------------

✔ OS責務が固定されている
✔ ERP/Persona境界が固定されている
✔ event/versionモデルが固定されている
✔ system_controlが設計レベルで共通化されている
✔ guard契約が固定されている
✔ 失敗時の戻り方が定義されている
✔ 変更管理が定義されている

------------------------------------------------------------
設計フェーズ宣言
------------------------------------------------------------

このINDEX生成時点で、
文明プラットフォームの「設計」は完了状態とする。

以降は：

    設計 → 実装（Additive Only）
    設計破壊は禁止
    凍結ファイル更新はGO/STOP必須

============================================================
END OF CANONICAL DESIGN INDEX
============================================================


============================================================
END OF COMPLETE MASTER CANONICAL
============================================================
