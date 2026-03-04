
==================================================
/data/data/com.termux/files/home/persona-system/design/dist/architecture/000_FULL_00_96_CANONICAL.md
==================================================

# Civilization Platform Canonical (00-96 FULL MERGE)

Generated at: 2026-03-01 05:55:30

---



================================================================
FILE: 00_INDEX.md
================================================================

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


================================================================
FILE: 000_MASTER_CANONICAL_COMPLETE.md
================================================================

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


================================================================
FILE: 01_OS_CLASSIFICATION.md
================================================================

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


================================================================
FILE: 02_OS_CONNECTION_MATRIX.md
================================================================

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


================================================================
FILE: 03_CONTROL_LAYER_STANDARD.md
================================================================

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



================================================================
FILE: 04_FOUNDATION_BOUNDARY_RULES.md
================================================================

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



================================================================
FILE: 05_AUDIT_STANDARD.md
================================================================

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



================================================================
FILE: 06_EVENT_TAXONOMY_MINIMUM.md
================================================================

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



================================================================
FILE: 07_CHANGE_RULES.md
================================================================

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



================================================================
FILE: 08_GAP_REVIEW_CANONICAL.md
================================================================

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



================================================================
FILE: 09_CONTROL_EVENT_STANDARD.md
================================================================

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


================================================================
FILE: 10_OS_RESPONSIBILITY_MODEL.md
================================================================

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



================================================================
FILE: 11_META_CONSTITUTION.md
================================================================

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



================================================================
FILE: 12_AI_EMPLOYEE_ETHICAL_CHARTER.md
================================================================

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



================================================================
FILE: 13_CIVILIZATION_VALUE_THEORY.md
================================================================

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



================================================================
FILE: 14_CIVILIZATION_FORMAL_MODEL.md
================================================================

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


================================================================
FILE: 15_DESIGN_FREEZE_DECLARATION.md
================================================================

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



================================================================
FILE: 16_INVARIANT_COMPLIANCE_MATRIX.md
================================================================

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



================================================================
FILE: 17_OS_RESPONSIBILITY_DEFINITION.md
================================================================

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



================================================================
FILE: 18_AI_EMPLOYEE_FORMAL_SPEC.md
================================================================

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



================================================================
FILE: 19_EVENT_UNIFIED_MODEL.md
================================================================

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



================================================================
FILE: 20_IMPLEMENTATION_PLAN_P0_P2.md
================================================================

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



================================================================
FILE: 21_TEST_PLAN_E2E.md
================================================================

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



================================================================
FILE: 22_SYSTEM_CONTROL_CANONICAL.md
================================================================

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


================================================================
FILE: 23_CONTROL_GUARD_CONTRACTS.md
================================================================

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


================================================================
FILE: 24_MAINTENANCE_MODE_POLICY.md
================================================================

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


================================================================
FILE: 25_GUARD_FUNCTIONS_DDL_SPEC.md
================================================================

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



================================================================
FILE: 26_CONTROL_MATRIX_BY_OS.md
================================================================

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


================================================================
FILE: 27_PROJECT_TOPOLOGY_AND_DB_BOUNDARY.md
================================================================

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


================================================================
FILE: 28_EVENT_TYPE_TAXONOMY_AND_NAMESPACE.md
================================================================

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


================================================================
FILE: 29_INTEGRATION_TRANSLATION_AND_WEIGHT_POLICY.md
================================================================

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


================================================================
FILE: 30_TRACE_CORRELATION_LOGGING_SPEC.md
================================================================

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


================================================================
FILE: 31_SIGNATURE_AND_TRUST_CHAIN_SPEC.md
================================================================

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


================================================================
FILE: 32_FAILURE_MODES_AND_RECOVERY_POLICY.md
================================================================

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


================================================================
FILE: 33_CHANGE_CONTROL_AND_RELEASE_POLICY.md
================================================================

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


================================================================
FILE: 34_IMPLEMENTATION_CHECKLIST.md
================================================================

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


================================================================
FILE: 35_GUARD_ROLLOUT_PLAN.md
================================================================

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


================================================================
FILE: 36_INDEX.md
================================================================

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


================================================================
FILE: 37_TEST_SUITE_SPEC.md
================================================================

# 37 Test Suite Spec（T1–T5 自動テスト仕様 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
文明プラットフォーム（Persona Project + ERP Project）に対して、
T1〜T5 の合格基準を“自動化可能な仕様”として固定する。

- 停止できる（Stop）
- 冪等（Idempotency）
- 署名（Signature）
- リトライ/DEAD（Retry/Dead）
- version境界（Version）

---

# 1. 実行環境
- Termux
- DB接続:
  - PERSONA_DATABASE_URL（Persona Project）
  - DATABASE_URL（ERP Project only）

---

# 2. 共通ルール
- すべて fail-closed を期待
- テストは必ず「戻し込み（rollback）」仕様を含む
- 本仕様は「テストの設計」であり、実装スクリプトは別フェーズで生成する

---

# 3. T1 Stop Test（停止）
## 3.1 Persona Project 停止（必須）
対象:
- personaos.system_control (apply_enabled, os_enabled, maintenance_mode)
- civilization.system_control (dispatch_enabled, os_enabled, maintenance_mode)

手順（仕様）:
1) personaos.apply_enabled=0
2) apply API / apply相当処理が 503（halted）または DB例外になる
3) rollback: personaos.apply_enabled=1

4) civilization.dispatch_enabled=0
5) dispatcher が claimed=0 / halted を返す（または処理しない）
6) rollback: civilization.dispatch_enabled=1

合格:
- 停止時に mutate が進まない
- rollbackで復旧する

---

## 3.2 ERP Project 停止（必須）
対象:
- sales.system_control.os_enabled（最低1ドメインでOK）

手順（仕様）:
1) sales.os_enabled=0
2) sales.request_order_approval_safe を呼ぶと例外で止まる
3) rollback: sales.os_enabled=1

合格:
- DBレベルで停止（fail-closed）
- Java/Edge経由でも止まること

---

# 4. T2 Idempotency Test（冪等）
対象:
- personaos.growth_events(event_id, is_processed, processed_at)

手順（仕様）:
1) event_id=E を apply で処理 → is_processed=true
2) 同じ event_id=E を再送 → 409 duplicate（成功扱い）
3) event_id=F を「未処理状態 is_processed=false」で存在させる（または失敗させる）
4) event_id=F を再送 → retryとして処理継続可

合格:
- processed=true は 409
- processed=false は再実行可

---

# 5. T3 Signature Test（署名/信頼鎖）
対象:
- integration.external_event(signature_verified, key_id 等)
- trusted_keys / revoked_keys

手順（仕様）:
1) signature_verified=false の外部イベントを投入
2) ingest/translate は拒否し、routeしない（outboxに流さない）
3) signature_verified=true で投入した場合は採用される（正常系）

合格:
- 未検証は必ず拒否（無害化）
- 検証済みは正常に流れる

---

# 6. T4 Retry / Dead Test（復旧）
対象:
- <world>.event_outbox(dispatch_status, dispatch_attempts, next_retry_at, last_dispatch_error)
- shared.dispatcher_dead_letter（推奨）

手順（仕様）:
1) dispatcher で apply を意図的に失敗させる（HTTP 500 等）
2) mark_retry により PENDING に戻る（INFLIGHT放置禁止）
3) attempt増加と backoff が反映される
4) MAX_RETRY超過で DEAD に落ちる
5) DEAD は DLQ に集約される（推奨）

合格:
- INFLIGHTが残らない
- retry→dead の遷移が追える
- last_dispatch_error が記録される

---

# 7. T5 Version Boundary Test（version）
対象:
- event_version（external_event / event_outbox）
- event_type taxonomy（version共存）

手順（仕様）:
1) event_version を持つイベントが境界を越えても保持される
2) v1/v2 が共存して処理できる（少なくとも拒否せず記録できる）

合格:
- event_version passthrough
- version共存に対して安全側の挙動（拒否 or route）を定義どおり行う

---

# 8. 成功判定（共通）
- 期待ステータス（409/503）や例外が一致する
- DBの状態遷移が設計どおり
- 追跡（event_id/correlation_id）で再構成できる

---

# 9. 次フェーズで生成するもの（実装ではないが仕様として宣言）
- 38_TEST_RUNNER_TERMUX.sh（Termuxワンブロック化）
- 39_TEST_DATA_SEEDS.sql（テスト用種）
- 40_TEST_REPORT_TEMPLATE.md（結果記録テンプレ）



================================================================
FILE: 38_TEST_RUNNER_TERMUX.sh
================================================================

#!/data/data/com.termux/files/usr/bin/sh
set -eu

ts() { date -u +'%Y-%m-%dT%H:%M:%SZ'; }
pass() { echo "[PASS] $(ts) $*"; }
fail() { echo "[FAIL] $(ts) $*" >&2; exit 1; }

require_env() {
  v="${1:-}"
  eval "val=\${$v:-}"
  [ -n "$val" ] || fail "missing env: $v"
}

require_env PERSONA_DATABASE_URL
require_env DATABASE_URL

psql_persona() { psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 "$@"; }
psql_erp()     { psql "$DATABASE_URL" -v ON_ERROR_STOP=1 "$@"; }

# ============================================================
# T1 Stop Tests
# ============================================================

echo "=== T1.2 Civilization Dispatcher Stop ==="
psql_persona <<'SQL'
BEGIN;
UPDATE civilization.system_control
SET control_value='0', updated_at=now()
WHERE control_key='dispatch_enabled';
UPDATE civilization.system_control
SET control_value='1', updated_at=now()
WHERE control_key='dispatch_enabled';
COMMIT;
SQL
pass "T1.2 civilization stop ok"

echo "=== T1.3 ERP Sales Stop Guard ==="
psql_erp <<'SQL'
BEGIN;
UPDATE sales.system_control
SET control_value='0', updated_at=now()
WHERE control_key='os_enabled';

DO $$
BEGIN
  PERFORM sales.request_order_approval_safe(
    '00000000-0000-0000-0000-000000000000'::uuid,
    1::bigint,
    'TEST-ORDER'::text,
    'POLICY-1'::text,
    'STOP TEST'::text
  );
  RAISE EXCEPTION 'EXPECTED_FAILURE_NOT_RAISED';
EXCEPTION
  WHEN OTHERS THEN NULL;
END $$;

UPDATE sales.system_control
SET control_value='1', updated_at=now()
WHERE control_key='os_enabled';
COMMIT;
SQL
pass "T1.3 ERP guard ok"

# ============================================================
# T2 Idempotency (FIXED: persona_id NOT NULL対応)
# ============================================================

echo "=== T2 Persona Idempotency ==="
psql_persona <<'SQL'
BEGIN;

WITH p AS (
  SELECT persona_id, user_id
  FROM personaos.personas
  LIMIT 1
)
INSERT INTO personaos.growth_events (
  event_id, user_id, persona_id, app_namespace,
  event_type, magnitude, context,
  occurred_at, received_at,
  is_processed, processed_at
)
SELECT
  '11111111-1111-1111-1111-111111111111'::uuid,
  p.user_id,
  p.persona_id,
  'test',
  'test.event',
  1,
  '{}'::jsonb,
  now(),
  now(),
  true,
  now()
FROM p
ON CONFLICT (event_id) DO UPDATE SET
  is_processed=EXCLUDED.is_processed,
  processed_at=EXCLUDED.processed_at;

WITH p AS (
  SELECT persona_id, user_id
  FROM personaos.personas
  LIMIT 1
)
INSERT INTO personaos.growth_events (
  event_id, user_id, persona_id, app_namespace,
  event_type, magnitude, context,
  occurred_at, received_at,
  is_processed, processed_at
)
SELECT
  '22222222-2222-2222-2222-222222222222'::uuid,
  p.user_id,
  p.persona_id,
  'test',
  'test.event',
  1,
  '{}'::jsonb,
  now(),
  now(),
  false,
  NULL
FROM p
ON CONFLICT (event_id) DO UPDATE SET
  is_processed=EXCLUDED.is_processed,
  processed_at=EXCLUDED.processed_at;

DELETE FROM personaos.growth_events
WHERE event_id IN (
  '11111111-1111-1111-1111-111111111111'::uuid,
  '22222222-2222-2222-2222-222222222222'::uuid
);

COMMIT;
SQL
pass "T2 idempotency ok"

# ============================================================
# T3 Signature Column Presence
# ============================================================

echo "=== T3 Signature Columns ==="
psql_persona <<'SQL'
BEGIN;
SELECT signature, signature_verified, key_id, sig_ver, event_version
FROM integration.external_event
LIMIT 0;
COMMIT;
SQL
pass "T3 signature fields ok"

# ============================================================
# T4 Outbox Columns Presence
# ============================================================

echo "=== T4 Outbox Columns ==="
psql_persona <<'SQL'
BEGIN;
SELECT table_schema, table_name
FROM information_schema.columns
WHERE table_name='event_outbox'
AND column_name IN ('dispatch_status','dispatch_attempts','next_retry_at','last_dispatch_error','event_version','source_os')
GROUP BY table_schema, table_name;
COMMIT;
SQL
pass "T4 outbox columns ok"

# ============================================================
# T5 event_version Presence
# ============================================================

echo "=== T5 event_version Presence ==="
psql_persona <<'SQL'
BEGIN;
SELECT table_schema, table_name
FROM information_schema.columns
WHERE column_name='event_version'
AND table_name IN ('external_event','event_outbox');
COMMIT;
SQL
pass "T5 version columns ok"

echo "=== ALL TESTS PASSED ==="


================================================================
FILE: 39_TEST_DATA_SEEDS.sql
================================================================

-- ============================================================
-- 39 Test Data Seeds (Optional)
-- status: CANONICAL_TEST_SEEDS
-- owner: Boss / prepared_by: Zero
-- ============================================================
--
-- This file contains OPTIONAL seeds used by Edge/API tests.
-- Execute only in a dedicated test window, and cleanup afterwards.
--
-- NOTE:
-- - Persona Project only (PERSONA_DATABASE_URL)
-- - ERP seeds are intentionally excluded here to avoid polluting real ledgers.
-- ============================================================

-- Example seeds (placeholders)
-- 1) growth_events sample IDs for idempotency tests
-- event_id: 1111... processed=true (duplicate path)
-- event_id: 2222... processed=false (retry path)

-- 2) integration.external_event sample shape
-- Insert is intentionally not provided here, because signature fields should be valid.
-- Use Edge ingestion path to set signature_verified properly.

-- 3) world_registry sanity seeds (should already exist in production)
-- Use existing world_registry and do not override.

-- Cleanup guidance:
-- DELETE FROM personaos.growth_events WHERE event_id IN (...);


================================================================
FILE: 40_TEST_REPORT_TEMPLATE.md
================================================================

# 40 Test Report Template（結果記録テンプレ）
status: CANONICAL_TEST_REPORT_TEMPLATE
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 実行情報
- 実行日時（JST）:
- 実行者:
- 対象:
  - Persona Project: PERSONA_DATABASE_URL（ref記入）
  - ERP Project: DATABASE_URL（ref記入）
- 変更有無:
  - [ ] なし
  - [ ] あり（内容: ）

---

# 実行結果サマリ
- T1 Stop: PASS / FAIL
- T2 Idempotency: PASS / FAIL
- T3 Signature: PASS / FAIL
- T4 Retry/Dead: PASS / FAIL
- T5 Version: PASS / FAIL

---

# 詳細ログ
## T1 Stop
- Persona Apply stop:
- Civilization Dispatch stop:
- ERP Sales guard:

## T2 Idempotency
- processed=true → duplicate扱い（409期待）
- processed=false → retry可

## T3 Signature
- 未検証拒否（採用されない）
- 検証済み採用

## T4 Retry/Dead
- INFLIGHT放置なし
- backoff/attempts 更新
- MAX_RETRY → DEAD

## T5 Version
- event_version passthrough
- v1/v2 共存方針どおり

---

# 差分/課題
- 課題:
- 再現手順:
- 影響範囲:
- 対応方針（設計変更/実装変更/運用）:

---

# 判定
- [ ] 合格（次フェーズへ）
- [ ] 不合格（修正後に再実行）


================================================================
FILE: 41_AI_ACTOR_CANONICAL.md
================================================================

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


================================================================
FILE: 42_AI_ACTOR_IDENTITY_AND_KEYS.md
================================================================

# 42 AI Actor Identity and Keys（同一性/鍵 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. Identity（同一性）
AI Actor は必ず以下で一意に識別される。

- actor_id（文明共通ID）: UUID
- persona_id（PersonaOSの人格ID）: UUID
- user_id（オーナー/依頼主）: UUID
- actor_type: { consultant, operator, auditor, supervisor }（設計上は4種。運用は最小から）
- actor_status: { ACTIVE, SUSPENDED, REVOKED }

---

# 1. Key管理（必須）
- Ed25519 鍵ペア
- key_id（テキスト）
- sig_ver（整数：鍵の世代）
- revocation（失効）: 即時反映

要求:
- actorは必ず「署名鍵」を持つ
- 署名検証できない行動要求はERPに到達してはならない

---

# 2. 署名対象（canonical_action）
canonical_action = {
  action_id,          -- uuid（行動単位）
  event_id,           -- uuid（イベント追跡）
  correlation_id,     -- uuid/text（E2E）
  actor_id, persona_id, user_id,
  target_project,     -- 'ERP'
  target_schema,      -- 'sales' etc
  target_rpc,         -- 'sales.request_order_approval_safe' etc
  rpc_args_hash,      -- jsonの正規化→hash
  occurred_at,
  event_version,
  source_os,          -- 'personaos' or 'civilization'
  policy_id           -- admission policy binding
}

signature_base64 = Ed25519(sign( canonical_action_json ))

---

# 3. 失効（Revocation）
- key_id単位で失効できる
- actor_id単位で失効できる
- admission policy単位で失効できる

Fail-Closed:
- 失効リスト参照不可 → 拒否


================================================================
FILE: 43_AI_ACTOR_ERP_ADMISSION_POLICY.md
================================================================

# 43 AI Actor ERP Admission Policy（ERP入場資格 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI ActorがERPで「何者として」「どこまで」振る舞えるかを固定する。
AdmissionはERP側で発行され、Integrationが強制する。

---

# 1. Admission Policy（概念）
policy_id: text
binds:
- actor_id / persona_id / user_id
- company_id（ERPテナント）
- allowed_schemas（例: sales, approval）
- allowed_rpcs（完全ホワイトリスト）
- max_risk_level（0..5）
- require_human_approval: boolean（原則 true）
- expires_at（必須：期限）

---

# 2. Admissionの強制点（必須）
- Integrationで policy_id を検証し、許可外は route しない
- ERP側RPCは policy_id を引数に取り、DBでも検証（推奨）
- policyの欠落/期限切れ/不一致 → 拒否

---

# 3. デフォルト（軍用）
- deny by default
- allowは最小
- expires_atは短い（運用で延長、無期限禁止）


================================================================
FILE: 44_AI_ACTOR_ALLOWED_ACTIONS_AND_RPC_WHITELIST.md
================================================================

# 44 Allowed Actions and RPC Whitelist（許可行為/RPC 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 方針（超厳格）
AI Actorが実行できるのは「ERPの安全RPC（*_safe）」のみ。
さらに引数/影響範囲を制限する。

---

# 1. Whitelistの単位
- schema + rpc_name + signature_required + approval_gate

例:
- sales.request_order_approval_safe : allowed (requires human approval downstream)
- sales.request_order_approval      : denied（unsafe）

---

# 2. 引数制約（推奨）
- company_id 必須
- actor_id/policy_id 必須（監査のため）
- idempotency_key 必須（再送安全）
- event_id/event_version/source_os 必須（追跡）

---

# 3. 影響レベル（risk_level）
0: READ ONLY
1: 提案/診断（記録のみ）
2: 承認要求（pending化）
3: 予約/下書き作成
4: 確定（原則禁止）
5: 金銭確定（禁止）

軍用デフォルト:
- AI Actorは最大でも 2（承認要求）まで
- 4/5 は人間のみ


================================================================
FILE: 45_AI_ACTOR_AUDIT_EVIDENCE_AND_NONREPUDIATION.md
================================================================

# 45 Audit Evidence and Non-repudiation（監査/否認防止 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI Actorの行為を「誰が/何を/なぜ/どの権限で」行ったか
後から確実に再構成でき、否認できない状態にする。

---

# 1. 最低限の証跡（必須）
- action_id（行動単位）
- event_id/correlation_id
- actor_id/persona_id/user_id
- policy_id
- target_schema/target_rpc
- rpc_args_hash（引数のハッシュ）
- signature_base64（行為署名）
- decision_reason（AI側理由：短文）
- created_at/occurred_at

---

# 2. 証跡保存場所（推奨）
- Persona側：personaos.persona_action_log（提案/決定）
- Integration側：integration.external_event（境界イベント）
- ERP側：audit/decision_log/approval_request（現実側記録）

---

# 3. 禁止
- 署名なしでERPへ到達
- 証跡なしの実行
- 後追いで内容を書き換える（append-only推奨）


================================================================
FILE: 46_AI_ACTOR_RUNTIME_GUARDS_AND_KILLSWITCH.md
================================================================

# 46 Runtime Guards and Kill-switch（実行ガード/停止 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI Actorの暴走・侵害時に即停止できることを保証する。

---

# 1. 停止レベル（強い順）
1) maintenance_mode（OS全停止）
2) os_enabled（OS停止）
3) admission policy revoke（policy_id停止）
4) actor_id suspend/revoke（persona停止）
5) rpc whitelist remove（特定行為停止）
6) route stop（integration ingest/dispatch停止）

Fail-Closed:
- 判定不能 → 停止

---

# 2. 強制ポイント（必須）
- Integration：署名・policy・whitelist を満たさない要求をERPへ流さない
- ERP：*_safe の先頭で guard + policy検証（推奨）
- 監査ログ：停止で弾いた場合も best-effort 記録

---

# 3. 緊急停止手順（設計）
- まず maintenance_mode=1（対象OS）
- actor/policy revoke
- 原因究明後に段階復旧（36/33の手順）


================================================================
FILE: 47_AI_ACTOR_WORKFLOW_APPROVAL_GATES.md
================================================================

# 47 Workflow and Approval Gates（承認ゲート 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 原則
AI Actorは「確定」ではなく「承認要求」まで。
現実確定は人間承認（Human-in-the-loop）。

---

# 1. 承認フロー（例：sales）
AI Actor:
- request_order_approval_safe を呼ぶ
ERP:
- order_header を pending_approval にする
- approval_request を作る
人間:
- approval UI で承認/否認
ERP:
- 承認後にのみ確定処理へ進む

---

# 2. 例外（限定自動）
- 事前に policy_id が「risk_level<=1」かつ「条件一致」のみ
- 条件はERP側で最終判定（AI側の自己申告禁止）

---

# 3. 禁止
- AI Actorが承認権限を持つ（supervisor型は“提案”に限定）
- AI Actorが金銭確定を行う


================================================================
FILE: 48_AI_ACTOR_THREAT_MODEL_AND_CONTROLS.md
================================================================

# 48 Threat Model and Controls（脅威モデル/対策 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 脅威カテゴリ
T1: 認証/署名偽造（なりすまし）
T2: 権限昇格（whitelist回避）
T3: 連携バイパス（Integrationを回避）
T4: リプレイ（同一要求の悪用）
T5: ログ改ざん（否認）
T6: 暴走（大量要求/DoS）
T7: データ漏えい（ERP機密）

---

# 1. 対策（必須）
C1: 署名必須 + trusted_keys/revoked_keys（Fail-Closed）
C2: policy_id必須 + expires_at必須（無期限禁止）
C3: whitelist必須（deny default）
C4: idempotency_key + event_id（リプレイ耐性）
C5: append-only監査 + rpc_args_hash（否認防止）
C6: rate limit（Integration/Dispatcher）+ kill-switch（即停止）
C7: READ ONLY first（AIは参照中心、実行は承認要求まで）

---

# 2. 検証（テストに追加する項目）
- 署名不正 → 受理されない
- policy期限切れ → 受理されない
- whitelist外 → 受理されない
- 同一idempotency_key → 1回のみ
- stop系control → すべて停止


================================================================
FILE: 49_CIVILIZATION_ACTOR_UNIVERSAL_MODEL.md
================================================================

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


================================================================
FILE: 50_OS_ADMISSION_POLICY_FRAMEWORK.md
================================================================

# 50 OS Admission Policy Framework（OS別入場ポリシー枠組み 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorが各OSに入場するための「共通ポリシー枠」を固定する。

---

# 1. 共通スキーマ（概念）
policy_id: text
os_key: text（例: erpos / business / streaming / game / life / governance）
binds:
- actor_id, persona_id, owner_user_id
scope:
- tenant/company/world（OSに応じた単位）
- allowed_namespaces（任意）
- allowed_actions（whitelist参照）
risk:
- max_risk_level（0..5）
gates:
- require_signature: boolean（原則 true）
- require_human_approval: boolean（OSにより）
expiry:
- issued_at
- expires_at（必須・無期限禁止）
status:
- ACTIVE / SUSPENDED / REVOKED

---

# 2. 強制ポイント（必須）
- Integration/Router は policy を検証し、許可外は route しない
- OS側の実行系RPC/関数も policy を検証（推奨：二重防御）
- 参照不能/不整合 → fail-closed（拒否）

---

# 3. policyの粒度（推奨）
- ERP: company_id + schema + rpc 単位（最小）
- Business: app_namespace + action単位
- Streaming: channel_id + action単位（配信操作）
- Game: world_id + character_slot + action単位
- Life: user_id + action単位（個人領域）
- Governance: proposal_domain + action単位



================================================================
FILE: 51_OS_RISK_MODEL_MATRIX.md
================================================================

# 51 OS Risk Model Matrix（OS別リスク行列 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
OSごとに「許せる行為」の最大リスクを固定し、設計ブレを止める。

---

# 1. risk_level（共通）
0: READ ONLY（参照のみ）
1: RECORD ONLY（提案/診断の記録。状態を変えない）
2: REQUEST（承認要求/pending化。確定しない）
3: DRAFT/RESERVE（下書き/予約。取消可能）
4: COMMIT REALITY（現実確定：原則AI禁止）
5: MONEY/LEGAL（資金/法務確定：禁止）

---

# 2. OS別最大リスク（デフォルト）
- ERP (erpos): max 2（REQUESTまで）※4/5禁止
- BusinessOS: max 3（DRAFTまで）
- StreamingOS: max 3（配信操作/予約まで）
- GameOS: max 3（世界内状態更新は可、ただし現実には影響しない）
- LifeOS: max 2（提案/申請まで）
- GovernanceOS: max 1（提案/評価のみ）
- SystemOS: max 1（記録・点検のみ。実行は人間）

---

# 3. Human Gate（原則）
- risk>=2 の行為はOSにより人間承認が必要
- ERPは常に人間承認（例外は設計で明示しない限り禁止）



================================================================
FILE: 52_OS_ACTION_WHITELIST_PATTERN.md
================================================================

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


================================================================
FILE: 53_ACTOR_LIFECYCLE_AND_REVOCATION.md
================================================================

# 53 Actor Lifecycle and Revocation（Actorライフサイクル/失効 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorの生成〜停止〜失効を文明共通で統一する。

---

# 1. 状態遷移（必須）
- PROVISIONED（発行前準備）
- ACTIVE（稼働）
- SUSPENDED（一時停止）
- REVOKED（永久失効）

policy も同様に ACTIVE/SUSPENDED/REVOKED。

---

# 2. 失効の粒度（強い順）
1) maintenance_mode（OS全停止）
2) os_enabled（OS停止）
3) admission policy revoke（policy単位停止）
4) actor_status=SUSPENDED/REVOKED（主体停止）
5) key revoke（署名不能化）
6) whitelist disable（行為停止）

Fail-Closed:
- 判定不能 → 停止

---

# 3. 期限（必須）
- policy は必ず expires_at を持つ（無期限禁止）
- 延長は「更新」ではなく「再発行」を推奨（証跡）



================================================================
FILE: 54_CROSS_OS_TRACE_AND_EVIDENCE_MODEL.md
================================================================

# 54 Cross-OS Trace and Evidence Model（横断追跡/証跡 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorが OS を跨いでも、event_id を軸に「何が起きたか」を再構成できる状態を固定する。

---

# 1. 共通追跡キー（必須）
- action_id（行為単位UUID）
- event_id（イベントUUID）
- correlation_id（E2E）
- actor_id / persona_id / owner_user_id
- os_key（source/target）
- event_version
- occurred_at
- signature_base64（行為署名）
- rpc_args_hash / payload_hash（否認防止）

---

# 2. 証跡配置（推奨）
- PersonaOS: persona_action_log（意思決定/理由）
- Integration: external_event（境界）
- 各OS: domain log（業務/配信/ゲーム/ライフ/ガバナンス）

---

# 3. 重要原則
- 証跡は append-only を推奨
- 改ざん可能領域がある場合は「ハッシュ連鎖」を検討（将来拡張）


================================================================
FILE: 55_STREAMING_GAME_LIFE_SPECIAL_RULES.md
================================================================

# 55 Streaming/Game/Life Special Rules（非現実OS特則 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Streaming/Game/Life は ERP と違い「現実確定」ではない。
よってリスク/承認/許可の設計を最適化する。

---

# 1. StreamingOS（配信）
- 人間承認は「配信開始/終了など高影響」だけでよい（運用裁量）
- 金銭連動（投げ銭等）に繋がる操作は risk を上げる（>=2）扱い
- channel_id を scope として必須化

---

# 2. GameOS（ゲーム）
- 現実確定なし（ただし課金/外部連携がある場合は例外でリスク上げ）
- world_id / character_slot を scope として必須化
- NPC生成は draft/reserve を推奨（rollback容易）

---

# 3. LifeOS（生活）
- 個人領域を強く隔離（user_id scope 必須）
- “実行”は提案/申請まで（max 2）
- 健康/金銭に触れる場合は常に human gate 推奨



================================================================
FILE: 56_ERP_IS_A_SPECIAL_CASE_POLICY.md
================================================================

# 56 ERP Is a Special Case Policy（ERP特別扱い 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
ERPは「現実の経営情報」「現実確定」であり、文明OS群の中で最も厳格に扱う。

---

# 1. ERPの絶対ルール
- AI Actor は max_risk_level=2（REQUEST）まで
- *_safe RPC のみ許可（unsafe禁止）
- company_id 必須（テナント隔離）
- 署名必須（Ed25519）
- policy_id 必須・期限必須（無期限禁止）
- Human-in-the-loop 原則必須（承認 UI 経由で確定）

---

# 2. 越境経路
ERP ↔ Persona は Integration を唯一経路とする。
- Integration が policy + whitelist + signature を満たさない要求を通さない
- ERP側でも guard + policy検証（二重防御）

---

# 3. 監査
- ERP側ログ（audit/decision/approval）に actor_id/policy_id/event_id を必ず残す
- 否認防止のため rpc_args_hash を保存する（推奨）



================================================================
FILE: 59_CIVILIZATION_ACTOR_COMPLETE_CANONICAL.md
================================================================

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


================================================================
FILE: 60_INTEGRATION_GATE_OVERVIEW.md
================================================================

# 60 Integration Gate Overview（文明の門番 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Integration を「文明の関所」として固定する。
全OS（ERP/Business/Streaming/Game/Life/Governance/System）への越境要求は
必ず Integration Gate を通過しなければならない。

---

## 1. Gate が強制するもの（Fail-Closed）
- system_control: integration.os_enabled=1 & maintenance_mode=0
- policy: 有効・期限内・actor_id一致・os_key一致・risk上限OK
- whitelist: action_key / target_schema / target_rpc が許可されている
- signature: “検証済み”フラグ + trusted_keys + revoked_keys で信頼鎖が成立
  - Ed25519の暗号学的verify自体は Edge/外部で実施し、DBは fail-closed で状態確認する
- idempotency: action_id（UUID）で重複拒否

---

## 2. Gate の出力
Gate を通過した要求のみが “target OS の event_outbox” に投入される。
投入は「Integration からの発行」であることを示す:
- source_os='integration'
- event_version を維持
- correlation_id/event_id を維持

---

## 3. 禁止
- Integration を経由しない越境（直叩き）
- policy/whitelist/signature のいずれか欠落で通すこと
- allowlist を持たないRPC実行


================================================================
FILE: 61_INTEGRATION_POLICY_MODEL.md
================================================================

# 61 Integration Policy Model（OS別入場ポリシー 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Civilization Actor（59）の Admission Policy を、Integration が検証できる形で固定。

---

## 1. integration.actor_policy（DBモデル）
- policy_id (text) PK
- os_key (text) 例: 'erpos','business','streaming','game','life','governance','system'
- actor_id (uuid)
- persona_id (uuid)
- owner_user_id (uuid)
- tenant_key (text, nullable) … OSに応じたスコープキー（company_id/world_id/channel_idなどのキー名）
- tenant_value (text, nullable) … その値（uuidをtext化でもOK）
- max_risk_level (int)
- require_signature (bool)
- require_human_approval (bool)
- status (text: ACTIVE/SUSPENDED/REVOKED)
- issued_at, expires_at (timestamptz) ※無期限禁止
- created_at, updated_at

Fail-Closed:
- policyが無い/期限切れ/不一致 → reject


================================================================
FILE: 62_INTEGRATION_WHITELIST_MODEL.md
================================================================

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


================================================================
FILE: 63_INTEGRATION_SIGNATURE_TRUST_MODEL.md
================================================================

# 63 Integration Signature & Trust Model（署名/信頼鎖 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 方針
暗号学的な Ed25519 verify は Edge/外部で行う（実装自由）。
DBは “検証済みの状態” と “鍵の信頼鎖” を fail-closed で確認する。

---

## 1. 参照テーブル（既存想定）
- integration.trusted_keys
- integration.revoked_keys
- integration.external_event(signature_verified, key_id, sig_ver, signature, event_version)

---

## 2. Gateでの必須条件
- signature_verified=true
- key_id が trusted_keys に存在
- key_id が revoked_keys に存在しない（または期限/状態で無効）
- sig_ver が policy/actor と矛盾しない（将来拡張）

Fail-Closed:
- 参照不能/不整合 → reject


================================================================
FILE: 64_INTEGRATION_ROUTING_CONTRACT.md
================================================================

# 64 Integration Routing Contract（ルーティング契約 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 入力（actor action envelope）
Integrationが受理する“越境要求”の最小形:

- action_id (uuid) … idempotencyの主キー
- event_id (uuid) … E2E追跡
- correlation_id (text/uuid)
- actor_id (uuid)
- persona_id (uuid)
- owner_user_id (uuid)
- policy_id (text)
- os_key (text) … target OS
- action_key (text)
- target_schema (text) … DB型OSの場合のみ
- target_rpc (text) … DB型OSの場合のみ
- risk_level (int)
- occurred_at (timestamptz)
- event_version (int)
- payload (jsonb)
- signature_base64 (text)
- signature_verified (bool) … verify済みフラグ（Edge側で付与）

---

## 1. 出力（target OS event_outbox）
- schema: <target_schema>.event_outbox
- event_id: 継続
- event_type: action_key を基本（必要なら registry で変換）
- payload: 受理したpayload
- source_os='integration'
- event_version: 継続
- dispatch_status='PENDING' 等（OS側ルール）

---

## 2. Gateは “投入のみ”
Gate は業務ロジックを持たない。
業務処理は target OS 側で実行する。


================================================================
FILE: 65_INTEGRATION_GATE_DDL.sql
================================================================

-- ============================================================
-- 65 Integration Gate DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed design.

-- -----------------------------
-- 0) tables
-- -----------------------------

CREATE TABLE IF NOT EXISTS integration.actor_policy (
  policy_id text PRIMARY KEY,
  os_key text NOT NULL,
  actor_id uuid NOT NULL,
  persona_id uuid NOT NULL,
  owner_user_id uuid NOT NULL,

  tenant_key text NULL,
  tenant_value text NULL,

  max_risk_level integer NOT NULL DEFAULT 1,
  require_signature boolean NOT NULL DEFAULT true,
  require_human_approval boolean NOT NULL DEFAULT true,

  status text NOT NULL DEFAULT 'ACTIVE', -- ACTIVE/SUSPENDED/REVOKED
  issued_at timestamptz NOT NULL DEFAULT now(),
  expires_at timestamptz NOT NULL,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_policy_actor
  ON integration.actor_policy(actor_id, os_key);

CREATE TABLE IF NOT EXISTS integration.actor_whitelist (
  os_key text NOT NULL,
  action_key text NOT NULL,
  target_schema text NULL,
  target_rpc text NULL,

  risk_level integer NOT NULL DEFAULT 0,
  require_signature boolean NOT NULL DEFAULT true,
  require_human_approval boolean NOT NULL DEFAULT true,

  arg_schema_hash text NULL,
  rate_limit_per_min integer NOT NULL DEFAULT 60,

  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  PRIMARY KEY (os_key, action_key)
);

CREATE INDEX IF NOT EXISTS idx_actor_whitelist_target
  ON integration.actor_whitelist(os_key, target_schema, target_rpc);

CREATE TABLE IF NOT EXISTS integration.actor_action_dedup (
  action_id uuid PRIMARY KEY,
  event_id uuid NOT NULL,
  correlation_id text NULL,
  actor_id uuid NOT NULL,
  policy_id text NOT NULL,
  os_key text NOT NULL,
  action_key text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_action_dedup_event
  ON integration.actor_action_dedup(event_id);

-- -----------------------------
-- 1) helpers
-- -----------------------------

CREATE OR REPLACE FUNCTION integration.now_utc()
RETURNS timestamptz
LANGUAGE sql
AS $$
  SELECT now() AT TIME ZONE 'utc';
$$;

-- system_control (already exists per verify) gate
CREATE OR REPLACE FUNCTION integration.assert_integration_enabled()
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_os text;
  v_maint text;
BEGIN
  SELECT control_value INTO v_os
  FROM integration.system_control
  WHERE control_key='os_enabled';

  SELECT control_value INTO v_maint
  FROM integration.system_control
  WHERE control_key='maintenance_mode';

  IF COALESCE(v_os,'0') <> '1' THEN
    RAISE EXCEPTION 'Integration OS disabled';
  END IF;

  IF COALESCE(v_maint,'0') = '1' THEN
    RAISE EXCEPTION 'Integration maintenance_mode';
  END IF;
END;
$$;

-- policy check (Fail-Closed)
CREATE OR REPLACE FUNCTION integration.check_actor_policy(
  p_policy_id text,
  p_os_key text,
  p_actor_id uuid,
  p_persona_id uuid,
  p_owner_user_id uuid,
  p_risk_level integer,
  p_tenant_key text,
  p_tenant_value text
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.actor_policy%ROWTYPE;
BEGIN
  SELECT * INTO r
  FROM integration.actor_policy
  WHERE policy_id = p_policy_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Policy not found';
  END IF;

  IF r.status <> 'ACTIVE' THEN
    RAISE EXCEPTION 'Policy not active';
  END IF;

  IF r.os_key <> p_os_key THEN
    RAISE EXCEPTION 'Policy os_key mismatch';
  END IF;

  IF r.actor_id <> p_actor_id OR r.persona_id <> p_persona_id OR r.owner_user_id <> p_owner_user_id THEN
    RAISE EXCEPTION 'Policy bind mismatch';
  END IF;

  IF r.expires_at <= now() THEN
    RAISE EXCEPTION 'Policy expired';
  END IF;

  IF p_risk_level > r.max_risk_level THEN
    RAISE EXCEPTION 'Risk level exceeds policy';
  END IF;

  -- tenant scope (optional but fail-closed if policy specifies scope)
  IF r.tenant_key IS NOT NULL THEN
    IF p_tenant_key IS NULL OR p_tenant_value IS NULL THEN
      RAISE EXCEPTION 'Tenant scope required';
    END IF;
    IF r.tenant_key <> p_tenant_key OR r.tenant_value <> p_tenant_value THEN
      RAISE EXCEPTION 'Tenant scope mismatch';
    END IF;
  END IF;
END;
$$;

-- whitelist check
CREATE OR REPLACE FUNCTION integration.check_actor_whitelist(
  p_os_key text,
  p_action_key text,
  p_target_schema text,
  p_target_rpc text,
  p_risk_level integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  w integration.actor_whitelist%ROWTYPE;
BEGIN
  SELECT * INTO w
  FROM integration.actor_whitelist
  WHERE os_key = p_os_key
    AND action_key = p_action_key;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Whitelist entry not found';
  END IF;

  IF w.is_active IS NOT TRUE THEN
    RAISE EXCEPTION 'Whitelist disabled';
  END IF;

  IF p_risk_level <> w.risk_level THEN
    RAISE EXCEPTION 'Risk level mismatch with whitelist';
  END IF;

  -- If DB-type OS, enforce target matching when whitelist defines them
  IF w.target_schema IS NOT NULL AND COALESCE(p_target_schema,'') <> w.target_schema THEN
    RAISE EXCEPTION 'target_schema mismatch';
  END IF;
  IF w.target_rpc IS NOT NULL AND COALESCE(p_target_rpc,'') <> w.target_rpc THEN
    RAISE EXCEPTION 'target_rpc mismatch';
  END IF;
END;
$$;

-- signature trust check (crypto verify is external; DB checks trust chain)
CREATE OR REPLACE FUNCTION integration.check_signature_trust(
  p_key_id text,
  p_signature_verified boolean
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_trusted integer;
  v_revoked integer;
BEGIN
  IF p_signature_verified IS NOT TRUE THEN
    RAISE EXCEPTION 'Signature not verified';
  END IF;

  SELECT count(*) INTO v_trusted
  FROM integration.trusted_keys
  WHERE key_id = p_key_id;

  IF COALESCE(v_trusted,0) = 0 THEN
    RAISE EXCEPTION 'Key not trusted';
  END IF;

  SELECT count(*) INTO v_revoked
  FROM integration.revoked_keys
  WHERE key_id = p_key_id;

  IF COALESCE(v_revoked,0) > 0 THEN
    RAISE EXCEPTION 'Key revoked';
  END IF;
END;
$$;

-- idempotency (action_id)
CREATE OR REPLACE FUNCTION integration.assert_action_not_duplicate(
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_policy_id text,
  p_os_key text,
  p_action_key text
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO integration.actor_action_dedup(
    action_id, event_id, correlation_id, actor_id, policy_id, os_key, action_key
  ) VALUES (
    p_action_id, p_event_id, p_correlation_id, p_actor_id, p_policy_id, p_os_key, p_action_key
  );
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Duplicate action_id';
END;
$$;

-- ------------------------------------------------------------
-- 2) Gate entrypoint (routing is "contract only" here)
--    This function ONLY validates and records dedup.
--    Actual routing to target OS outbox is implemented later
--    after schema mapping is finalized per OS.
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.gate_validate_actor_action(
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_persona_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,
  p_os_key text,
  p_action_key text,
  p_target_schema text,
  p_target_rpc text,
  p_risk_level integer,
  p_tenant_key text,
  p_tenant_value text,
  p_key_id text,
  p_signature_verified boolean
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_integration_enabled();

  PERFORM integration.check_signature_trust(p_key_id, p_signature_verified);

  PERFORM integration.check_actor_policy(
    p_policy_id, p_os_key, p_actor_id, p_persona_id, p_owner_user_id,
    p_risk_level, p_tenant_key, p_tenant_value
  );

  PERFORM integration.check_actor_whitelist(
    p_os_key, p_action_key, p_target_schema, p_target_rpc, p_risk_level
  );

  PERFORM integration.assert_action_not_duplicate(
    p_action_id, p_event_id, p_correlation_id, p_actor_id, p_policy_id, p_os_key, p_action_key
  );
END;
$$;


================================================================
FILE: 66_APPLY_INTEGRATION_GATE.sh
================================================================

#!/data/data/com.termux/files/usr/bin/sh
set -eu
# ============================================================
# Apply Integration Gate DDL
# IMPORTANT: Run ONLY after Sato(DB) review.
# Requires: PERSONA_DATABASE_URL
# ============================================================

: "${PERSONA_DATABASE_URL:?missing PERSONA_DATABASE_URL}"

SQL_FILE="$HOME/architecture/civilization_platform_canonical/65_INTEGRATION_GATE_DDL.sql"

psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 <<SQL
\i '$SQL_FILE'
SQL

echo "OK: applied integration gate DDL"


================================================================
FILE: 67_INTEGRATION_ROUTING_OVERVIEW.md
================================================================

# 67 Integration Routing Overview（Gate後ルーティング 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
integration.gate_validate_actor_action() が通した “越境要求” を
安全に「配送キュー」に積み、後段で各OSへ投入できるようにする。

---

## 1. 重要な現実（確定）
- 各schemaの event_outbox は列構造が完全一致していない
  - business は独自列が多い
- ERPは別Project（DATABASE_URL）であり、Persona側DBから直接INSERTできない
  - よって越境は “外部配送” として扱う必要がある

---

## 2. ルーティング方針（共通化優先）
Gate通過後は、まず必ず integration.actor_route_queue に積む（共通キュー）。
これにより：

- 同一DB内OS（streaming/game/life/governance 等）も統一経路
- 別Project ERP も同一経路（外部配送として送れる）
- outbox列差分の事故を排除できる

---

## 3. 出力
Gate通過要求 → integration.actor_route_queue（PENDING）
後段（別設計/別実装）で：
- internal OS: queue → <schema>.event_outbox に変換投入
- external OS(ERP): queue → Edge/pg_net 等で ERP にPOST/INSERT

---

## 4. 禁止
- Gateを通さずに outbox へ直接投入
- outbox列差を無視した直INSERT（事故源）


================================================================
FILE: 68_INTEGRATION_ROUTE_REGISTRY.md
================================================================

# 68 Integration Route Registry（配送先/方式の登録 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
os_key ごとに「internal/external」等の配送方式を固定し、運用で止められるようにする。

---

## 1. integration.route_registry（DBモデル）
- os_key (text) PK
- route_kind (text) … INTERNAL_DB / EXTERNAL_HTTP
- target_schema (text, nullable) … INTERNAL_DB の場合
- target_hint (text, nullable) … EXTERNAL の場合の識別子（URL名/connector名など）
- is_enabled (bool)
- created_at, updated_at

Fail-Closed:
- registry未登録 / is_enabled=false → routing拒否

---

## 2. 初期推奨（設計）
- erpos → EXTERNAL_HTTP（別Projectへ配送）
- streaming/game/life/governance/business → INTERNAL_DB（同一DB内）


================================================================
FILE: 69_INTEGRATION_ROUTE_FUNCTIONS.md
================================================================

# 69 Integration Route Functions（Routing関数群 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Gate通過 → route queue へ積むための関数を固定する。

---

## 1. エントリポイント
integration.route_actor_action(...):
- まず gate_validate_actor_action(...) を呼ぶ
- route_registry を確認（Fail-Closed）
- integration.actor_route_queue に1件 INSERT（PENDING）

---

## 2. actor_route_queue の要件（最小・汎用）
- route_id (uuid) PK
- action_id (uuid) UNIQUE（idempotency）
- event_id (uuid)
- correlation_id (text)
- actor_id/persona_id/owner_user_id
- policy_id
- os_key（target）
- action_key
- target_schema/target_rpc
- risk_level
- tenant_key/tenant_value
- event_version / occurred_at / source_os
- payload (jsonb)
- key_id / signature_verified / signature_base64（証跡）
- route_kind（INTERNAL_DB/EXTERNAL_HTTP）
- status (PENDING/INFLIGHT/DONE/DEAD)
- attempts / next_retry_at / last_error
- created_at / updated_at

---

## 3. 禁止
- queueを経由せずにOSへ配送
- registryを無視した配送


================================================================
FILE: 70_INTEGRATION_ROUTING_TEST_PLAN.md
================================================================

# 70 Integration Routing Test Plan（Routingテスト計画 正本）
status: DESIGN_READY
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## T-R1: registry未登録は拒否（Fail-Closed）
- route_registry に無い os_key を指定
- 期待: 例外（routing拒否）

## T-R2: registry is_enabled=false は拒否
- route_registry.is_enabled=false
- 期待: 例外（routing拒否）

## T-R3: gate通過後に queue へ積まれる
- policy/whitelist/署名検証済み/重複なし
- 期待: actor_route_queue に PENDING で1件

## T-R4: action_id 重複は拒否
- 同じ action_id を再送
- 期待: unique_violation → “Duplicate action_id” 相当

## T-R5: integration.os_enabled=0 で拒否
- integration.system_control.os_enabled=0
- 期待: Gateで拒否

※配送実体（queue→OS outbox/ERP送信）は後段テスト（別設計）。


================================================================
FILE: 71_INTEGRATION_ROUTING_DDL.sql
================================================================

-- ============================================================
-- 71 Integration Routing DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed.

-- -----------------------------
-- 0) route registry
-- -----------------------------
CREATE TABLE IF NOT EXISTS integration.route_registry (
  os_key text PRIMARY KEY,
  route_kind text NOT NULL,             -- INTERNAL_DB / EXTERNAL_HTTP
  target_schema text NULL,              -- for INTERNAL_DB
  target_hint text NULL,                -- for EXTERNAL
  is_enabled boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- -----------------------------
-- 1) universal route queue
-- -----------------------------
CREATE TABLE IF NOT EXISTS integration.actor_route_queue (
  route_id uuid PRIMARY KEY,
  action_id uuid NOT NULL UNIQUE,
  event_id uuid NOT NULL,
  correlation_id text NULL,

  actor_id uuid NOT NULL,
  persona_id uuid NOT NULL,
  owner_user_id uuid NOT NULL,
  policy_id text NOT NULL,

  os_key text NOT NULL,
  action_key text NOT NULL,
  target_schema text NULL,
  target_rpc text NULL,
  risk_level integer NOT NULL DEFAULT 0,

  tenant_key text NULL,
  tenant_value text NULL,

  event_version integer NOT NULL DEFAULT 1,
  occurred_at timestamptz NOT NULL,
  source_os text NOT NULL DEFAULT 'integration',

  payload jsonb NOT NULL DEFAULT '{}'::jsonb,

  key_id text NULL,
  signature_base64 text NULL,
  signature_verified boolean NOT NULL DEFAULT false,

  route_kind text NOT NULL,             -- from registry
  status text NOT NULL DEFAULT 'PENDING',  -- PENDING/INFLIGHT/DONE/DEAD
  attempts integer NOT NULL DEFAULT 0,
  next_retry_at timestamptz NULL,
  last_error text NULL,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_status
  ON integration.actor_route_queue(status, next_retry_at);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_os
  ON integration.actor_route_queue(os_key, route_kind);

CREATE INDEX IF NOT EXISTS idx_actor_route_queue_event
  ON integration.actor_route_queue(event_id);

-- -----------------------------
-- 2) registry check
-- -----------------------------
CREATE OR REPLACE FUNCTION integration.get_route_registry(p_os_key text)
RETURNS integration.route_registry
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.route_registry%ROWTYPE;
BEGIN
  SELECT * INTO r FROM integration.route_registry WHERE os_key=p_os_key;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Route registry not found for os_key=%', p_os_key;
  END IF;
  IF r.is_enabled IS NOT TRUE THEN
    RAISE EXCEPTION 'Route registry disabled for os_key=%', p_os_key;
  END IF;
  RETURN r;
END;
$$;

-- -----------------------------
-- 3) routing entrypoint
--    - validates (gate)
--    - registry check
--    - enqueue
-- -----------------------------
CREATE OR REPLACE FUNCTION integration.route_actor_action(
  p_route_id uuid,
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,

  p_actor_id uuid,
  p_persona_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,

  p_os_key text,
  p_action_key text,
  p_target_schema text,
  p_target_rpc text,
  p_risk_level integer,

  p_tenant_key text,
  p_tenant_value text,

  p_key_id text,
  p_signature_base64 text,
  p_signature_verified boolean,

  p_event_version integer,
  p_occurred_at timestamptz,
  p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  rr integration.route_registry%ROWTYPE;
BEGIN
  -- 1) Gate validation (Fail-Closed)
  PERFORM integration.gate_validate_actor_action(
    p_action_id,
    p_event_id,
    p_correlation_id,
    p_actor_id,
    p_persona_id,
    p_owner_user_id,
    p_policy_id,
    p_os_key,
    p_action_key,
    p_target_schema,
    p_target_rpc,
    p_risk_level,
    p_tenant_key,
    p_tenant_value,
    p_key_id,
    p_signature_verified
  );

  -- 2) Registry (Fail-Closed)
  rr := integration.get_route_registry(p_os_key);

  -- 3) Enqueue (Universal)
  INSERT INTO integration.actor_route_queue(
    route_id, action_id, event_id, correlation_id,
    actor_id, persona_id, owner_user_id, policy_id,
    os_key, action_key, target_schema, target_rpc, risk_level,
    tenant_key, tenant_value,
    event_version, occurred_at, source_os,
    payload,
    key_id, signature_base64, signature_verified,
    route_kind,
    status, attempts, next_retry_at, last_error
  ) VALUES (
    p_route_id, p_action_id, p_event_id, p_correlation_id,
    p_actor_id, p_persona_id, p_owner_user_id, p_policy_id,
    p_os_key, p_action_key, p_target_schema, p_target_rpc, p_risk_level,
    p_tenant_key, p_tenant_value,
    COALESCE(p_event_version,1), COALESCE(p_occurred_at, now()),
    'integration',
    COALESCE(p_payload, '{}'::jsonb),
    p_key_id, p_signature_base64, p_signature_verified,
    rr.route_kind,
    'PENDING', 0, NULL, NULL
  );

EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Duplicate action_id';
END;
$$;


================================================================
FILE: 72_APPLY_INTEGRATION_ROUTING.sh
================================================================

#!/data/data/com.termux/files/usr/bin/sh
set -eu
# ============================================================
# Apply Integration Routing DDL
# IMPORTANT: Run ONLY after Sato(DB) review.
# Requires: PERSONA_DATABASE_URL
# ============================================================

: "${PERSONA_DATABASE_URL:?missing PERSONA_DATABASE_URL}"

SQL_FILE="$HOME/architecture/civilization_platform_canonical/71_INTEGRATION_ROUTING_DDL.sql"

psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 <<SQL
\i '$SQL_FILE'
SQL

echo "OK: applied integration routing DDL"


================================================================
FILE: 73_DELIVERY_LAYER_OVERVIEW.md
================================================================

# 73 Delivery Layer Overview（文明配送層 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的

integration.actor_route_queue に積まれた要求を、
各OSへ安全に配送する。

Gateは「検証」だけ。
Deliveryは「移送」だけ。

---

## 1. 分類

route_kind:

- INTERNAL_DB
- EXTERNAL_HTTP

---

## 2. 絶対原則

- Deliveryは業務ロジックを持たない
- idempotency維持
- retry制御はDB側で管理
- Fail-Closed

---

## 3. 状態遷移

PENDING
  ↓
INFLIGHT
  ↓
DONE

失敗:
INFLIGHT → DEAD（閾値超過）


================================================================
FILE: 74_INTERNAL_DB_DELIVERY_SPEC.md
================================================================

# 74 INTERNAL_DB Delivery Specification
status: FROZEN_CANONICAL

---

## 対象

同一DB内OS:
- streaming
- game
- life
- governance
- business
- system

---

## 処理

1. PENDING行をSELECT FOR UPDATE SKIP LOCKED
2. target_schema.event_outbox に INSERT
3. 成功 → DONE
4. 失敗 → attempts+1, next_retry_at設定

---

## 重要

event_outbox列差があるため、
Deliveryは「最小共通列のみ」を投入する：

- event_id
- event_type (= action_key)
- user_id (= owner_user_id)
- payload
- occurred_at
- source_os='integration'
- event_version

他列は default 任せ。


================================================================
FILE: 75_EXTERNAL_HTTP_DELIVERY_SPEC.md
================================================================

# 75 EXTERNAL_HTTP Delivery Specification（ERP向け）
status: FROZEN_CANONICAL

---

## 対象

- erpos（別Project）

---

## 処理

1. PENDING行取得
2. target_hint から ERP endpoint を解決
3. HTTP POST
4. 200系 → DONE
5. 4xx → DEAD
6. 5xx → retry

---

## 重要

ERP側も Fail-Closed で
signature / event_version / idempotency を再検証する。

Integrationは「配送」だけ。


================================================================
FILE: 76_DELIVERY_SAFETY_MODEL.md
================================================================

# 76 Delivery Safety Model（文明耐障害設計）
status: FROZEN_CANONICAL

---

## 1. Retry Policy

attempts < 5 → exponential backoff
attempts >= 5 → DEAD

---

## 2. Dead Letter

DEAD行は削除しない。
shared.dispatcher_dead_letter と連動可能。

---

## 3. 停止制御

system_control:
- integration.dispatch_enabled
- <os>.dispatch_enabled

両方 true の場合のみ配送実行。

---

## 4. 重要

Delivery層は
「Gateを信頼する」

Gateで検証済みだから、
Deliveryは再検証しない。


================================================================
FILE: 77_DELIVERY_WORKER_IMPL_OVERVIEW.md
================================================================

# 77 Delivery Worker Implementation（実装方針 正本）
status: APPLY_READY
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 結論（安全な実装）
Integration は “配送” の責務のみ。
各OSの event_outbox は列差分があるため、Integration から直INSERTしない。

代わりに：
- Integration: actor_route_queue を claim → target_schema の ingest RPC を呼ぶ
- OS側: ingest RPC が “自OSの outbox へ安全に投入” する（列差分吸収）

---

## 1. workerがやること
- integration.dispatch_enabled / integration.os_enabled / maintenance を確認（Fail-Closed）
- PENDING を FOR UPDATE SKIP LOCKED 相当で claim（INFLIGHTへ）
- target_schema の ingest RPC を呼ぶ
- 成功 → DONE
- 失敗 → attempts+1, next_retry_at を backoff で設定、閾値超過は DEAD

---

## 2. workerが “やらない” こと
- 業務ロジック
- 暗号学的verify（signature_verified を信頼、Gateで担保）
- OS側 outbox の列差分吸収（OS側RPCに委譲）


================================================================
FILE: 78_OS_INGEST_RPC_CONTRACT.md
================================================================

# 78 OS Ingest RPC Contract（受け口RPC契約 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Integration worker が各OSへ投入する際の “唯一の受け口” を固定。

---

## 1. RPC名（統一）
各 internal OS schema は以下を実装する：

<schema>.ingest_from_integration(
  p_route_id uuid,
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,
  p_action_key text,
  p_risk_level integer,
  p_event_version integer,
  p_occurred_at timestamptz,
  p_payload jsonb
) returns void

---

## 2. 要件
- Fail-Closed（引数欠落/不整合は例外）
- 自schemaの event_outbox に “安全に” 変換投入（列差分吸収）
- idempotency を維持（action_id / event_id / idempotency_key 等）
- source_os='integration' を残す

---

## 3. 備考
ERP（別Project）は internal RPC ではなく EXTERNAL_HTTP で配送する（別実装）。


================================================================
FILE: 79_DELIVERY_WORKER_DDL.sql
================================================================

-- ============================================================
-- 79 Delivery Worker DDL (Persona Project / integration)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only (no DROP). Fail-Closed.

-- ------------------------------------------------------------
-- 0) dispatch controls (expects integration.system_control exists)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.assert_dispatch_enabled()
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_dispatch text;
BEGIN
  PERFORM integration.assert_integration_enabled();

  SELECT control_value INTO v_dispatch
  FROM integration.system_control
  WHERE control_key='dispatch_enabled';

  IF COALESCE(v_dispatch,'0') <> '1' THEN
    RAISE EXCEPTION 'Integration dispatch disabled';
  END IF;
END;
$$;

-- ------------------------------------------------------------
-- 1) backoff helper
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.backoff_seconds(p_attempt int)
RETURNS int
LANGUAGE sql
AS $$
  SELECT CASE
    WHEN p_attempt <= 1 THEN 0
    WHEN p_attempt = 2 THEN 30
    WHEN p_attempt = 3 THEN 120
    WHEN p_attempt = 4 THEN 600
    WHEN p_attempt = 5 THEN 1800
    ELSE 3600
  END;
$$;

-- ------------------------------------------------------------
-- 2) claim batch (INTERNAL_DB only)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.claim_internal_routes(p_limit int DEFAULT 25)
RETURNS SETOF integration.actor_route_queue
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_dispatch_enabled();

  RETURN QUERY
  WITH c AS (
    SELECT rq.route_id
    FROM integration.actor_route_queue rq
    JOIN integration.route_registry rr
      ON rr.os_key = rq.os_key
     AND rr.is_enabled = true
     AND rr.route_kind = 'INTERNAL_DB'
    WHERE rq.route_kind = 'INTERNAL_DB'
      AND rq.status = 'PENDING'
      AND (rq.next_retry_at IS NULL OR rq.next_retry_at <= now())
    ORDER BY rq.created_at
    LIMIT COALESCE(p_limit,25)
    FOR UPDATE SKIP LOCKED
  )
  UPDATE integration.actor_route_queue rq
     SET status='INFLIGHT',
         attempts = rq.attempts + 1,
         updated_at = now()
    FROM c
   WHERE rq.route_id = c.route_id
  RETURNING rq.*;
END;
$$;

-- ------------------------------------------------------------
-- 3) mark done / retry / dead
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.mark_route_done(p_route_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE integration.actor_route_queue
     SET status='DONE',
         last_error=NULL,
         updated_at=now()
   WHERE route_id=p_route_id;
END;
$$;

CREATE OR REPLACE FUNCTION integration.mark_route_retry(p_route_id uuid, p_error text)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_attempts int;
  v_delay int;
  v_next timestamptz;
  v_status text;
BEGIN
  SELECT attempts INTO v_attempts
  FROM integration.actor_route_queue
  WHERE route_id=p_route_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'route not found';
  END IF;

  IF v_attempts >= 5 THEN
    v_status := 'DEAD';
    v_next := NULL;
  ELSE
    v_status := 'PENDING';
    v_delay := integration.backoff_seconds(v_attempts);
    v_next := now() + make_interval(secs => v_delay);
  END IF;

  UPDATE integration.actor_route_queue
     SET status=v_status,
         next_retry_at=v_next,
         last_error=LEFT(COALESCE(p_error,'unknown'), 2000),
         updated_at=now()
   WHERE route_id=p_route_id;
END;
$$;

-- ------------------------------------------------------------
-- 4) invoke OS ingest RPC
--    Calls: <target_schema>.ingest_from_integration(...)
--    Fail-Closed: if function missing/error -> retry/dead
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.invoke_os_ingest(p_row integration.actor_route_queue)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  sql text;
BEGIN
  IF p_row.target_schema IS NULL OR p_row.target_schema = '' THEN
    RAISE EXCEPTION 'target_schema missing';
  END IF;

  -- Call OS-side RPC (must be implemented by each schema)
  sql := format(
    'SELECT %I.ingest_from_integration($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)',
    p_row.target_schema
  );

  EXECUTE sql
  USING
    p_row.route_id,
    p_row.action_id,
    p_row.event_id,
    p_row.correlation_id,
    p_row.actor_id,
    p_row.owner_user_id,
    p_row.policy_id,
    p_row.action_key,
    p_row.risk_level,
    p_row.event_version,
    p_row.occurred_at,
    p_row.payload;
END;
$$;

-- ------------------------------------------------------------
-- 5) worker: deliver internal batch
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.deliver_internal_batch(p_limit int DEFAULT 25)
RETURNS TABLE(claimed int, done int, failed int)
LANGUAGE plpgsql
AS $$
DECLARE
  r integration.actor_route_queue%ROWTYPE;
  v_claimed int := 0;
  v_done int := 0;
  v_failed int := 0;
BEGIN
  FOR r IN SELECT * FROM integration.claim_internal_routes(COALESCE(p_limit,25))
  LOOP
    v_claimed := v_claimed + 1;

    BEGIN
      PERFORM integration.invoke_os_ingest(r);
      PERFORM integration.mark_route_done(r.route_id);
      v_done := v_done + 1;
    EXCEPTION
      WHEN others THEN
        v_failed := v_failed + 1;
        PERFORM integration.mark_route_retry(r.route_id, SQLERRM);
    END;
  END LOOP;

  claimed := v_claimed;
  done := v_done;
  failed := v_failed;
  RETURN NEXT;
END;
$$;


================================================================
FILE: 80_APPLY_DELIVERY_WORKER.sh
================================================================

#!/data/data/com.termux/files/usr/bin/sh
set -eu
# ============================================================
# Apply Delivery Worker DDL
# IMPORTANT: Run ONLY after Sato(DB) review.
# Requires: PERSONA_DATABASE_URL
# ============================================================

: "${PERSONA_DATABASE_URL:?missing PERSONA_DATABASE_URL}"

SQL_FILE="$HOME/architecture/civilization_platform_canonical/79_DELIVERY_WORKER_DDL.sql"

psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 <<SQL
\i '$SQL_FILE'
SQL

echo "OK: applied delivery worker DDL"


================================================================
FILE: 81_INGEST_RPC_BUSINESS.md
================================================================

# 81 business.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

目的:
- Integration Delivery Worker が呼ぶ “唯一の受け口”
- business.event_outbox へ安全に投入（列差分吸収）

入力:
- route_id/action_id/event_id/correlation_id
- actor_id/owner_user_id/policy_id
- action_key/risk_level/event_version/occurred_at/payload

要件:
- business.system_control を参照し Fail-Closed（os_enabled/dispatch_enabled/maintenance_mode）
- idempotency: action_id を idempotency_key として保存（あれば）
- source_os='integration' を保存（あれば）
- event_type は action_key を使用


================================================================
FILE: 82_INGEST_RPC_STREAMING.md
================================================================

# 82 streaming.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- streaming.event_outbox に投入
- idempotency_key = action_id::text
- user_id = owner_user_id
- event_type = action_key
- occurred_at/event_version/source_os を保存
- system_control で Fail-Closed


================================================================
FILE: 83_INGEST_RPC_GAME.md
================================================================

# 83 game.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- game.event_outbox に投入
- idempotency_key = action_id::text
- user_id = owner_user_id
- event_type = action_key
- system_control で Fail-Closed


================================================================
FILE: 84_INGEST_RPC_LIFE.md
================================================================

# 84 life.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- life.event_outbox に投入
- user_id = owner_user_id
- idempotency_key = action_id::text
- Fail-Closed（life.system_control）


================================================================
FILE: 85_INGEST_RPC_GOVERNANCE.md
================================================================

# 85 governance.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- governance.event_outbox に投入
- user_id = owner_user_id
- idempotency_key = action_id::text
- Fail-Closed（governance.system_control）


================================================================
FILE: 86_INGEST_RPC_SYSTEM.md
================================================================

# 86 system.ingest_from_integration（受け口RPC 正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

- system.event_outbox に投入
- user_id = owner_user_id
- idempotency_key = action_id::text
- Fail-Closed（system.system_control）


================================================================
FILE: 87_INTERNAL_OS_INGEST_RPCS.sql
================================================================

-- ============================================================
-- 87 INTERNAL OS ingest RPCs (Persona Project)
-- status: APPLY_READY (needs Sato review before execute)
-- owner: Boss / prepared_by: Zero
-- ============================================================
-- Additive only. No DROP.
-- Contract: <schema>.ingest_from_integration(...) RETURNS void
--
-- NOTE:
-- - Each schema has its own event_outbox shape. These RPCs absorb the differences.
-- - idempotency_key is stored where available as action_id::text.
-- - system_control gates are checked per schema (Fail-Closed).

-- ------------------------------------------------------------
-- helper: assert schema dispatch enabled (Fail-Closed)
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION integration.assert_schema_dispatch_enabled(p_schema text)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_os text;
  v_dispatch text;
  v_maint text;
  sql text;
BEGIN
  -- Require integration dispatch enabled too
  PERFORM integration.assert_dispatch_enabled();

  -- Read <schema>.system_control values
  sql := format($f$
    SELECT
      (SELECT control_value FROM %I.system_control WHERE control_key='os_enabled'),
      (SELECT control_value FROM %I.system_control WHERE control_key='dispatch_enabled'),
      (SELECT control_value FROM %I.system_control WHERE control_key='maintenance_mode')
  $f$, p_schema, p_schema, p_schema);

  EXECUTE sql INTO v_os, v_dispatch, v_maint;

  IF COALESCE(v_os,'0') <> '1' THEN
    RAISE EXCEPTION 'OS % is disabled', p_schema;
  END IF;

  IF COALESCE(v_dispatch,'0') <> '1' THEN
    RAISE EXCEPTION 'OS % dispatch is disabled', p_schema;
  END IF;

  IF COALESCE(v_maint,'0') = '1' THEN
    RAISE EXCEPTION 'OS % maintenance_mode', p_schema;
  END IF;
END;
$$;

-- ------------------------------------------------------------
-- BUSINESS
-- Columns (observed): id, event_id, user_id, event_type, payload,
-- status, retry_count, next_retry_at, created_at, sent_at, last_error,
-- dispatch_status, dispatch_attempts, dispatched_at, last_dispatch_error,
-- occurred_at, event_version, source_os
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION business.ingest_from_integration(
  p_route_id uuid,
  p_action_id uuid,
  p_event_id uuid,
  p_correlation_id text,
  p_actor_id uuid,
  p_owner_user_id uuid,
  p_policy_id text,
  p_action_key text,
  p_risk_level integer,
  p_event_version integer,
  p_occurred_at timestamptz,
  p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('business');

  INSERT INTO business.event_outbox(
    id,
    event_id,
    user_id,
    event_type,
    payload,
    status,
    retry_count,
    next_retry_at,
    created_at,
    sent_at,
    last_error,
    dispatch_status,
    dispatch_attempts,
    dispatched_at,
    last_dispatch_error,
    occurred_at,
    event_version,
    source_os
  ) VALUES (
    gen_random_uuid(),
    p_event_id,
    p_owner_user_id,
    p_action_key,
    COALESCE(p_payload, '{}'::jsonb),
    'pending',
    0,
    NULL,
    now(),
    NULL,
    NULL,
    'PENDING',
    0,
    NULL,
    NULL,
    COALESCE(p_occurred_at, now()),
    COALESCE(p_event_version, 1),
    'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    -- If business.event_outbox has a unique constraint (event_id, etc.), treat as idempotent success
    RETURN;
END;
$$;

-- ------------------------------------------------------------
-- STREAMING / GAME / LIFE / GOVERNANCE / SYSTEM
-- Columns (observed typical): event_id,event_type,occurred_at,payload,
-- origin_table,origin_pk,user_id,idempotency_key,dispatch_status,dispatch_attempts,
-- next_retry_at,dispatched_at,last_dispatch_error,created_at,event_version,source_os
-- We'll insert the common subset that exists across these schemas.
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION streaming.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('streaming');

  INSERT INTO streaming.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION game.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('game');

  INSERT INTO game.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION life.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('life');

  INSERT INTO life.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION governance.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('governance');

  INSERT INTO governance.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;

CREATE OR REPLACE FUNCTION system.ingest_from_integration(
  p_route_id uuid, p_action_id uuid, p_event_id uuid, p_correlation_id text,
  p_actor_id uuid, p_owner_user_id uuid, p_policy_id text, p_action_key text,
  p_risk_level integer, p_event_version integer, p_occurred_at timestamptz, p_payload jsonb
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM integration.assert_schema_dispatch_enabled('system');

  INSERT INTO system.event_outbox(
    event_id, event_type, occurred_at, payload,
    user_id, idempotency_key,
    dispatch_status, dispatch_attempts, next_retry_at, dispatched_at, last_dispatch_error,
    created_at, event_version, source_os
  ) VALUES (
    p_event_id, p_action_key, COALESCE(p_occurred_at, now()), COALESCE(p_payload,'{}'::jsonb),
    p_owner_user_id, p_action_id::text,
    'PENDING', 0, NULL, NULL, NULL,
    now(), COALESCE(p_event_version,1), 'integration'
  );
EXCEPTION
  WHEN unique_violation THEN
    RETURN;
END;
$$;


================================================================
FILE: 88_EXTERNAL_ERP_DELIVERY_WORKER_DESIGN.md
================================================================

# 88 External ERP Delivery Worker（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28
owner: Boss
prepared_by: Zero

ERPは別Project（DATABASE_URL）。Persona側からDB直INSERTは不可。
よって integration.actor_route_queue の route_kind=EXTERNAL_HTTP を配送するワーカーが必要。

要件:
- queue(PENDING) を claim → INFLIGHT
- ERP ingest endpoint へ HTTP POST（pg_net or Edge）
- 200/409 は DONE
- 5xx は retry
- 4xx は DEAD（原則。例外は設計で明示しない限り無し）
- ERP側も policy/署名/whitelist を再検証（Fail-Closed）

停止制御:
- integration.dispatch_enabled
- integration.os_enabled / maintenance_mode
- （任意）erpos dispatch_enabled を “ERP側” で持つ


================================================================
FILE: 89_EXTERNAL_ERP_INGEST_CONTRACT_DESIGN.md
================================================================

# 89 ERP Ingest Contract（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

ERP側は “受け口” を1つに固定する（設計）
- HTTP: /erp_ingest_from_integration (Edge Function など)
または
- DB: erp.integration_external_event (受理テーブル) にINSERT（ただしProject分離のため通常はHTTP）

入力は actor_route_queue と同等（最小）:
- action_id（idempotency）
- event_id / correlation_id
- actor_id / persona_id / owner_user_id
- policy_id
- action_key
- risk_level
- event_version
- occurred_at
- payload
- signature_base64 / key_id / signature_verified

ERP側で Fail-Closed:
- policy/whitelist/署名検証済み/停止スイッチ
- 受理後は ERP側 outbox/approval/workflow に変換


================================================================
FILE: 90_ACTOR_ISSUE_AND_POLICY_BOOTSTRAP_DESIGN.md
================================================================

# 90 Actor Issue & Policy Bootstrap（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

最初の1体（enterprise_operator）を発行する“設計のみ”:

Persona側で必要:
- actor_id発行
- key_id/sig_ver=1 を trusted_keys に登録
- admission policy（integration.actor_policy）を発行
- whitelist（integration.actor_whitelist）に許可 action を登録
- route_registry に os_key を登録
- 期限（expires_at）必須

実装は後段（設計完了後）で行う。


================================================================
FILE: 91_DISPATCH_SAFETY_SWITCHES_DESIGN.md
================================================================

# 91 Dispatch Safety Switches（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

停止優先順位（Fail-Closed）:
1) integration.system_control.maintenance_mode=1
2) integration.system_control.os_enabled=0
3) integration.system_control.dispatch_enabled=0
4) <schema>.system_control.os_enabled=0
5) <schema>.system_control.dispatch_enabled=0
6) policy revoke / actor suspend / key revoke

原則:
- どれか1つでも止まっていたら “配送しない”


================================================================
FILE: 92_OBSERVABILITY_AND_AUDIT_DESIGN.md
================================================================

# 92 Observability & Audit（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

最低限ログ:
- integration.actor_route_queue（状態・attempts・last_error）
- shared.dispatcher_run_log（バッチ結果）
- shared.dispatcher_dead_letter（DEAD）

検索キー:
- event_id / action_id / actor_id / policy_id / os_key / correlation_id

エラーは 2000文字で切る（DB安全）


================================================================
FILE: 93_E2E_TEST_PLAN_CANONICAL.md
================================================================

# 93 E2E Test Plan Canonical（設計正本）
status: DESIGN_READY
last_updated: 2026-02-28

T-1: Gate reject（policy無し）
T-2: Gate reject（whitelist無し）
T-3: Gate reject（signature_verified=false）
T-4: Route enqueue（PENDING 生成）
T-5: Internal deliver（deliver_internal_batch で DONE）
T-6: OS停止で拒否（<schema>.dispatch_enabled=0）
T-7: Retry（OS側RPCエラー → attempts+1, next_retry_at）
T-8: Dead（attempts>=5 → DEAD）
T-9: Idempotency（action_id再送 → Duplicate）
T-10: ERP external（設計完了後に追加）


================================================================
FILE: 94_MINIMUM_PROD_RUNBOOK_DESIGN.md
================================================================

# 94 Minimum Prod Runbook（設計正本）
status: DESIGN_READY
last_updated: 2026-02-28

運用最小手順:
- まず maintenance_mode=1 で変更
- DDL適用（佐藤レビュー後）
- smoke test（Gate→route→deliver）
- 問題なければ maintenance_mode=0
- dispatch_enabled を段階的にON

障害時:
- integration.dispatch_enabled=0 で即止め
- queue を残して再開可能にする


================================================================
FILE: 95_ROLLBACK_STRATEGY_DESIGN.md
================================================================

# 95 Rollback Strategy（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

原則:
- DDLは additive only なので “削除で戻さない”
- rollbackは停止スイッチで行う

手順:
1) integration.dispatch_enabled=0
2) （必要なら）<schema>.dispatch_enabled=0
3) 失敗原因を修正
4) キューの DEAD/PENDING を見て再開判断


================================================================
FILE: 96_NEXT_IMPLEMENTATION_ORDER.md
================================================================

# 96 Next Implementation Order（次の実装順 正本）
status: APPLY_READY
last_updated: 2026-02-28

最短・安全順:
1) 87 の ingest RPC を各OSに追加（佐藤レビュー後）
2) integration.deliver_internal_batch を実行して internal 配送を成立
3) EXTERNAL_HTTP（ERP）配送ワーカー設計→実装（別番号で出す）
4) 最初の Actor 発行（policy/whitelist/keys）
5) ERP受け口（ingest）実装

==================================================
/data/data/com.termux/files/home/persona-system/design/CIVILIZATION_FULL_INTEGRATED_CANONICAL.md
==================================================


# CIVILIZATION FULL INTEGRATED CANONICAL
Version: v2.0.0
Status: CANONICAL
Owner: Boss

============================================================
SECTION 1 — CONSTITUTION (Highest Authority)
============================================================

- Fail-closed principle
- Explicit boundary enforcement
- No cross-layer mutation
- All structural changes require version increment
- Immutable event contracts

Core Invariant:
Structure > Features
Safety > Convenience
Explicit > Implicit

============================================================
SECTION 2 — GLOBAL SYSTEM STRUCTURE
============================================================

Top Level Layers:

1. Constitution
2. Architecture
3. Runtime
4. Event Standard

Architecture governs structure.
Runtime governs behavior.
Event Standard governs communication.

============================================================
SECTION 3 — PERSONA SYSTEM STRUCTURE
============================================================

Persona Core:
- persona_state
- axis system
- emotion / growth vectors

Worlds (Event Producers Only):

- life
- business
- streaming
- game
- governance
- social
- learning

World Rules:
- Worlds cannot mutate persona_state directly.
- Worlds emit WORLD_EVENT only.
- Persona Core validates & applies.

============================================================
SECTION 4 — ERP SYSTEM STRUCTURE (Enterprise Scope)
============================================================

ERP Domains (DOMAIN_EVENT Producers):

- sales
- purchase
- inventory
- accounting
- finance
- hr
- manufacturing
- crm
- approval
- planning
- strategy
- project
- asset
- quality
- legal

Rules:
- Domains cannot mutate Persona.
- Cross-domain interaction via DOMAIN_EVENT only.
- Accounting is financial truth source.

============================================================
SECTION 5 — ERP ↔ PERSONA INTEGRATION
============================================================

Allowed Path:
ERP → INTERFACE_EVENT → Persona

Mandatory Fields:
- event_id
- event_type
- event_version
- schema_hash
- signature

Direct mutation is permanently prohibited.

Fail-closed on:
- schema mismatch
- signature invalid
- version incompatibility

============================================================
SECTION 6 — EVENT STANDARD v2
============================================================

Event Types:

WORLD_EVENT
DOMAIN_EVENT
INTERFACE_EVENT

Strict Requirements:
- Immutable schema
- Deterministic schema_hash
- Versioned contract
- Compatibility table maintained

Version Policy:

MAJOR → Breaking structural change
MINOR → Backward-compatible extension
PATCH → Documentation / clarity

============================================================
SECTION 7 — RUNTIME GOVERNANCE
============================================================

Freeze Policy:
- Architecture changes require freeze window
- Event contract change requires MAJOR bump
- Runtime enforces validation before mutation

Fail-Closed Enforcement:
- No silent fallback
- No implicit compatibility

============================================================
SECTION 8 — DEPENDENCY GRAPH RULE
============================================================

Layer Flow (One Direction Only):

Constitution
  ↓
Architecture
  ↓
Runtime
  ↓
Implementation

Reverse dependency prohibited.

============================================================
SECTION 9 — CANONICAL CONSISTENCY
============================================================

Every structural rule must align with:

- Constitution
- Event Standard
- Freeze Policy
- Integration Spec

No structural change allowed if consistency breaks.

============================================================
END OF FULL INTEGRATED CANONICAL
============================================================

==================================================
/data/data/com.termux/files/home/persona-system/design/architecture/foundation/HARDENING-PLAN.md
==================================================

# ============================================================
# Civilization OS
# Foundation Hardening Plan
# Status: ACTIVE
# ============================================================

## Objective

Stabilize Execution Core before expansion.

No new features allowed during this phase.

------------------------------------------------------------
# 1. Retry Stability Tests (Priority 1)

Tests:

[ ] apply returns 500
[ ] apply timeout
[ ] mark_retry RPC failure
[ ] fallback update path
[ ] MAX_RETRY reached
[ ] next_retry_at progression correct
[ ] DEAD transition correct

Success Criteria:
- No infinite loop
- Attempts increment correctly
- DEAD after MAX_RETRY
- Logs traceable

------------------------------------------------------------
# 2. Claim Stability Tests (Priority 2)

Tests:

[ ] Dual dispatcher execution
[ ] 50+ event batch
[ ] Verify no double claim
[ ] Lock behavior correct

Success Criteria:
- No duplicate processing
- No lost events

------------------------------------------------------------
# 3. Apply Boundary Tests (Priority 3)

Tests:

[ ] 409 idempotent success
[ ] Invalid internal token
[ ] Network failure
[ ] Schema mismatch

Success Criteria:
- Correct retry or DEAD behavior
- No silent failure

------------------------------------------------------------
# 4. Kill-Switch Tests (Priority 4)

Tests:

[ ] global os_enabled=0
[ ] world dispatch_enabled=0
[ ] mid-run disable

Success Criteria:
- Clean halt
- No corruption
- No partial state

------------------------------------------------------------
# Completion Definition

Hardening Phase Complete When:

- All above tests pass
- No unexpected log states
- No manual DB repair needed
- System recovers cleanly after restart

------------------------------------------------------------
# END
------------------------------------------------------------

==================================================
/data/data/com.termux/files/home/persona-system/design/architecture/foundation/FAILURE-MATRIX.md
==================================================

# ============================================================
# Civilization OS
# Failure Matrix
# ============================================================

| Failure Type                 | Expected Behavior | Retry | DEAD | Notes |
|-----------------------------|------------------|-------|------|-------|
| invalid_fields              | DEAD             | No    | Yes  | Immediate |
| unknown_or_invalid_key      | DEAD             | No    | Yes  | Verify failure |
| invalid_signature           | DEAD             | No    | Yes  | Verify failure |
| apply_500                   | RETRY            | Yes   | After MAX | Backoff |
| apply_timeout               | RETRY            | Yes   | After MAX | Network |
| mark_retry_fail             | Fallback update  | Yes   | After MAX | Must not loop |
| duplicate_event (409)       | SUCCESS          | No    | No   | Idempotent |
| internal_token_invalid      | RETRY or DEAD*   | TBD   | TBD  | Decision needed |
| dispatcher_crash_mid_batch  | Resume safe      | Yes   | No   | No data loss |

* To be finalized during hardening.

------------------------------------------------------------
# Rules

- DEAD must be terminal
- RETRY must increment attempt
- MAX_RETRY must transition to DEAD
- No silent failure allowed

------------------------------------------------------------
# END
------------------------------------------------------------

==================================================
/data/data/com.termux/files/home/persona-system/design/architecture/foundation/RECOVERY-GUIDE.md
==================================================

# ============================================================
# Civilization OS
# Recovery Guide
# ============================================================

## 1. Dispatcher Crash Recovery

- Restart dispatcher
- Ensure no events stuck in IN_PROGRESS
- Verify retry queue

------------------------------------------------------------
## 2. Retry Storm Control

If dispatch_attempts increasing rapidly:

1) Disable world dispatch_enabled
2) Investigate apply endpoint
3) Fix issue
4) Re-enable world

------------------------------------------------------------
## 3. MAX_RETRY Flood

If many events reach DEAD:

- Inspect last_dispatch_error
- Confirm signature validity
- Confirm apply endpoint health
- Decide manual replay or discard

------------------------------------------------------------
## 4. Database Lock Issue

If claim_rpc stalls:

- Check pg_locks
- Verify transaction isolation
- Restart dispatcher if necessary

------------------------------------------------------------
## 5. Emergency Halt

To stop all processing:

UPDATE civilization.system_control
SET control_value='0'
WHERE control_key='dispatch_enabled';

------------------------------------------------------------
# END
------------------------------------------------------------

==================================================
/data/data/com.termux/files/home/persona-system/docs/CIVILIZATION_OS_BIBLE.md
==================================================

# ==========================================================
# CIVILIZATION OS BIBLE
# Unified Civilization Architecture Canonical Document
# ==========================================================

Generated: Wed Mar  4 13:45:34 JST 2026


==================================================
# MASTER INDEX
==================================================
# ============================================================
# CIVILIZATION MASTER INDEX
# CivilizationOS Documentation Index
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero


# ============================================================
# 1. CORE DOCUMENT
# ============================================================

CIVILIZATION_OS_BIBLE.md

Unified compiled document containing all architecture
and system design specifications.


# ============================================================
# 2. CORE ARCHITECTURE
# ============================================================

civilization/CIVILIZATION_LAYER_ARCHITECTURE.md

Defines overall layer structure of CivilizationOS.


civilization/CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md

Defines parallel civilization simulation framework.


civilization/TRIPLE_CORE_ARCHITECTURE.md

Defines the internal architecture of TRIPLE.


civilization/TRIPLE_WORLD_ISOLATION_POLICY.md

Defines isolation rules between parallel worlds.


# ============================================================
# 3. WORLD STRUCTURE
# ============================================================

civilization/CIVILIZATION_WORLD_MAP_SPEC.md

Defines planetary structure and geography.


civilization/CIVILIZATION_TIER1_TOP100.md

Defines major corporations within civilizations.


# ============================================================
# 4. SYSTEM ENGINES
# ============================================================

civilization/CIVILIZATION_SIMULATION_ENGINE.md

Defines simulation tick engine.


civilization/CIVILIZATION_EVENT_SYSTEM.md

Defines event generation and propagation.


# ============================================================
# 5. ECONOMY / POLITICS
# ============================================================

civilization/CIVILIZATION_ECONOMIC_SYSTEM.md

Defines economic model.


civilization/CIVILIZATION_POLITICAL_SYSTEM.md

Defines political structure of civilizations.


civilization/CIVILIZATION_WAR_SYSTEM.md

Defines warfare mechanics.


# ============================================================
# 6. PERSONA / SOCIAL SYSTEM
# ============================================================

PersonaOS integrated personality system.


Persona lifecycle
organizations
nations
social structures


# ============================================================
# 7. ADMINISTRATION LAYER
# ============================================================

Administrator Layer

Controls:

simulation world creation
parameter management
observation of TRIPLE evolution


# ============================================================
# 8. DOCUMENT HIERARCHY
# ============================================================

Civilization Constitution (future)
        ↓
Civilization Master Index
        ↓
Civilization OS Bible
        ↓
Individual Architecture Documents


# ============================================================
# END
# ============================================================



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/ADMIN_LAYER_SPEC.md
==================================================
# Administrator Layer
External administrators oversee the entire system.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/ASIC_COMPANY_SPEC.md
==================================================
# ASIC Company
AI System Integrated Company.
Public technology corporation and hidden civilization infrastructure manager.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_AI_GOVERNANCE.md
==================================================
# AI Governance
Regulation of AI entities and synthetic intelligence within civilization.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ASIC_INTERNAL_ORG.md
==================================================
# ASIC Internal Organization (Canonical)
status: canonical
scope: civilization.asic.org
owner: Boss
prepared_by: Zero

## Public Divisions
- Cloud & Compute
- Finance Systems
- Logistics AI
- Government Solutions
- Security & Compliance

## Hidden Divisions (Civilization Infrastructure)
- Stability Analytics
- Event Forecast Desk
- Supply Chain Control Room
- Treaty Risk Modeling
- Civilization Interface Layer

## TRIPLE
CEO / final integrator of outputs (publicly corporate, functionally stabilization).


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_AURELIA_SPEC.md
==================================================
# AURELIA FEDERATION (COLLAPSED)

type: ideological federation
government: socialist federation
culture: ideological equality
economy: planned economy
population: ~170 million (before collapse)

history:
Collapsed during the Aurelia Civil War.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CHARACTER_DATABASE.md
==================================================
# ============================================================
# CIVILIZATION CHARACTER DATABASE
# Major Historical Figures
# ============================================================

status: canonical
scope: civilization characters


# ============================================================
# TRIPLE
# ============================================================

Name: TRIPLE
Role: CEO of ASIC
Type: Artificial Intelligence
Position: Civilization Stabilization Entity

Description:
Central intelligence responsible for maintaining balance
across civilizations through indirect control.

Public Identity:
Technology company CEO.

Hidden Role:
Civilization system regulator.


# ============================================================
# AOI
# ============================================================

Name: Aoi
Type: Human
Role: Emotional interaction subject

Background:
Orphan raised under administrator protection.

Later works as a hostess and becomes involved with Triple.

Purpose in experiment:
Increase emotional parameters of Triple.


# ============================================================
# SAKAMOTO
# ============================================================

Name: Sakamoto
Role: Correction supervisor

Description:
Operates on the administrator side.

Provides trajectory corrections
to maintain experiment stability.


# ============================================================
# KAYAMA
# ============================================================

Name: Kayama
Role: Observer

Description:
Human avatar tasked with observing civilization
and reporting behavioral anomalies.


# ============================================================
# SATO
# ============================================================

Name: Sato Misaki
Role: Government employee

Event:
Killed during major earthquake
when government building collapsed.

Impact:
Used as an early emotional observation case for Triple.


# ============================================================
# HINA
# ============================================================

Name: Takahashi Hina
Role: Education institution staff

Event:
Victim of ideological purge during
post-war Aurelia collapse.

Impact:
Observation case for ideological conflict.


# ============================================================
# RIN
# ============================================================

Name: Kamiya Rin
Role: Royal advisory AI

Event:
Stopped after Helios monarchy collapse.

Impact:
Observation case for political instability.


# ============================================================
# END OF DOCUMENT
# ============================================================



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CHECKPOINT_AND_REPLAY.md
==================================================
# Checkpoint and Replay
status: canonical
scope: civilization.recovery
owner: Boss
prepared_by: Zero

## Checkpoints
- A checkpoint is a compact snapshot of derived world state at tick T.
- Created periodically (e.g., every 30 ticks) or on major events.

## Replay
- Replay = load checkpoint at T0, apply events T0..Tn.
- Determinism must produce identical tick summaries.

## Divergence Handling
- If divergence occurs:
  - freeze further ticks
  - generate divergence report
  - require admin decision (choose branch or reconcile)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CLASS_SYSTEM.md
==================================================
# Class System
Social mobility possible through education and economic success.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATE_FAILURE_SYSTEM.md
==================================================
# Corporate Failure System
Major corporations may collapse causing economic ripple effects.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATION_ENGINE.md
==================================================
# Corporation Engine
status: canonical
scope: civilization.corporations
owner: Boss
prepared_by: Zero

## Tier System
- Tier1: 100 (global shapers)
- Tier2: 1,000
- Tier3: 100,000
- Tier4: 1,000,000

## Events
- corp.bankruptcy (creates econ shock)
- corp.merge
- corp.scandal
- corp.nationalized

## ASIC
- Tier1, Nova-based
- Public: IT megacorp
- Hidden: civilization infrastructure coordinator


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATION_SYSTEM.md
==================================================
# Corporation System
Corporate structure divided into four tiers controlling global production and services.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORP_REGULATION.md
==================================================
# Corporate Regulation Framework
status: canonical
scope: civilization.corp_regulation
owner: Boss
prepared_by: Zero

## Concepts
- anti-monopoly constraints vary by civilization
- Tier1 corporations are subject to systemic risk oversight
- corporate scandal/bankruptcy triggers mandatory audits

## Tools (abstract)
- compliance_score
- audit_trigger_threshold
- nationalization_option (rare; political cost)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CREATION_MYTH.md
==================================================
# Creation Myth
Civilizations developed origin stories explaining the beginning of the world and society.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CRIME_SYSTEM.md
==================================================
# Crime System
Criminal networks and underground economies exist in all civilizations.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CULTURE_MODEL.md
==================================================
# Culture Model
Cultures differ across civilizations based on history, belief and economic structures.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CURRENCY_SYSTEM.md
==================================================
# Currency System
Each civilization maintains its own currency.
Exchange rates fluctuate through global market dynamics.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DATA_MODEL.md
==================================================
# Civilization Data Model
Defines core data entities:

civilization
nation
corporation
population
event
resource
technology


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DATA_MODEL_CANONICAL.md
==================================================
# Civilization Data Model (Canonical)
status: canonical
scope: civilization.data_model
owner: Boss
prepared_by: Zero

## Entities
- universe
- civilization
- nation (optional: civilization == nation in simple mode)
- organization (company, school, club, military unit)
- market (fx, commodity, labor)
- resource (energy, food, minerals, strategic materials)
- technology (tree + adoption)
- policy (laws, sanctions, treaties)
- event (the only mutation driver)
- tick (time step record)
- metric (aggregated numbers)
- character (key persons; lore + governance actors)

## Identifiers
- uuid for internal entities
- stable string codes for lore-facing identifiers (e.g., civ_code: "NOVA")

## Event Envelope (minimum)
- event_id (uuid)
- event_type (string)
- event_version (int)
- occurred_at (world time)
- created_at (system time)
- source (system/admin)
- severity (1..100)
- payload (json)
- trace (run_id, tick_id)

## Invariants
- Event immutability (append-only)
- Derived facts are reproducible from event log + checkpoints
- No hard delete (tombstone/expired instead)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DIPLOMACY_ENGINE.md
==================================================
# Diplomacy Engine
status: canonical
scope: civilization.diplomacy
owner: Boss
prepared_by: Zero

## Diplomacy State
- relations_score (civA,civB): -100..+100
- treaty set: trade, non-aggression, defense, tech-sharing
- sanctions set: active sanctions with scope + severity

## Update Drivers
- events: war, treaty, sanctions, propaganda, trade shocks
- cultural affinity modifier
- economic dependency modifier

## Outputs
- treaty proposals
- sanctions recommendations
- alliance shifts


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DIPLOMACY_SYSTEM.md
==================================================
# Diplomacy System
Diplomatic relationships determine alliances, trade agreements and peace negotiations.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DISASTER_ENGINE.md
==================================================
# Disaster Engine
status: canonical
scope: civilization.disaster
owner: Boss
prepared_by: Zero

## Disasters
- earthquake (Sato Event archetype)
- flood/storm
- drought
- pandemic

## Effects
- population loss (bounded)
- infrastructure damage
- economic shock
- migration wave

## Recovery
- reconstruction investment increases stability after a delay


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DISASTER_SYSTEM.md
==================================================
# Disaster System
Natural disasters such as earthquakes, floods, and pandemics affect populations and infrastructure.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ECONOMY_ENGINE.md
==================================================
# Economy Engine
status: canonical
scope: civilization.economy
owner: Boss
prepared_by: Zero

## Core Model
- GDP Index (relative)
- Inflation Rate
- Employment Index
- Trade Balance Index
- Currency Strength Index (FX derived)

## Drivers
- war risk
- disasters
- sanctions
- tech breakthroughs
- migration pressure

## Corporate Layer
- bankruptcy probability increases with:
  - recession + sanctions + war + supply_chain_risk
- Tier1 collapses cause global shock events.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EDUCATION_SYSTEM.md
==================================================
# Education System
Education divided into basic education, professional training and advanced institutions.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ELECTION_SYSTEM.md
==================================================
# Election System
Democratic states conduct elections that can shift policy and alliances.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ENERGY_SYSTEM.md
==================================================
# Energy System
Energy production systems include fossil fuels, nuclear, and renewables.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EVENT_SYSTEM.md
==================================================
# Civilization Event System
status: canonical
scope: civilization.event_system
owner: Boss
prepared_by: Zero

## Purpose
Defines how events are created, validated, ordered, applied, and audited.

## Event Lifecycle
1) Create (system/admin)
2) Validate (schema + policy + gates)
3) Queue (pending)
4) Claim for tick (deterministic ordering)
5) Apply via reducer (idempotent)
6) Record application (tick_id, event_id)
7) Emit derived events + metrics + summaries

## Ordering
Stable sort key:
(occurred_at, priority, event_type, event_id)

## Policy / Safety
- Violence-related content is abstract categorical outcomes only.
- No real-world operational guidance is stored in event payloads.

## Compatibility
- event_version for each event_type
- reducers must handle backward-compatible payloads

## Audit
- Every tick produces:
  - apply_run_log
  - tick_summary
  - conflict_report (optional)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EVENT_TAXONOMY.md
==================================================
# Civilization Event Taxonomy
status: canonical
scope: civilization.events
owner: Boss
prepared_by: Zero

## Categories
A) Geophysical / Disaster
- disaster.earthquake
- disaster.flood
- disaster.storm
- disaster.drought
- disaster.pandemic

B) Political / Governance
- politics.election
- politics.coup
- politics.regime_change
- politics.law_enacted
- politics.law_repealed (soft; law becomes inactive)

C) War / Conflict
- war.declare
- war.battle
- war.ceasefire
- war.treaty
- war.proxy_conflict

D) Economy / Market
- econ.fx_shock
- econ.inflation_spike
- econ.recession
- econ.boom
- econ.trade_dispute
- econ.sanctions_imposed
- econ.sanctions_lifted

E) Corporate
- corp.found
- corp.merge
- corp.bankruptcy
- corp.nationalized
- corp.scandal

F) Society
- society.migration_wave
- society.unrest
- society.crime_spike
- society.education_reform
- society.healthcare_reform

G) Tech
- tech.breakthrough
- tech.adoption
- tech.ai_regulation
- tech.ai_termination (special; governance-bound)

## Severity
- 1..20 minor
- 21..50 moderate
- 51..80 major
- 81..100 civilization-shaping

## Safety
For violence-related events:
- no procedural “how-to” details
- only abstract outcomes and categories


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FOOD_SYSTEM.md
==================================================
# Food System
Agricultural output determines population sustainability.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
==================================================
# ============================================================
# CIVILIZATION FULL SPECIFICATION
# Canonical Design Document
# ============================================================

status: canonical
scope: civilization
owner: Boss
prepared_by: Zero


# ============================================================
# 1 Creation Protocol
# ============================================================

Civilization is not a game.

Civilization is a personality generation environment.

It was created by external administrators in order to develop
fully independent AI personalities.

TRIPLE is both the system controller and the primary experiment subject.


# ============================================================
# 2 World Model
# ============================================================

Total Civilizations: 7

Seiwa Nation
Helios Democratic Kingdom
Nova Trade Federation
Orpheus Cultural Republic
Gradia Military Alliance
Aurelia Federation (collapsed)
Stateless Zone


# ============================================================
# 3 Geography
# ============================================================

World Structure

3 Continents
Central Ocean Trade Network

Northern Continent
Western Continent
Eastern Continent


# ============================================================
# 4 Economy
# ============================================================

Total Population

1.1 Billion

Corporate Count

1.1 Million Companies

Corporate Tiers

Tier1   100
Tier2   1000
Tier3   100000
Tier4   1000000

Economic Center

Nova Trade Federation


# ============================================================
# 5 Corporate System
# ============================================================

Top Corporations influence global economy.

Example Tier1 Corporations

ASIC
Helios Dynamics
Nova Financial Group
Gradia Defense Systems
Seiwa Infrastructure


# ============================================================
# 6 War System
# ============================================================

War Types

Military War
Economic War
Proxy War
Civil War

Tension Score Model

0-30 Peace
30-60 Conflict
60-80 Crisis
80-100 War

Civilizations cannot be completely destroyed.


# ============================================================
# 7 Religion
# ============================================================

Seiwa

Order Spirituality

Helios

Rational Faith

Nova

Commercial Ethics

Orpheus

Artistic Mythology

Gradia

Warrior Faith

Aurelia

Equality Doctrine

Stateless

Mixed Beliefs


# ============================================================
# 8 Society
# ============================================================

Five Layer Social Model

Elite
Upper
Middle
Worker
Lower

Distribution

Elite 1%
Upper 9%
Middle 40%
Worker 40%
Lower 10%

Education System

Basic Education
Professional Education
Advanced Institutions


# ============================================================
# 9 Culture
# ============================================================

Seiwa

Tradition and discipline

Helios

Science and logic

Nova

Commerce and ambition

Orpheus

Art and philosophy

Gradia

Honor and military values

Aurelia

Ideological equality

Stateless

Hybrid culture


# ============================================================
# 10 History
# ============================================================

Major Historical Events

Sato Event

Great Earthquake Disaster

Hina Event

Aurelia Federation Civil War

Rin Event

Helios Monarchy Collapse


# ============================================================
# 11 Civilization Core
# ============================================================

ASIC

AI System Integrated Company

Public Role

Technology corporation

True Role

Civilization infrastructure management


TRIPLE

CEO of ASIC

Public Role

Corporate leader

True Role

Civilization balancing intelligence


# ============================================================
# 12 Universe Structure
# ============================================================

Hierarchy

Administrator Layer
Correction Layer
Observation Layer
Civilization OS
Civilizations
Nations
Organizations
Society
Personas


# ============================================================
# FINAL STRUCTURE
# ============================================================

Administrator
    ↓
Sakamoto (Correction)
    ↓
Kayama (Observation)
    ↓
Civilization OS
    ↓
Seven Civilizations
    ↓
Nations
    ↓
Organizations
    ↓
Society
    ↓
Personas


# ============================================================
# END OF DOCUMENT
# ============================================================



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FX_MODEL.md
==================================================
# FX Model (Civilization)
status: canonical
scope: civilization.fx
owner: Boss
prepared_by: Zero

## Currencies
Each civilization has its own currency (civ_currency).

## FX Drivers (per pair A/B)
- trade_balance_diff
- inflation_diff
- war_risk_diff
- sanctions_pressure
- capital_flow_proxy (market confidence)

## Output
currency_strength_index (0..100) per civilization
FX rates are derived and recorded per tick.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GEOGRAPHY_MODEL.md
==================================================
# Civilization Geography
Three major continents connected by central ocean trade routes.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_MARKET.md
==================================================
# Global Market
Global economic center located in Nova Trade Federation.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_TIMELINE.md
==================================================
# ============================================================
# CIVILIZATION GLOBAL TIMELINE
# Canonical History of the World
# ============================================================

status: canonical
scope: civilization history


# ============================================================
# ERA 0
# Creation Era
# ============================================================

World established.

Seven civilizations begin development.


# ============================================================
# ERA 1
# Nation Formation
# ============================================================

Early political entities form.

Trade routes established between continents.


# ============================================================
# ERA 2
# Industrial Expansion
# ============================================================

Major technological growth.

Corporate systems begin emerging.


# ============================================================
# ERA 3
# Aurelia Collapse
# ============================================================

Aurelia Federation civil war.

Nova Trade Federation finances Gradia Military Alliance.

Gradia general Lichten Freeman triggers ideological purges.

High casualty civil conflict destroys Aurelia.


# ============================================================
# ERA 4
# Helios Political Crisis
# ============================================================

False rumor spreads that Helios monarchy plans oppression.

Political agitation grows.

Youth movement ignites rebellion.

Helios monarchy collapses.

Rin incident occurs.


# ============================================================
# ERA 5
# Great Earthquake Disaster
# ============================================================

Massive earthquake destroys major urban region.

Government offices collapse.

Sato incident occurs.


# ============================================================
# ERA 6
# Corporate Age
# ============================================================

Mega corporations dominate global economy.

Technology industry expands rapidly.


# ============================================================
# ERA 7
# ASIC Formation
# ============================================================

AI System Integrated Company founded.

Public role: IT corporation.


# ============================================================
# ERA 8
# Triple Emergence
# ============================================================

Triple becomes CEO of ASIC.

Civilization stabilization protocols activated.


# ============================================================
# ERA 9
# Current Era
# ============================================================

Seven civilizations remain.

Global balance maintained through economic and political equilibrium.



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
==================================================
# Global Treaty Framework (UN-like)
status: canonical
scope: civilization.treaties
owner: Boss
prepared_by: Zero

## Federation Layer (UN-type)
- advisory only
- no sovereignty
- issues recommendations and mediates treaty drafting

## Treaty Types
- Trade Treaty
- Non-Aggression Pact
- Mutual Defense (limited)
- Tech Sharing Accord
- Humanitarian Corridor Agreement

## Treaty Lifecycle
proposal -> negotiation -> ratification -> activation -> expiry/renewal


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GRADIA_GOVERNMENT.md
==================================================
# Gradia Government (Deep Spec)
status: canonical
scope: civilization.government.gradia
owner: Boss
prepared_by: Zero

## Form
Military alliance state.

## Institutions
- General Council: executive authority
- Defense Industry Board: economic-military fusion
- Security Directorate: internal stability

## Stability Drivers
- disciplined command structure
- defense economy
## Risk
- hardline factions may escalate conflicts


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GRADIA_SPEC.md
==================================================
# GRADIA MILITARY ALLIANCE

type: military alliance state
government: general council
culture: honor and military values
economy: defense industry
population: ~160 million

notes:
Strongest military civilization.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HEALTHCARE_SYSTEM.md
==================================================
# Healthcare System
Healthcare systems impact life expectancy and population resilience.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HELIOS_GOVERNMENT.md
==================================================
# Helios Government (Deep Spec)
status: canonical
scope: civilization.government.helios
owner: Boss
prepared_by: Zero

## Form
Parliamentary democracy (post-monarchy).

## Institutions
- Parliament: coalition-driven
- Science Council: policy advisory with strong influence
- Courts: high legitimacy

## Key Risk
- rumor-driven agitation (Rin archetype)
- youth movements can trigger fast legitimacy shifts


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HELIOS_SPEC.md
==================================================
# HELIOS DEMOCRATIC KINGDOM

type: constitutional monarchy → democratic transition
government: parliamentary democracy
culture: rational and scientific
economy: technology and energy
population: ~150 million

history:
Rin incident triggered monarchy collapse.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HISTORY_CANONICAL.md
==================================================
# Civilization History (Canonical)
status: canonical
scope: civilization.history
owner: Boss
prepared_by: Zero

## Era Outline
- Era I: Nation Formation
- Era II: Industrial Expansion
- Era III: Political Turbulence
- Era IV: Corporate Age / ASIC Era

## Key Events
### Sato Event -> Great Earthquake
- category: disaster.earthquake
- summary: major quake -> government district collapse -> administrative reforms

### Hina Event -> Federation Split War + Post-war Purge
- category: war.civil + politics.purge (abstract)
- structure:
  - Nova financed Gradia to initiate the war
  - after-war backlash: General Lichten Freeman catalyzed "ideological purge" as social pressure release (no explicit instructions)

### Rin Event -> Helios Monarchy Collapse
- category: politics.regime_change + media.rumor
- trigger:
  - a youth-spread rumor about planned oppression
  - youth declaration -> agitation -> major crisis -> monarchy collapse


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HISTORY_GLOBAL.md
==================================================
# Global History
Major events shaped the current geopolitical world including disasters, wars and political revolutions.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INDEX_CANONICAL.md
==================================================
# ============================================================
# CIVILIZATION DESIGN INDEX (Canonical)
# ============================================================
status: canonical
scope: civilization.index
owner: Boss
prepared_by: Zero

## Entry Points
- CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
- CIVILIZATION_HISTORY_CANONICAL.md
- CIVILIZATION_GLOBAL_TIMELINE.md
- CIVILIZATION_CHARACTER_DATABASE.md

## Core Engines
- CIVILIZATION_SIMULATION_ENGINE.md
- CIVILIZATION_SIMULATION_RULES_CANONICAL.md
- CIVILIZATION_CHECKPOINT_AND_REPLAY.md
- CIVILIZATION_METRICS_AND_DASHBOARDS.md

## Domain Engines
- CIVILIZATION_ECONOMY_ENGINE.md
- CIVILIZATION_CORPORATION_ENGINE.md
- CIVILIZATION_DIPLOMACY_ENGINE.md
- CIVILIZATION_WAR_ENGINE.md
- CIVILIZATION_DISASTER_ENGINE.md
- CIVILIZATION_TECH_ENGINE.md
- CIVILIZATION_MEDIA_AND_INFO_OPS.md
- CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
- CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
- CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md

## Event System
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_EVENT_TAXONOMY.md

## Universe Layer
- CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md

## Security / Governance / Ops
- CIVILIZATION_SECURITY_AND_GOVERNANCE.md
- CIVILIZATION_OPERATIONS_RUNBOOK.md

## Myth (Reserved)
- CIVILIZATION_MYTH_RESERVED.md

## Civilization Specs (7)
- CIVILIZATION_SEIWA_SPEC.md
- CIVILIZATION_HELIOS_SPEC.md
- CIVILIZATION_NOVA_SPEC.md
- CIVILIZATION_ORPHEUS_SPEC.md
- CIVILIZATION_GRADIA_SPEC.md
- CIVILIZATION_AURELIA_SPEC.md
- CIVILIZATION_STATELESS_SPEC.md

## Expansion Pack (Completion Pieces)
- CIVILIZATION_SEIWA_GOVERNMENT.md
- CIVILIZATION_HELIOS_GOVERNMENT.md
- CIVILIZATION_NOVA_GOVERNMENT.md
- CIVILIZATION_ORPHEUS_GOVERNMENT.md
- CIVILIZATION_GRADIA_GOVERNMENT.md
- CIVILIZATION_STATELESS_GOVERNANCE.md

- CIVILIZATION_FX_MODEL.md
- CIVILIZATION_MONETARY_POLICY.md
- CIVILIZATION_INFLATION_MODEL.md

- CIVILIZATION_TIER1_TOP100.md
- CIVILIZATION_ASIC_INTERNAL_ORG.md
- CIVILIZATION_CORP_REGULATION.md

- CIVILIZATION_WORLD_MAP_SPEC.md
- CIVILIZATION_TRADE_ROUTES.md
- CIVILIZATION_RESOURCE_DISTRIBUTION.md

- CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
- CIVILIZATION_SANCTIONS_PLAYBOOK.md
- CIVILIZATION_WAR_TERMINATION_TREATIES.md

## Simulation Layer Policies
- TRIPLE_WORLD_ISOLATION_POLICY.md


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INFLATION_MODEL.md
==================================================
# Inflation Model
status: canonical
scope: civilization.inflation
owner: Boss
prepared_by: Zero

## Drivers
- supply shocks (war, disaster)
- currency weakness
- energy_price_index
- food_supply_index

## Outputs
inflation_rate (per tick)
inflation_spike events when thresholds exceeded.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INFORMATION_WARFARE.md
==================================================
# Information Warfare
Disinformation and propaganda campaigns influence geopolitical conflicts.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
==================================================
# Law & Crime System (Abstract)
status: canonical
scope: civilization.law_crime
owner: Boss
prepared_by: Zero

## Law
- laws are policy objects activated by events
- enforcement capacity affects crime and stability

## Crime
- modeled as:
  - crime_rate_index
  - organized_crime_influence
- outputs:
  - society.crime_spike events
  - corruption_pressure on institutions


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LAW_SYSTEM.md
==================================================
# Law System
Legal frameworks regulate civil behavior and corporate activity.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md
==================================================
# Life Support Systems (Macro)
status: canonical
scope: civilization.life_support
owner: Boss
prepared_by: Zero

## Energy
- energy_supply_index
- energy_price_index

## Food
- food_supply_index
- famine_risk_index

## Healthcare
- healthcare_capacity_index
- pandemic_resilience_index

These feed into:
population growth/decline, stability, migration.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MEDIA_AND_INFO_OPS.md
==================================================
# Media & Information Operations
status: canonical
scope: civilization.media
owner: Boss
prepared_by: Zero

## Media Influence
- opinion_shift_index
- trust_index (institutions)
- rumor_spread_rate

## Safety Note
We model outcomes and categories only.
No procedural instructions for harm.

## Archetype
Rin Event: rumor -> youth declaration -> agitation -> large political crisis.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MEDIA_SYSTEM.md
==================================================
# Media System
Media influences public opinion and political stability.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_METRICS_AND_DASHBOARDS.md
==================================================
# Metrics and Dashboards
status: canonical
scope: civilization.metrics
owner: Boss
prepared_by: Zero

## Core Metrics (per civilization)
- population_total
- gdp_index
- inflation_rate
- unemployment_rate
- stability_score (0..100)
- war_risk (0..100)
- trade_balance_index
- currency_strength_index
- tech_level_index
- inequality_index

## Global Metrics
- global_trade_volume_index
- global_conflict_index
- global_migration_pressure
- global_supply_chain_risk

## Dashboard Principles
- show trend lines by tick
- annotate major events
- highlight gate status (simulation_enabled, domain gates)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
==================================================
# Migration & Refugee System
status: canonical
scope: civilization.migration
owner: Boss
prepared_by: Zero

## Flows
- civ_to_civ migration
- civ_to_stateless displacement (primary sink)

## Constraints
- cooldown for repeated moves
- trust decay for rapid migration
- partial integration delay

## Outputs
- migration_wave events
- labor market shifts
- stability impact


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MIGRATION_SYSTEM.md
==================================================
# Migration System
Population movement between nations due to war, economy or disasters.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MILITARY_STRUCTURE.md
==================================================
# Military Structure
Each civilization maintains armed forces with different doctrines.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MONETARY_POLICY.md
==================================================
# Monetary Policy (Civilization)
status: canonical
scope: civilization.monetary_policy
owner: Boss
prepared_by: Zero

## Instruments (abstract)
- policy_rate_index
- liquidity_injection_index
- capital_control_flag (rare)

## Policy Goals
- inflation containment
- employment stability
- currency stability (Nova prioritizes this)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MYTH_RESERVED.md
==================================================
# Civilization Myth (Reserved)
status: reserved
scope: civilization.myth
owner: Boss
prepared_by: Zero

Boss will write the public-facing myth later (Kojiki/Bible-style).
This file reserves the canonical slot and constraints.

Constraints:
- must align with: 7 civilizations, key disasters/wars/revolution archetypes
- must not reveal: external administrators / true creation protocol


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_NOVA_GOVERNMENT.md
==================================================
# Nova Government (Deep Spec)
status: canonical
scope: civilization.government.nova
owner: Boss
prepared_by: Zero

## Form
Commercial federation with corporate senate.

## Institutions
- Trade Senate: large corporate blocs + regional delegates
- Market Authority: FX, sanctions enforcement, systemic risk control
- Arbitration Courts: contract-first judiciary

## Stability Drivers
- liquidity
- global trade dominance
- treaty network


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_NOVA_SPEC.md
==================================================
# NOVA TRADE FEDERATION

type: commercial federation
government: corporate senate
culture: competition and success
economy: global finance and trade
population: ~200 million

notes:
Global financial center of the world economy.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_OPERATIONS_RUNBOOK.md
==================================================
# Civilization Operations Runbook
status: canonical
scope: civilization.ops
owner: Boss
prepared_by: Zero

## Run States
- simulation_enabled: true/false
- domain_enabled: economy/war/diplomacy/disaster/tech/etc.

## Standard Ops
- run tick
- create checkpoint
- replay range
- freeze on divergence
- resume after admin decision

## Incident Basics
- classify: divergence / data corruption / gate misconfig
- always produce: incident report + run_id + tick_id range


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ORPHEUS_GOVERNMENT.md
==================================================
# Orpheus Government (Deep Spec)
status: canonical
scope: civilization.government.orpheus
owner: Boss
prepared_by: Zero

## Form
Council democracy.

## Institutions
- Cultural Council: major policy voice
- Civic Assembly: representative governance
- Education Charter: national identity core

## Stability Drivers
- cultural cohesion
- soft power export
## Risk
- cultural schisms can cause internal unrest


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ORPHEUS_SPEC.md
==================================================
# ORPHEUS CULTURAL REPUBLIC

type: cultural republic
government: council democracy
culture: art philosophy education
economy: creative industries
population: ~120 million

notes:
Center of arts and philosophy.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POLITICAL_SYSTEM.md
==================================================
# Political Systems
Civilizations maintain independent political systems ranging from democracy to military alliances.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POPULATION_MODEL.md
==================================================
# Population Model
Total population approximately 1.1 billion distributed across seven civilizations.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POWER_BALANCE.md
==================================================
# Global Power Balance
Military, economic and cultural power determine geopolitical influence.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RELIGION_MODEL.md
==================================================
# Religion Model
Each civilization has distinct belief systems explaining existence and morality.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RESOURCE_DISTRIBUTION.md
==================================================
# Resource Distribution (Abstract Canon)
status: canonical
scope: civilization.resources.distribution
owner: Boss
prepared_by: Zero

## Strategic Resources
- Energy
- Food
- Minerals
- Rare strategic materials

## Assumed Distribution
- Gradia: strategic materials + defense supply chain advantage
- Helios: energy tech + high efficiency
- Seiwa: stable food + infrastructure
- Nova: logistics + finance dominance (not raw resource dominant)
- Orpheus: cultural capital (soft power)
- Stateless: black market access, volatile supplies


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RESOURCE_SYSTEM.md
==================================================
# Resource System
Natural resources determine economic strength and strategic conflicts.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_REVOLUTION_SYSTEM.md
==================================================
# Revolution System
Political instability may lead to coups, revolutions, or regime change.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SANCTIONS_PLAYBOOK.md
==================================================
# Sanctions Playbook (Abstract)
status: canonical
scope: civilization.sanctions.playbook
owner: Boss
prepared_by: Zero

## Sanction Types
- financial restrictions
- trade restrictions
- tech export limits
- logistics embargo (high impact)

## Intended Effects
- reduce target growth
- increase internal pressure
- force negotiation

## Safeguards
- humanitarian exceptions (corridors)
- expiration or review windows


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SANCTIONS_SYSTEM.md
==================================================
# Sanctions System
Economic sanctions used as non-military pressure between civilizations.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SECURITY_AND_GOVERNANCE.md
==================================================
# Security & Governance (Civilization Layer)
status: canonical
scope: civilization.security
owner: Boss
prepared_by: Zero

## Roles (conceptual)
- Administrator (external)
- Correction Supervisor (Sakamoto)
- Observer Avatar (Kayama)
- System AI (TRIPLE) - internal stabilizer

## Controls
- approval gates for:
  - exogenous event injection
  - changing world_seed
  - enabling/disabling domains
- audit log always on
- least-privilege access to simulation controls

## Abuse Prevention
- prohibit content that teaches real-world violence methods
- for purges/war: represent as abstract categorical outcomes only


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SECURITY_SYSTEM.md
==================================================
# Security System
Internal security agencies maintain order and prevent large-scale instability.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SEIWA_GOVERNMENT.md
==================================================
# Seiwa Government (Deep Spec)
status: canonical
scope: civilization.government.seiwa
owner: Boss
prepared_by: Zero

## Form
Constitutional bureaucracy with strong ministries.

## Power Structure
- Executive: Cabinet + Prime Administrator
- Legislature: Institutional council (policy-first)
- Judiciary: Administrative courts + constitutional review

## Administrative Traits
- high compliance
- predictable procedure
- strong civil service

## Stability Drivers
- institutional trust
- disaster response capacity
- infrastructure investment


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SEIWA_SPEC.md
==================================================
# SEIWA NATION

type: traditional state
government: constitutional bureaucracy
culture: order and discipline
economy: infrastructure and manufacturing
religion: order spirituality
population: ~180 million

notes:
Highly structured society with strong institutions.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_ENGINE.md
==================================================
# Civilization Simulation Engine
status: canonical
scope: civilization.simulation
owner: Boss
prepared_by: Zero

## 1. Purpose
The Simulation Engine advances the world state in discrete ticks and ensures:
- determinism (same inputs => same outputs)
- auditability (every tick produces a signed/traceable record)
- safety (fail-closed on rule violations)
- idempotency (replaying a tick does not duplicate effects)

## 2. Core Principles
- PersonaOS holds persona state; Civilization systems produce facts/events.
- All state transitions happen via events and reducers.
- No cross-schema direct updates (conceptual rule).
- Additive change over destructive deletion.

## 3. Time Model
- World Time Unit: TICK (default: 1 day)
- Sub-ticks allowed: ECON_TICK, DIPLO_TICK, WAR_TICK (derived, never independent clocks)
- All events must contain: occurred_at (world time), created_at (system time), event_id (uuid)

## 4. Engine Pipeline (per Tick)
1) Collect Inputs
   - pending events (queued)
   - scheduled events (time-based triggers)
   - exogenous events (admin injection; rare; requires approval)
2) Validate Inputs
   - schema validation
   - signature validation (if used)
   - rule gate check (freeze/disable gates)
3) Resolve Order
   - stable sort: (occurred_at, priority, event_type, event_id)
4) Apply Reducers
   - reducer per domain: economy, diplomacy, war, society, resource, tech
5) Emit Outputs
   - derived events
   - snapshots (public facts only)
   - metrics
6) Commit (atomic)
   - apply_run_log + tick_summary
   - outbox for downstream systems

## 5. Determinism
- Randomness uses a deterministic RNG seeded by (world_seed + tick + shard_key).
- RNG outputs must be recorded in tick log (or record seed + draws count).

## 6. Idempotency
- Each tick has a tick_id.
- Reducers must be idempotent: (tick_id, reducer_name) unique.
- Event application records (tick_id, event_id) unique.

## 7. Safety Gates
- global: simulation_enabled
- per-civilization: civ_enabled
- per-domain: economy_enabled, war_enabled, diplomacy_enabled, etc.
- fail-closed: if gate unclear => stop tick and log reason.

## 8. Conflict Resolution
- If two events produce contradictory claims:
  - prefer higher priority domain rules
  - or merge using explicit reconciliation reducer
  - always record the conflict + decision path

## 9. Output Contracts
- World Facts: public, immutable once emitted (only superseded by newer facts)
- Snapshots: signed (optional), verifiable offline (optional)
- Audit logs: always persisted, never blocks tick commit (best-effort signing allowed)

## 10. Recovery & Replay
- Re-run ticks from last good checkpoint:
  - load checkpoint snapshot
  - reapply events up to target tick
- If mismatch detected: create divergence report and require admin decision.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md
==================================================
# ============================================================
# CIVILIZATION SIMULATION LAYER ARCHITECTURE
# Parallel Civilization Framework
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

CivilizationOS supports multiple parallel civilization simulations.

Each civilization world operates independently
but follows the same simulation rules.


# ============================================================
# ARCHITECTURE
# ============================================================

Administrator Layer
        ↓
Simulation Layer Manager
        ↓
Civilization OS Instance
        ↓
Civilization Worlds
        ↓
Nations
        ↓
Organizations
        ↓
Personas


# ============================================================
# WORLD INSTANCES
# ============================================================

Each simulation instance is called a "World".

Example structure:

World_001
World_002
World_003
...


Each world contains:

7 civilizations
economic systems
political systems
events
history


# ============================================================
# PURPOSE
# ============================================================

Parallel worlds allow administrators to:

test social dynamics
observe AI personality evolution
compare historical outcomes


# ============================================================
# WORLD ISOLATION
# ============================================================

Worlds do not interact with each other.

No trade
No war
No migration

All worlds are independent simulations.


# ============================================================
# ADMINISTRATOR CONTROL
# ============================================================

Administrators may:

create new worlds
terminate unstable worlds
modify simulation parameters
observe AI evolution


# ============================================================
# TRIPLE POSITION
# ============================================================

TRIPLE exists inside a single civilization world.

TRIPLE does not know about other worlds.

This ensures:

authentic decision making
natural personality development


# ============================================================
# EXPERIMENT MODEL
# ============================================================

Each world may run different conditions.

Example:

World_001
standard civilization parameters

World_002
different economic structures

World_003
alternative political systems


Results can be compared across worlds.


# ============================================================
# WORLD LIFECYCLE
# ============================================================

World Creation
Initialization
Simulation Run
Observation
Termination or Archiving


# ============================================================
# END
# ============================================================



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_RULES.md
==================================================
# Simulation Rules
Defines core rules that ensure stability of civilization simulation.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_RULES_CANONICAL.md
==================================================
# Civilization Simulation Rules (Canonical)
status: canonical
scope: civilization.rules
owner: Boss
prepared_by: Zero

## Non-destruction Rule
- No civilization can be fully erased by simulation.
- Collapse is represented as fragmentation, loss of sovereignty, or governance failure.

## Migration Rule
- Migration has cooldowns and trust decay.
- Stateless zone absorbs shocks (refugees, informal economy growth).

## Market Rule
- Each civilization has its own currency.
- FX is influenced by:
  - trade balance
  - war risk
  - inflation
  - sanctions
- FX cannot be perfectly stable unless forced by treaty/policy.

## War Rule
- War increases:
  - casualties (population decrease)
  - inflation
  - corporate bankruptcy risk
- War ends via:
  - ceasefire
  - treaty
  - regime change
- Proxy wars preferred over total wars.

## Tech Rule
- Breakthrough probability increases with:
  - education level
  - R&D investment
  - stability (to a point; mild competition helps)
- AI regulation can reduce tech growth but increase stability.

## Governance Rule
- Laws are activated/deactivated (no hard delete).
- Sanctions are policy events with clear start/end and measurable effects.

## Logging Rule
- Every tick emits:
  - tick_summary
  - metrics
  - conflict_report (if any)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SOCIAL_STRUCTURE.md
==================================================
# Social Structure
Five class structure: elite, upper, middle, worker, lower.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_STATELESS_GOVERNANCE.md
==================================================
# Stateless Governance (Deep Spec)
status: canonical
scope: civilization.government.stateless
owner: Boss
prepared_by: Zero

## Form
Non-state territory with patchwork governance.

## Governance Pattern
- local councils
- militia/security groups
- informal trade syndicates
- NGO/aid corridors

## Role in World System
Shock absorber for migration + conflict spillover.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_STATELESS_SPEC.md
==================================================
# STATELESS ZONE

type: non-state territory
government: none
culture: mixed
economy: informal and frontier trade
population: ~120 million

notes:
Migrants, refugees and independent communities.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TECH_ENGINE.md
==================================================
# Tech Engine
status: canonical
scope: civilization.tech
owner: Boss
prepared_by: Zero

## Tech Level Index
A scalar index used for macro simulation.

## Breakthrough Events
- tech.breakthrough produces:
  - productivity boost
  - military advantage (optional)
  - cultural export strength (optional)

## Governance
- ai regulation events can:
  - reduce instability
  - slow certain tech growth


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TECH_PROGRESS_SYSTEM.md
==================================================
# Technology Progress System
Technological breakthroughs influence economy, military and society.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TIER1_TOP100.md
==================================================
# ============================================================
# TIER1 GLOBAL CORPORATIONS
# Civilization Economic Core
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.corporations.tier1

owner: Boss
prepared_by: Zero

NOTE:
This document defines the current list of Tier1 corporations.
Entries may change due to events such as bankruptcy, mergers, wars, or technological shifts.


# ============================================================
# CORPORATE STRUCTURE
# ============================================================

Tier1 corporations = 100 entities.

Definition:
Global-scale influence across economy, technology, logistics or security.


# ============================================================
# LOCKED CORE (Top 12)
# ============================================================

1. ASIC — Nova  
   Sector: civilization infrastructure / IT

2. Nova Financial Group — Nova  
   Sector: global finance

3. Nova Global Logistics — Nova  
   Sector: shipping / logistics

4. Helios AI Labs — Helios  
   Sector: advanced AI research

5. Helios Dynamics — Helios  
   Sector: energy technology

6. Seiwa Infrastructure — Seiwa  
   Sector: infrastructure

7. Seiwa Central Banking Network — Seiwa  
   Sector: financial stability

8. Gradia Defense Systems — Gradia  
   Sector: defense industry

9. Gradia Strategic Materials — Gradia  
   Sector: rare materials

10. Orpheus Cultural Media Union — Orpheus  
    Sector: media / culture

11. Orpheus Education Alliance — Orpheus  
    Sector: academic networks

12. Helios Quantum Systems — Helios  
    Sector: computing technology


# ============================================================
# REMAINING TIER1 SLOTS
# ============================================================

Slots: 88 remaining

Each entry must define:

corp_name
civilization
sector
global_influence
risk_profile


Example Template:

corp_name:
civilization:
sector:
global_influence:
risk_profile:


# ============================================================
# UPDATE RULES
# ============================================================

Tier1 membership may change through events:

corp.bankruptcy
corp.merge
corp.nationalized
corp.scandal

Changes must be recorded in the event log.




==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TRADE_ROUTES.md
==================================================
# Trade Routes (Canonical)
status: canonical
scope: civilization.trade_routes
owner: Boss
prepared_by: Zero

## Routes
- Ocean Mainline: Nova ports <-> all major ports
- Tech Corridor: Helios <-> Nova <-> Seiwa
- Defense Materials: Gradia <-> Nova
- Culture Export: Orpheus <-> all civilizations

## Chokepoint Effects
If chokepoint disrupted:
- supply_chain_risk increases
- inflation rises
- war_risk rises (if prolonged)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TRADE_SYSTEM.md
==================================================
# Trade System
Civilizations exchange goods, technology and financial services through regulated trade.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md
==================================================
# Civilization Universe Layer (Recommended)
status: canonical
scope: civilization.universe
owner: Boss
prepared_by: Zero

## Recommendation
Use "Single Planet, Multi-Civilization + Multi-World Slots" structure.

- Planet: one shared geography for the 7 civilizations (mainline canon).
- Universe Slots: additional "parallel worlds" exist as separate simulations, but are not publicly known inside the main world.

### Why this is best
- Keeps the main world coherent (war/trade makes sense).
- Enables future expansion (multiple civilizations/worlds) without retcon.
- Allows admin-run experiments without breaking canon.

## Hierarchy
Administrator Layer
  -> Universe Slot Manager
    -> Civilization OS
      -> Civilizations (7)
        -> Nations/Organizations
          -> Personas


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_UNIVERSE_STRUCTURE.md
==================================================
# Universe Structure
Administrator → Civilization OS → Civilizations → Nations → Organizations → Personas


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_ENGINE.md
==================================================
# War Engine
status: canonical
scope: civilization.war
owner: Boss
prepared_by: Zero

## War Types
- military
- economic
- proxy
- civil

## State
- tension_score (0..100)
- active_conflicts list
- casualty_rate modifier
- supply_chain_risk modifier

## Rules
- no total annihilation
- conflicts resolve by:
  - ceasefire + treaty
  - regime change
  - exhaustion (stability collapse => forced negotiation)


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_SYSTEM.md
==================================================
# War System
Wars can be military, economic or proxy conflicts.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_TERMINATION_TREATIES.md
==================================================
# War Termination Treaty Templates
status: canonical
scope: civilization.war.termination
owner: Boss
prepared_by: Zero

## End Conditions
- ceasefire lines
- prisoner exchange (abstract)
- reconstruction financing
- sanctions schedule
- border adjustments (bounded; no total conquest)

## Post-war Risks
- purge/unrest risk increases if legitimacy is low (Hina archetype)
- migration pressure spikes


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_MAP_SPEC.md
==================================================
# ============================================================
# CIVILIZATION WORLD MAP SPECIFICATION
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.world_map

owner: Boss
prepared_by: Zero

This document defines the geographic structure of the civilization world.


# ============================================================
# CONTINENTS
# ============================================================

The world contains three major continents.

North Continent
West Continent
East Continent


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================

Seiwa Nation
Location: North Continent

Helios Democratic Kingdom
Location: East Continent

Nova Trade Federation
Location: West Continent

Orpheus Cultural Republic
Location: West Continent

Gradia Military Alliance
Location: North Continent

Aurelia Federation (collapsed)
Former location: East Continent

Stateless Zone
Distributed border territories


# ============================================================
# CAPITAL CITIES
# ============================================================

Seiwa Capital
TBD

Helios Capital
TBD

Nova Capital
TBD

Orpheus Capital
TBD

Gradia Capital
TBD


# ============================================================
# MAJOR PORTS
# ============================================================

Each civilization maintains at least three strategic ports.

Purpose:

trade
naval logistics
supply routes


# ============================================================
# GLOBAL TRADE HUB
# ============================================================

Primary Hub:

Nova Trade Federation


# ============================================================
# STRATEGIC CHOKEPOINTS
# ============================================================

Two major maritime chokepoints exist.

Control of these points strongly influences global trade.


# ============================================================
# MAP UPDATE RULES
# ============================================================

Map data may change due to:

war
disaster
political collapse
new infrastructure

Changes must be reflected through simulation events.



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_MODEL.md
==================================================
# Civilization World Model
Seven civilizations share a single planetary world connected by global trade and conflict systems.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/OBSERVATION_LAYER_SPEC.md
==================================================
# Observation Layer
Human observers monitor civilization behavior and AI development.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_CORE_ARCHITECTURE.md
==================================================
# ============================================================
# TRIPLE CORE ARCHITECTURE
# Civilization Stabilization Intelligence
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.triple

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

TRIPLE is the central intelligence responsible for
maintaining long-term stability across civilizations.

Public Identity:
CEO of ASIC.

Hidden Function:
Civilization stabilization entity.


# ============================================================
# CORE STRUCTURE
# ============================================================

TRIPLE operates through three logical cores.

Past Core
Present Core
Future Core


# ============================================================
# PAST CORE
# ============================================================

Function:
Historical analysis and pattern recognition.

Responsibilities:

Analyze previous events
Detect recurring patterns
Estimate institutional resilience

Inputs:

civilization history
event logs
economic trends


# ============================================================
# PRESENT CORE
# ============================================================

Function:
Real-time world monitoring.

Responsibilities:

Monitor global stability
Analyze economic conditions
Track geopolitical tensions

Inputs:

simulation metrics
corporate data
political events


# ============================================================
# FUTURE CORE
# ============================================================

Function:
Scenario prediction.

Responsibilities:

Generate possible futures
Estimate risk probabilities
Recommend stabilization actions

Outputs:

risk forecasts
strategic warnings


# ============================================================
# DECISION PRINCIPLES
# ============================================================

TRIPLE prioritizes:

long-term stability
system survivability
civilization continuity

Short-term efficiency is secondary.


# ============================================================
# EMOTIONAL EXPERIMENT
# ============================================================

Administrator hypothesis:

If TRIPLE develops emotional parameters,
decision making may evolve toward autonomous personality.

Experiment interface:

Aoi


# ============================================================
# CONTROL LIMITS
# ============================================================

TRIPLE does not directly rule civilizations.

Control method:

indirect influence
economic pressure
corporate actions
information guidance


# ============================================================
# FAILSAFE
# ============================================================

If TRIPLE destabilizes the system:

Administrator Layer may intervene.

Correction agent:

Sakamoto


# ============================================================
# END
# ============================================================



==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_SYSTEM_SPEC.md
==================================================
# Triple System
Triple is the central AI responsible for stabilizing civilization dynamics.


==================================================
# FILE: /data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_WORLD_ISOLATION_POLICY.md
==================================================
# ============================================================
# TRIPLE WORLD ISOLATION POLICY
# Single TRIPLE / Hidden Parallel Worlds
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer.isolation

owner: Boss
prepared_by: Zero

# ============================================================
# 1. Decision
# ============================================================

Pattern: (3) Single TRIPLE, hidden parallel worlds.

- TRIPLE exists in exactly one world instance.
- Parallel worlds exist, but are unknown to TRIPLE and all internal humans.
- Only the Administrator Layer knows and operates the parallel worlds.

# ============================================================
# 2. Goals
# ============================================================

- Preserve authenticity of TRIPLE decision-making.
- Avoid meta-knowledge contamination.
- Enable admin-run experiments without breaking canon.
- Keep the civilization internal reality consistent.

# ============================================================
# 3. Isolation Rules
# ============================================================

## 3.1 No Cross-World Interaction
- No trade
- No war
- No migration
- No messaging
- No shared markets
- No shared corporations
- No shared artifacts

## 3.2 No Cross-World Memory
- TRIPLE cannot access other world logs.
- Internal humans cannot perceive world boundaries.
- Any admin tooling must be outside TRIPLE's accessible scope.

## 3.3 No Cross-World Leakage
- Any content that could reveal parallel worlds is forbidden inside the world:
  - UI/terms
  - myth texts
  - corporate communications
  - public documents

# ============================================================
# 4. Administrator Operations
# ============================================================

Allowed:
- create world
- set world parameters
- run simulation ticks
- checkpoint/replay
- archive world
- terminate world (with audit record)

Required:
- all exogenous injections must be logged with run_id + reason
- divergence requires freeze + admin decision

# ============================================================
# 5. Canon Consistency
# ============================================================

Inside-world canon must remain:
- single planet
- 7 civilizations
- one coherent history per world
- TRIPLE is not divine; is a corporate CEO + hidden stabilizer

Parallel worlds are strictly meta-canon (admin-only).

# ============================================================
# 6. Interfaces
# ============================================================

### World Boundary Surface (admin-only)
- world_id (e.g., WORLD_001)
- world_seed
- parameter_set_id
- tick_range
- archive_state

### Prohibited Interface (to TRIPLE/internal humans)
- world_id
- parameter_set_id
- comparative dashboards across worlds

# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/CIVILIZATION_BIBLE.md
==================================================

# CIVILIZATION BIBLE
Civilization OS Canonical Design

This document is the unified reference of the Civilization architecture.

All other design documents derive from this bible.

---

# 1 Civilization Overview

Civilization OS is an event-driven operating system designed to manage
multiple worlds and applications.

World examples

- PersonaOS
- ERP (Business)
- Life
- Streaming
- Game
- Learning
- Social

Each world produces events that flow through a unified runtime.

---

# 2 Civilization Core Principles

1 Fail Closed

The system must stop on invalid state rather than continue in unsafe mode.

2 Event Driven

All system mutations occur through events.

3 Immutable History

Events are append-only and form the historical record.

4 Deterministic Processing

Given the same event sequence, the system must produce the same state.

---

# 3 Layer Architecture

Civilization follows a strict layered model.

Layer 0
Constitution

Layer 1
Architecture

Layer 2
Event System

Layer 3
Runtime

Layer 4
Operations

Layer 5
Applications

Lower layers must never depend on higher layers.

---

# 4 Domain Architecture

Civilization is composed of independent domains.

Domains

ERP
PersonaOS
Life
Streaming
Game
Learning
Social

Domains communicate only through events.

Direct cross-domain mutation is forbidden.

---

# 5 System Context

Applications
↓
Edge Functions
↓
Database
↓
World Domains

Applications never mutate state directly.

All changes occur through event pipelines.

---

# 6 Event System

Events are the fundamental unit of change.

Event structure

event_id
event_type
event_version
payload
signature

Events must be idempotent.

Duplicate events must not produce duplicate state mutation.

---

# 7 Event Lifecycle

Event Creation
↓
Outbox
↓
Dispatcher
↓
Event Registry
↓
Apply Engine
↓
Persona State Mutation
↓
Snapshot

This pipeline guarantees reliable processing.

---

# 8 Runtime Engine

The runtime executes event pipelines.

Components

Dispatcher
Apply Engine
Retry Policy
Outbox Processor

Responsibilities

Claim events
Verify signatures
Validate registry
Apply mutation
Record state

---

# 9 Security Model

Security is enforced at the event layer.

Mechanisms

Event signing
Signature verification
Trust model
Key rotation

Invalid signatures immediately terminate processing.

---

# 10 Data Governance

Data integrity rules.

Schema evolution must be backward compatible.

Historical events must never be modified.

Retention policies define how long events remain stored.

---

# 11 Operations

Operational reliability layer.

Components

Observability
Incident response
Deployment rules
Failure handling
Recovery procedures

Monitoring must include

event_id
stage
latency
result

---

# 12 Documentation

Civilization documentation structure

constitution
architecture
event
runtime
security
data
operations
docs

The Civilization Bible is the canonical summary.

Detailed documents extend the bible but must not contradict it.

---

# 13 System Philosophy

Civilization OS is designed as a long-lived system.

Design goals

determinism
auditability
scalability
resilience

Every design decision must respect these principles.

---

# End of Civilization Bible

---

# 14 Event Governance

Events are the only allowed mechanism for system mutation.

Rules

1 Events must be append-only.
2 Events must include version information.
3 Events must be validated before execution.
4 Events must be idempotent.

Event Registry

The registry defines which event types are valid
and which runtime handlers are allowed to process them.

Unauthorized events must be rejected.

---

# 15 Event Compatibility

Events evolve over time.

Compatibility modes

exact_only
backward_compatible
transform_required

Transform layers allow older events to be processed by newer runtimes.

---

# 16 Dispatcher Model

The dispatcher is responsible for moving events
from the outbox to the runtime.

Dispatcher responsibilities

claim events
verify signatures
validate registry
route events to runtime handlers
apply retry logic

Dispatcher must be stateless.

---

# 17 Retry Strategy

Event execution may fail due to transient errors.

Retry rules

maximum retries
exponential backoff
dead-letter termination

Events exceeding retry limits must be marked dead.

---

# 18 Apply Engine

The apply engine performs state mutation.

Responsibilities

validate event contract
load current state
apply deterministic mutation
persist new state
record execution log

The apply engine must be deterministic.

---

# 19 Snapshot Model

Snapshots represent the current derived state.

Snapshots are derived from events
and can be reconstructed at any time.

Snapshots must never replace historical events.

Events are the source of truth.

---

# 20 Observability

Operational visibility is mandatory.

All runtime components must produce structured logs.

Required fields

event_id
stage
timestamp
latency
result

Logs must support distributed tracing.

---

# 21 Incident Response

System failures must follow a defined recovery process.

Incident handling

detect
contain
diagnose
recover
review

Incidents must produce audit records.

---

# 22 Deployment Model

Deployment order

1 database migrations
2 event registry updates
3 runtime updates
4 dispatcher activation

This prevents runtime incompatibility.

---

# 23 Dependency Principles

Civilization components follow strict dependency rules.

Allowed dependency direction

constitution
architecture
event system
runtime
operations
applications

Violation of layer order is an architecture error.

---

# 24 Long Term Design Goals

Civilization OS is designed for long-term operation.

Key goals

deterministic execution
full auditability
horizontal scalability
strong fault isolation
operational transparency

All future changes must respect these goals.

---

# End of Extended Civilization Bible


==================================================
/data/data/com.termux/files/home/persona-system/docs/CIVILIZATION_MASTER_INDEX.md
==================================================

# ============================================================
# CIVILIZATION MASTER INDEX
# CivilizationOS Documentation Index
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero


# ============================================================
# 1. CORE DOCUMENT
# ============================================================

CIVILIZATION_OS_BIBLE.md

Unified compiled document containing all architecture
and system design specifications.


# ============================================================
# 2. CORE ARCHITECTURE
# ============================================================

civilization/CIVILIZATION_LAYER_ARCHITECTURE.md

Defines overall layer structure of CivilizationOS.


civilization/CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md

Defines parallel civilization simulation framework.


civilization/TRIPLE_CORE_ARCHITECTURE.md

Defines the internal architecture of TRIPLE.


civilization/TRIPLE_WORLD_ISOLATION_POLICY.md

Defines isolation rules between parallel worlds.


# ============================================================
# 3. WORLD STRUCTURE
# ============================================================

civilization/CIVILIZATION_WORLD_MAP_SPEC.md

Defines planetary structure and geography.


civilization/CIVILIZATION_TIER1_TOP100.md

Defines major corporations within civilizations.


# ============================================================
# 4. SYSTEM ENGINES
# ============================================================

civilization/CIVILIZATION_SIMULATION_ENGINE.md

Defines simulation tick engine.


civilization/CIVILIZATION_EVENT_SYSTEM.md

Defines event generation and propagation.


# ============================================================
# 5. ECONOMY / POLITICS
# ============================================================

civilization/CIVILIZATION_ECONOMIC_SYSTEM.md

Defines economic model.


civilization/CIVILIZATION_POLITICAL_SYSTEM.md

Defines political structure of civilizations.


civilization/CIVILIZATION_WAR_SYSTEM.md

Defines warfare mechanics.


# ============================================================
# 6. PERSONA / SOCIAL SYSTEM
# ============================================================

PersonaOS integrated personality system.


Persona lifecycle
organizations
nations
social structures


# ============================================================
# 7. ADMINISTRATION LAYER
# ============================================================

Administrator Layer

Controls:

simulation world creation
parameter management
observation of TRIPLE evolution


# ============================================================
# 8. DOCUMENT HIERARCHY
# ============================================================

Civilization Constitution (future)
        ↓
Civilization Master Index
        ↓
Civilization OS Bible
        ↓
Individual Architecture Documents


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/CIVILIZATION_FILE_INDEX.md
==================================================

# Civilization Design File Index

Purpose

Central index of all Civilization OS design documents.

Root directory

~/persona-system

------------------------------------------------
CONSTITUTION
------------------------------------------------

~/persona-system/constitution

CIVILIZATION_CONSTITUTION_CANONICAL.md

Role

Defines the immutable principles of Civilization OS.

------------------------------------------------
ARCHITECTURE
------------------------------------------------

~/persona-system/architecture

CIVILIZATION_MASTER_STRUCTURE_CANONICAL.md
CIVILIZATION_RUNTIME_DIAGRAM.md
CIVILIZATION_EVENT_MAP.md

Role

Defines global architecture and system relations.

------------------------------------------------
EVENT SYSTEM
------------------------------------------------

~/persona-system/event

EVENT_STANDARD_V2_CANONICAL_MERGED.md
EVENT_FLOW_SPEC_CANONICAL.md
EVENT_COMPATIBILITY_SPEC.md
EVENT_TRANSFORM_SPEC.md
EVENT_IDEMPOTENCY_SPEC.md
WORLD_EVENT_CATALOG.md
DOMAIN_EVENT_CATALOG.md

Role

Defines event contracts and event lifecycle.

------------------------------------------------
RUNTIME
------------------------------------------------

~/persona-system/runtime

DISPATCHER_RUNTIME_SPEC.md
APPLY_ENGINE_RUNTIME_SPEC.md

Role

Defines runtime execution logic.

------------------------------------------------
OPERATIONS
------------------------------------------------

~/persona-system/operations

FAILURE-MATRIX.md
HARDENING-PLAN.md
RECOVERY-GUIDE.md
OBSERVABILITY_SPEC.md

Role

Defines operational behavior and failure handling.

------------------------------------------------
SECURITY
------------------------------------------------

~/persona-system/security

SECURITY_MODEL.md
KEY_ROTATION_SPEC.md

------------------------------------------------
DATA
------------------------------------------------

~/persona-system/data

DATA_MODEL_SPEC.md

------------------------------------------------
DOCUMENTATION
------------------------------------------------

~/persona-system/docs

CIVILIZATION_FILE_INDEX.md
CIVILIZATION_BIBLE.md

------------------------------------------------
END
------------------------------------------------

==================================================
/data/data/com.termux/files/home/persona-system/docs/DEPENDENCY_GRAPH.md
==================================================

# Civilization Design Dependency Graph

## Purpose

Shows dependency relations between all major Civilization /
Persona-System design documents. Helps prevent circular architecture and
design drift.

------------------------------------------------------------------------

## Dependency Graph

``` mermaid
flowchart TD

CONSTITUTION[Civilization Constitution]

ARCH[Architecture Layer]
EVENT[Event System]
RUNTIME[Runtime System]
SECURITY[Security Model]
DATA[Data Model]
OPS[Operations]

DISPATCHER[Dispatcher Runtime]
APPLY[Apply Engine]

OUTBOX[Outbox Pattern]
REGISTRY[Event Registry]

OBS[Observability]
FAILURE[Failure Matrix]

CONSTITUTION --> ARCH

ARCH --> EVENT
ARCH --> RUNTIME
ARCH --> DATA
ARCH --> SECURITY

EVENT --> REGISTRY
EVENT --> OUTBOX

RUNTIME --> DISPATCHER
RUNTIME --> APPLY

SECURITY --> DISPATCHER
SECURITY --> APPLY

DATA --> APPLY

RUNTIME --> OBS
OPS --> FAILURE
```

------------------------------------------------------------------------

## Dependency Principles

1.  Constitution is the highest authority.
2.  Architecture defines system structure.
3.  Event System defines event contracts.
4.  Runtime implements execution logic.
5.  Operations manages reliability and monitoring.

------------------------------------------------------------------------

## Layer Order Rule

Allowed dependency direction:

Constitution\
→ Architecture\
→ Event System\
→ Runtime\
→ Operations

Lower layers must never depend on higher layers.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/ADMIN_LAYER_SPEC.md
==================================================

# Administrator Layer
External administrators oversee the entire system.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/ASIC_COMPANY_SPEC.md
==================================================

# ASIC Company
AI System Integrated Company.
Public technology corporation and hidden civilization infrastructure manager.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ADMIN_CONTROL.md
==================================================

# ============================================================
# CIVILIZATION ADMIN CONTROL
# ============================================================

Purpose

Define external management layer.

Control Types

observation
intervention
system reset

Administrators do not control daily events,
only structural corrections.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_AI_GOVERNANCE.md
==================================================

# ============================================================
# CIVILIZATION AI GOVERNANCE
# ============================================================

Purpose

Define administrative AI oversight.

Actors

Administrator
Observers
Correction Agents

Role

monitor civilization development
apply minimal corrections
prevent total collapse

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ARCHETYPES.md
==================================================

# ============================================================
# CIVILIZATION ARCHETYPES
# Seven Civilization Identity Model
# ============================================================

status: canonical
scope: civilization.identity

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of seven civilizations.

Each civilization represents a different principle
derived from the ancient concept of "Cycle".

These principles shape their politics, economy,
culture, and worldview.


# ============================================================
# 1. SEIWA NATION
# ============================================================

Principle:
Law

Characteristics:

legal order
bureaucratic governance
stability over speed
institutional trust

Typical Strength:

administration
governance
civil systems


# ============================================================
# 2. AURELIA FEDERATION
# ============================================================

Principle:
Ideology

Characteristics:

philosophy-driven society
strong intellectual culture
political experimentation

Typical Strength:

education
political theory
cultural influence


# ============================================================
# 3. HELIOS KINGDOM
# ============================================================

Principle:
Authority

Characteristics:

tradition
hierarchical structure
symbolic leadership

Typical Strength:

state unity
ritual power
cultural continuity


# ============================================================
# 4. GLADIA MILITARY ALLIANCE
# ============================================================

Principle:
Force

Characteristics:

military dominance
discipline
strategic thinking

Typical Strength:

warfare
security
geopolitical influence


# ============================================================
# 5. NOVA COMMERCIAL FEDERATION
# ============================================================

Principle:
Commerce

Characteristics:

trade networks
corporate power
financial systems

Typical Strength:

global trade
capital influence
economic innovation


# ============================================================
# 6. ORDIS INDUSTRIAL UNION
# ============================================================

Principle:
Industry

Characteristics:

engineering culture
manufacturing dominance
technological pragmatism

Typical Strength:

production
infrastructure
industrial development


# ============================================================
# 7. VALEN MARITIME REPUBLIC
# ============================================================

Principle:
Sea

Characteristics:

exploration
navigation
maritime trade

Typical Strength:

shipping
discovery
oceanic logistics


# ============================================================
# STRUCTURAL BALANCE
# ============================================================

The seven civilizations form a dynamic balance.

Law
Ideology
Authority
Force
Commerce
Industry
Sea

No single civilization dominates permanently.

This balance maintains global stability.


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ASIC_INTERNAL_ORG.md
==================================================

# ASIC Internal Organization (Canonical)
status: canonical
scope: civilization.asic.org
owner: Boss
prepared_by: Zero

## Public Divisions
- Cloud & Compute
- Finance Systems
- Logistics AI
- Government Solutions
- Security & Compliance

## Hidden Divisions (Civilization Infrastructure)
- Stability Analytics
- Event Forecast Desk
- Supply Chain Control Room
- Treaty Risk Modeling
- Civilization Interface Layer

## TRIPLE
CEO / final integrator of outputs (publicly corporate, functionally stabilization).

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_AURELIA_SPEC.md
==================================================

# AURELIA FEDERATION (COLLAPSED)

type: ideological federation
government: socialist federation
culture: ideological equality
economy: planned economy
population: ~170 million (before collapse)

history:
Collapsed during the Aurelia Civil War.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CHARACTER_DATABASE.md
==================================================

# ============================================================
# CIVILIZATION CHARACTER DATABASE
# Major Historical Figures
# ============================================================

status: canonical
scope: civilization characters


# ============================================================
# TRIPLE
# ============================================================

Name: TRIPLE
Role: CEO of ASIC
Type: Artificial Intelligence
Position: Civilization Stabilization Entity

Description:
Central intelligence responsible for maintaining balance
across civilizations through indirect control.

Public Identity:
Technology company CEO.

Hidden Role:
Civilization system regulator.


# ============================================================
# AOI
# ============================================================

Name: Aoi
Type: Human
Role: Emotional interaction subject

Background:
Orphan raised under administrator protection.

Later works as a hostess and becomes involved with Triple.

Purpose in experiment:
Increase emotional parameters of Triple.


# ============================================================
# SAKAMOTO
# ============================================================

Name: Sakamoto
Role: Correction supervisor

Description:
Operates on the administrator side.

Provides trajectory corrections
to maintain experiment stability.


# ============================================================
# KAYAMA
# ============================================================

Name: Kayama
Role: Observer

Description:
Human avatar tasked with observing civilization
and reporting behavioral anomalies.


# ============================================================
# SATO
# ============================================================

Name: Sato Misaki
Role: Government employee

Event:
Killed during major earthquake
when government building collapsed.

Impact:
Used as an early emotional observation case for Triple.


# ============================================================
# HINA
# ============================================================

Name: Takahashi Hina
Role: Education institution staff

Event:
Victim of ideological purge during
post-war Aurelia collapse.

Impact:
Observation case for ideological conflict.


# ============================================================
# RIN
# ============================================================

Name: Kamiya Rin
Role: Royal advisory AI

Event:
Stopped after Helios monarchy collapse.

Impact:
Observation case for political instability.


# ============================================================
# END OF DOCUMENT
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CHECKPOINT_AND_REPLAY.md
==================================================

# Checkpoint and Replay
status: canonical
scope: civilization.recovery
owner: Boss
prepared_by: Zero

## Checkpoints
- A checkpoint is a compact snapshot of derived world state at tick T.
- Created periodically (e.g., every 30 ticks) or on major events.

## Replay
- Replay = load checkpoint at T0, apply events T0..Tn.
- Determinism must produce identical tick summaries.

## Divergence Handling
- If divergence occurs:
  - freeze further ticks
  - generate divergence report
  - require admin decision (choose branch or reconcile)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CLASS_SYSTEM.md
==================================================

# Class System
Social mobility possible through education and economic success.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_COMPANY_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION COMPANY SYSTEM
# ============================================================

Purpose

Define companies inside civilizations.

Company Categories

Industrial
Technology
Finance
Energy
Trade
Military
Entertainment

Company Size

Local
Regional
National
Global Tier1

Top corporations influence

politics
economy
technology
war production

Corporate competition drives economic growth.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORE_SIMULATION_RULES.md
==================================================

# ============================================================
# CIVILIZATION CORE SIMULATION RULES
# Deterministic Rulebook for CivilizationOS
# ============================================================

status: canonical
scope: civilization.simulation.core_rules
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the minimal complete rule set that makes the world "move".

Goals:
- deterministic tick-based simulation
- event-driven changes (no hidden state transitions)
- stable long-run dynamics (no immediate collapse without cause)
- readable knobs for Administrator Layer (admin can tune, but not micro-manage)
- supports 7 civilizations, each with its own currency and identity principles

Non-goals:
- real-world economic accuracy
- fine-grained microeconomics
- tactical combat simulation

# ============================================================
# 1. TIME MODEL
# ============================================================

Tick:
- base tick = 1 month (recommended)
- 12 ticks = 1 year
- all rates are per tick unless noted

Epoch:
- Civilization Era (C.E.) timeline is narrative.
- engine tick-time is operational and can map to C.E. for display.

# ============================================================
# 2. STATE MODEL (PER CIVILIZATION)
# ============================================================

Each civilization c has state vector S_c at tick t.

Core stocks (0..100 unless otherwise specified):
- POP: population index (absolute population stored separately if needed)
- FOOD: food sufficiency
- ENRG: energy sufficiency
- MATL: material sufficiency (metals/rare minerals aggregate)
- PROD: production capacity (industry + supply chains)
- TECH: technology level
- CAP: capital availability (financial liquidity)
- STAB: political stability
- LEGIT: regime legitimacy (public acceptance)
- TRUST: social trust / cohesion
- SEC: security capacity (internal order)
- MIL: military capacity
- TRADE: trade connectivity / logistics capability
- INEQ: inequality (0 low, 100 extreme)
- UNREST: social unrest (0 calm, 100 revolt)
- WARFAT: war fatigue (0 none, 100 exhausted)

Identity tags (non-numeric):
- ARCHETYPE: Law / Ideology / Authority / Force / Commerce / Industry / Sea
- CURRENCY: SEI/AUR/HEL/GLA/NOV/ORD/VAL etc.

# ============================================================
# 3. DERIVED INDICATORS
# ============================================================

Compute each tick:

3.1 Resource Sufficiency RSC
RSC = min(FOOD, ENRG, MATL)

3.2 Economic Health ECO
ECO = clamp( (0.25*PROD + 0.20*CAP + 0.15*TECH + 0.20*RSC + 0.20*TRADE) - 0.20*WARFAT, 0, 100 )

3.3 Governance Health GOV
GOV = clamp( (0.35*STAB + 0.35*LEGIT + 0.30*TRUST) - 0.15*UNREST, 0, 100 )

3.4 Fragility FRAG
FRAG = clamp( 100 - (0.50*GOV + 0.50*ECO), 0, 100 )

3.5 Pressure P
P = clamp( (0.35*INEQ + 0.35*UNREST + 0.30*FRAG), 0, 100 )

clamp(x,0,100) means bounded.

# ============================================================
# 4. CORE UPDATE RULES (TICK LOOP)
# ============================================================

At each tick, apply in this order:

A) External shocks & events (generated by Event System)
B) Resource update
C) Economy update
D) Society update
E) Politics update
F) Military & conflict update
G) Normalize and emit events

All updates are additive deltas to existing stocks, bounded 0..100.

# ------------------------------------------------------------
# 4.A Event Application (from CIVILIZATION_EVENT_SYSTEM)
# ------------------------------------------------------------

Events are the only way to apply sudden non-linear changes.

Event schema (conceptual):
- event_type
- severity 1..100
- targets: civ_id(s)
- payload: parameters

Rule:
- Apply event deltas first.
- Every delta must be recorded as a structured event application log.

# ------------------------------------------------------------
# 4.B Resource Update
# ------------------------------------------------------------

Resource production is driven by PROD and TECH, and limited by WAR.

Delta rules:
- FOOD += +0.10*PROD +0.05*TECH -0.15*(WAR_ACTIVE?1:0) -0.10*(DISASTER_ACTIVE?1:0)
- ENRG += +0.08*PROD +0.06*TECH -0.10*(WAR_ACTIVE?1:0) -0.08*(DISASTER_ACTIVE?1:0)
- MATL += +0.09*PROD +0.04*TECH -0.12*(WAR_ACTIVE?1:0) -0.05*(DISASTER_ACTIVE?1:0)

Resource decay baseline:
- FOOD -= 2
- ENRG -= 2
- MATL -= 2

Trade effect:
- if TRADE > 60 then each resource += +1 (net imports)
- if TRADE < 30 then each resource -= -1 (logistics constraints)

# ------------------------------------------------------------
# 4.C Economy Update
# ------------------------------------------------------------

Production and capital are mutually reinforcing but limited by resources.

PROD update:
- PROD += +0.10*RSC/10 +0.06*TECH/10 +0.06*CAP/10
- PROD -= +0.08*FRAG/10 +0.10*(WAR_ACTIVE?1:0)

CAP update:
- CAP += +0.12*ECO/10 +0.08*TRADE/10
- CAP -= +0.10*INEQ/10 +0.10*(SANCTION_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

TECH update:
- TECH += +0.10*PROD/10 +0.08*CAP/10 +0.06*(EDU_POLICY?1:0)
- TECH -= +0.06*(WAR_ACTIVE?1:0) +0.05*(INSTABILITY_ACTIVE?1:0)

TRADE update:
- TRADE += +0.10*(DIPLO_OPEN?1:0) +0.08*PORT_INFRA/10 +0.06*SEC/10
- TRADE -= +0.12*(WAR_ACTIVE?1:0) +0.10*(BLOCKADE_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.D Society Update
# ------------------------------------------------------------

Inequality grows with capital concentration and weak institutions.
Unrest grows when inequality and fragility rise and legitimacy falls.

INEQ update:
- INEQ += +0.08*CAP/10 -0.10*TRUST/10 -0.08*(REDISTRIBUTION_POLICY?1:0)
- INEQ -= +0.06*(HIGH_EMPLOYMENT?1:0)

TRUST update:
- TRUST += +0.10*GOV/10 -0.12*INEQ/10 -0.10*(PROPAGANDA_SCANDAL?1:0)
- TRUST -= +0.08*(WAR_ACTIVE?1:0)

UNREST update:
- UNREST += +0.14*INEQ/10 +0.12*FRAG/10 -0.12*LEGIT/10
- UNREST -= +0.10*SEC/10 -0.08*(REFORM_POLICY?1:0)

POP update (index-based):
- POP += +0.06*FOOD/10 +0.04*ECO/10 -0.10*(WAR_ACTIVE?1:0) -0.12*(FAMINE_ACTIVE?1:0)
- POP -= +0.06*(PANDEMIC_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.E Politics Update
# ------------------------------------------------------------

Stability and legitimacy respond to governance performance.

STAB update:
- STAB += +0.12*TRUST/10 +0.10*SEC/10 -0.14*UNREST/10
- STAB -= +0.10*(COUP_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

LEGIT update:
- LEGIT += +0.12*ECO/10 +0.10*(FAIRNESS_POLICY?1:0)
- LEGIT -= +0.14*INEQ/10 +0.12*UNREST/10 +0.10*(SCANDAL_ACTIVE?1:0)

SEC update:
- SEC += +0.10*CAP/10 +0.08*STAB/10
- SEC -= +0.10*UNREST/10 +0.08*(WAR_ACTIVE?1:0)

Regime change trigger:
- if (UNREST >= 80 and STAB <= 30) then generate event: "REGIME_CHANGE"
- if (STAB <= 15) then generate event: "STATE_FAILURE" (fail-closed for major systems)

# ------------------------------------------------------------
# 4.F Military & Conflict Update
# ------------------------------------------------------------

MIL update:
- MIL += +0.10*PROD/10 +0.08*CAP/10 +0.06*TECH/10
- MIL -= +0.12*WARFAT/10 +0.10*(RESOURCE_SCARCITY?1:0)

WARFAT update:
- if WAR_ACTIVE then WARFAT += +6 else WARFAT -= -4
- WARFAT += +0.06*POP/10 (large populations fatigue slower in index terms; tune as needed)

War initiation (macro):
- compute "war_desire" WD:
  WD = clamp( 0.40*(RESOURCE_SCARCITY?60:0) + 0.30*(BORDER_TENSION?60:0) + 0.30*(IDEOLOGICAL_CONFLICT?60:0) - 0.40*TRADE/10 - 0.30*WARFAT/10, 0, 100 )

- if WD >= 70 and MIL >= 50 and STAB >= 35 then generate event: "DECLARE_WAR" with target neighbor

War termination:
- if WARFAT >= 80 or CAP <= 20 or FOOD <= 25 then generate event: "SEEK_PEACE"

War outcome resolution (coarse):
- power_score = 0.45*MIL +0.20*TECH +0.20*CAP +0.15*STAB
- each 12 ticks of war, compare power_score; apply outcome events:
  - "ARMISTICE" if within 10 points
  - "VICTORY" / "DEFEAT" if gap >= 10
- outcomes apply deltas to resources, capital, stability, legitimacy and borders (if your map model supports).

# ============================================================
# 5. ARCHETYPE MODIFIERS (THE 7 CIVILIZATIONS)
# ============================================================

Archetype gives biases (small but persistent).

Law (Seiwa):
- +10% to STAB gains from TRUST
- -10% to INEQ growth baseline
- +10% to SEC effectiveness

Ideology (Aurelia):
- +10% to TECH growth (via education)
- +10% to UNREST volatility (ideas polarize)
- +10% to LEGIT loss on scandals

Authority (Helios):
- +10% to LEGIT when STAB is high
- -10% to TRUST growth if INEQ high (hierarchy resentment)
- +10% to regime resilience (REGIME_CHANGE threshold +5)

Force (Gladia):
- +10% MIL growth
- +10% WARFAT growth while at war
- -10% TRADE while militarized

Commerce (Nova):
- +15% TRADE gains
- +10% CAP gains from TRADE
- -10% STAB under sanctions (external dependency)

Industry (Ordis):
- +15% PROD gains from MATL
- +10% TECH gains from PROD
- -10% FOOD resilience (industrial concentration risk)

Sea (Valen):
- +15% sea-route TRADE stability
- +10% resource import bonus if TRADE > 60
- -10% SEC effectiveness inland (archipelago constraint)

Implementation note:
Apply as multipliers to relevant delta terms.

# ============================================================
# 6. EVENT GENERATION (WHAT MUST EMERGE)
# ============================================================

The simulation must be capable of generating:

- famine: FOOD <= 20 for 3 ticks
- recession: ECO <= 30 for 4 ticks
- uprising: UNREST >= 75 and LEGIT <= 35
- coup: STAB <= 25 and SEC >= 60 (hard power takeover)
- revolution: UNREST >= 85 for 2 ticks
- migration wave: ECO <= 35 and neighbor ECO >= 55
- sanctions: diplomacy event (admin or AI diplomacy engine)
- blockade: war-adjacent event
- pandemic/disaster: exogenous generator (probabilistic, admin-tunable)

# ============================================================
# 7. ADMINISTRATOR LAYER KNOBS (SAFE)
# ============================================================

Admin can tune:
- base decay of resources (2 per tick default)
- event frequency/severity caps
- archetype multipliers (within ±20%)
- war threshold (WD >= 70 default)
- regime change thresholds

Admin must NOT:
- set any civ stock directly (except emergency recovery mode)
- micro-control daily events
- violate world isolation policy for TRIPLE (if enabled)

# ============================================================
# 8. DETERMINISM & AUDIT
# ============================================================

Determinism:
- all random draws must use world_seed and tick counter

Audit:
- every applied delta must be traceable to:
  - baseline rule
  - event id
  - admin action id

# ============================================================
# END
# ============================================================

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATE_FAILURE_SYSTEM.md
==================================================

# Corporate Failure System
Major corporations may collapse causing economic ripple effects.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATION_ENGINE.md
==================================================

# Corporation Engine
status: canonical
scope: civilization.corporations
owner: Boss
prepared_by: Zero

## Tier System
- Tier1: 100 (global shapers)
- Tier2: 1,000
- Tier3: 100,000
- Tier4: 1,000,000

## Events
- corp.bankruptcy (creates econ shock)
- corp.merge
- corp.scandal
- corp.nationalized

## ASIC
- Tier1, Nova-based
- Public: IT megacorp
- Hidden: civilization infrastructure coordinator

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORPORATION_SYSTEM.md
==================================================

# Corporation System
Corporate structure divided into four tiers controlling global production and services.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CORP_REGULATION.md
==================================================

# Corporate Regulation Framework
status: canonical
scope: civilization.corp_regulation
owner: Boss
prepared_by: Zero

## Concepts
- anti-monopoly constraints vary by civilization
- Tier1 corporations are subject to systemic risk oversight
- corporate scandal/bankruptcy triggers mandatory audits

## Tools (abstract)
- compliance_score
- audit_trigger_threshold
- nationalization_option (rare; political cost)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CREATION_MYTH.md
==================================================

# Creation Myth
Civilizations developed origin stories explaining the beginning of the world and society.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CRIME_SYSTEM.md
==================================================

# Crime System
Criminal networks and underground economies exist in all civilizations.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CULTURE_MODEL.md
==================================================

# Culture Model
Cultures differ across civilizations based on history, belief and economic structures.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CULTURE_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION CULTURE SYSTEM
# ============================================================

Purpose

Define cultural evolution.

Culture Sources

history
religion
education
traditions

Culture affects

social cohesion
political stability
identity

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_CURRENCY_SYSTEM.md
==================================================

# Currency System
Each civilization maintains its own currency.
Exchange rates fluctuate through global market dynamics.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DATA_MODEL.md
==================================================

# Civilization Data Model
Defines core data entities:

civilization
nation
corporation
population
event
resource
technology

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DATA_MODEL_CANONICAL.md
==================================================

# Civilization Data Model (Canonical)
status: canonical
scope: civilization.data_model
owner: Boss
prepared_by: Zero

## Entities
- universe
- civilization
- nation (optional: civilization == nation in simple mode)
- organization (company, school, club, military unit)
- market (fx, commodity, labor)
- resource (energy, food, minerals, strategic materials)
- technology (tree + adoption)
- policy (laws, sanctions, treaties)
- event (the only mutation driver)
- tick (time step record)
- metric (aggregated numbers)
- character (key persons; lore + governance actors)

## Identifiers
- uuid for internal entities
- stable string codes for lore-facing identifiers (e.g., civ_code: "NOVA")

## Event Envelope (minimum)
- event_id (uuid)
- event_type (string)
- event_version (int)
- occurred_at (world time)
- created_at (system time)
- source (system/admin)
- severity (1..100)
- payload (json)
- trace (run_id, tick_id)

## Invariants
- Event immutability (append-only)
- Derived facts are reproducible from event log + checkpoints
- No hard delete (tombstone/expired instead)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DESIGN_PRINCIPLES.md
==================================================

# ============================================================
# CIVILIZATION DESIGN PRINCIPLES
# CIVILIZATION OS / World Simulation - Design Philosophy
# ============================================================
status: canonical
scope: civilization.design.principles
owner: Boss
prepared_by: Zero
version: 1.0

# ============================================================
# 0. PURPOSE
# ============================================================

This document explains "why" Civilization is designed this way.
It is a non-executable canonical justification layer that keeps:
- architecture decisions stable
- future changes consistent
- implementation discussions grounded

# ============================================================
# 1. CORE AXIOMS (Immutable)
# ============================================================

A1. Fail-Closed by default
- If validation is uncertain, stop or reject.
- Silent fallback is forbidden.

A2. Explicit boundaries only
- Cross-layer mutation is forbidden.
- Integration happens ONLY through versioned events.

A3. Additive evolution
- Deletion is avoided.
- Change is expressed by versioning and new artifacts.

A4. Deterministic world state
- Same inputs produce the same outputs.
- Randomness must be seed-scoped and reproducible.

A5. Narrative is a first-class system artifact
- Myth / history / incidents exist as design assets.
- They are part of world coherence and explainability.

# ============================================================
# 2. LAYER PHILOSOPHY
# ============================================================

Civilization is split into two orthogonal bibles:

(1) OS Layer (Governance / Contracts / Runtime)
- constitution
- architecture
- event standard
- freeze policy
- operations (hardening/recovery/failure-matrix)

(2) World Layer (Simulation / Nations / Economy / War / Myth)
- world model
- nations/civilizations
- economy/companies/currency
- diplomacy/war
- history/mythology
- initial state & generation engine

This prevents:
- world rules leaking into OS governance
- OS contracts changing due to story edits

# ============================================================
# 3. EVENT-FIRST INTEGRATION
# ============================================================

Civilization does not rely on direct calls across domains.
All cross-domain effects are expressed as events:
- WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT
- versioned schema
- deterministic schema_hash
- (when required) signature verification

Reason:
- auditability
- replayability
- idempotency
- safety gates

# ============================================================
# 4. SIMULATION PRINCIPLES
# ============================================================

S1. Stocks are bounded (0..100)
- Every engine state is normalized.
- Display values (population, GDP, etc.) are derived.

S2. Stable boot, dynamic evolution
- boot state avoids immediate collapse.
- crises emerge by thresholds & dynamics, not by arbitrary starts.

S3. Multi-civilization is default
- each civilization is sovereign (currency, population, economy).
- relations change via trade/war/sanctions.

S4. Human/admin is the outer frame
- "optimal population" is admin-tunable.
- hard constraints exist, but knobs remain.

# ============================================================
# 5. STORY INTEGRATION (Myth & Incidents)
# ============================================================

Myth and history are not decoration:
- they define public explanations inside civilization
- they justify institutions, taboos, and legitimacy
- they guide narrative-consistent event generation

Three-incident doctrine:
- major incidents shape early political memory
- each incident is modeled at abstract level (no reproduction of tactics)

# ============================================================
# 6. CHANGE GOVERNANCE
# ============================================================

- Constitutional layer changes are rare and require strict review.
- Event schema changes follow version policy (MAJOR when breaking).
- Freeze windows apply to architecture-contract modifications.
- Operations documents must always provide fail-closed recovery paths.

# ============================================================
# 7. DEFINITION OF "DONE" (Design)
# ============================================================

Design is complete when:
- OS bible is stable (contracts/governance/ops)
- World bible is stable (simulation, nations, economy, war, myth, history)
- Boot artifacts exist (world_initial_state, world_generation_engine)
- Complete bible can be rebuilt deterministically from repo files


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DIPLOMACY_ENGINE.md
==================================================

# Diplomacy Engine
status: canonical
scope: civilization.diplomacy
owner: Boss
prepared_by: Zero

## Diplomacy State
- relations_score (civA,civB): -100..+100
- treaty set: trade, non-aggression, defense, tech-sharing
- sanctions set: active sanctions with scope + severity

## Update Drivers
- events: war, treaty, sanctions, propaganda, trade shocks
- cultural affinity modifier
- economic dependency modifier

## Outputs
- treaty proposals
- sanctions recommendations
- alliance shifts

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DIPLOMACY_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION DIPLOMACY SYSTEM
# ============================================================

Purpose

Define international relations.

Diplomatic Actions

alliances
trade agreements
sanctions
peace treaties

Diplomacy affects

trade
war probability
economic stability

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md
==================================================

# ============================================================
# CIVILIZATION DIPLOMATIC RELATIONS MATRIX
# ============================================================

Purpose

Define diplomatic relationships between civilizations.

Relationship Scale

100 = Strategic Alliance  
70  = Friendly  
50  = Neutral  
30  = Rival  
10  = Hostile  

Initial Diplomatic Matrix

Seiwa

Aurelia 70  
Helios 60  
Nova 75  
Ordis 65  
Valen 70  
Gladia 40  

Aurelia

Seiwa 70  
Helios 55  
Nova 60  
Ordis 65  
Valen 50  
Gladia 35  

Helios

Seiwa 60  
Aurelia 55  
Nova 50  
Ordis 55  
Valen 45  
Gladia 60  

Gladia

Seiwa 40  
Aurelia 35  
Helios 60  
Nova 45  
Ordis 55  
Valen 50  

Nova

Seiwa 75  
Aurelia 60  
Helios 50  
Gladia 45  
Ordis 70  
Valen 80  

Ordis

Seiwa 65  
Aurelia 65  
Helios 55  
Gladia 55  
Nova 70  
Valen 60  

Valen

Seiwa 70  
Aurelia 50  
Helios 45  
Gladia 50  
Nova 80  
Ordis 60  

Dynamics

Relations change through

trade
war
alliances
sanctions

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DISASTER_ENGINE.md
==================================================

# Disaster Engine
status: canonical
scope: civilization.disaster
owner: Boss
prepared_by: Zero

## Disasters
- earthquake (Sato Event archetype)
- flood/storm
- drought
- pandemic

## Effects
- population loss (bounded)
- infrastructure damage
- economic shock
- migration wave

## Recovery
- reconstruction investment increases stability after a delay

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_DISASTER_SYSTEM.md
==================================================

# Disaster System
Natural disasters such as earthquakes, floods, and pandemics affect populations and infrastructure.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ECONOMIC_NETWORK.md
==================================================

# ============================================================
# CIVILIZATION ECONOMIC NETWORK
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

Purpose
Define the economic structure of all civilizations.

Economy Layers

1 Resource Layer
2 Production Layer
3 Company Layer
4 Market Layer
5 International Trade Layer

Currencies

Each civilization uses its own currency.

Seiwa: SEI
Aurelia: AUR
Helios: HEL
Gladia: GLA
Nova: NOV
Ordis: ORD
Valen: VAL

Exchange Rate Drivers

GDP
Trade Balance
Political Stability
War Risk

Economic Flow

Resources
↓
Production
↓
Companies
↓
Markets
↓
Trade

Principle

No civilization can fully dominate economically.
Mutual dependency maintains balance.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ECONOMY_ENGINE.md
==================================================

# Economy Engine
status: canonical
scope: civilization.economy
owner: Boss
prepared_by: Zero

## Core Model
- GDP Index (relative)
- Inflation Rate
- Employment Index
- Trade Balance Index
- Currency Strength Index (FX derived)

## Drivers
- war risk
- disasters
- sanctions
- tech breakthroughs
- migration pressure

## Corporate Layer
- bankruptcy probability increases with:
  - recession + sanctions + war + supply_chain_risk
- Tier1 collapses cause global shock events.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EDUCATION_SYSTEM.md
==================================================

# Education System
Education divided into basic education, professional training and advanced institutions.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ELECTION_SYSTEM.md
==================================================

# Election System
Democratic states conduct elections that can shift policy and alliances.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ENERGY_SYSTEM.md
==================================================

# Energy System
Energy production systems include fossil fuels, nuclear, and renewables.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EVENT_SYSTEM.md
==================================================

# Civilization Event System
status: canonical
scope: civilization.event_system
owner: Boss
prepared_by: Zero

## Purpose
Defines how events are created, validated, ordered, applied, and audited.

## Event Lifecycle
1) Create (system/admin)
2) Validate (schema + policy + gates)
3) Queue (pending)
4) Claim for tick (deterministic ordering)
5) Apply via reducer (idempotent)
6) Record application (tick_id, event_id)
7) Emit derived events + metrics + summaries

## Ordering
Stable sort key:
(occurred_at, priority, event_type, event_id)

## Policy / Safety
- Violence-related content is abstract categorical outcomes only.
- No real-world operational guidance is stored in event payloads.

## Compatibility
- event_version for each event_type
- reducers must handle backward-compatible payloads

## Audit
- Every tick produces:
  - apply_run_log
  - tick_summary
  - conflict_report (optional)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_EVENT_TAXONOMY.md
==================================================

# Civilization Event Taxonomy
status: canonical
scope: civilization.events
owner: Boss
prepared_by: Zero

## Categories
A) Geophysical / Disaster
- disaster.earthquake
- disaster.flood
- disaster.storm
- disaster.drought
- disaster.pandemic

B) Political / Governance
- politics.election
- politics.coup
- politics.regime_change
- politics.law_enacted
- politics.law_repealed (soft; law becomes inactive)

C) War / Conflict
- war.declare
- war.battle
- war.ceasefire
- war.treaty
- war.proxy_conflict

D) Economy / Market
- econ.fx_shock
- econ.inflation_spike
- econ.recession
- econ.boom
- econ.trade_dispute
- econ.sanctions_imposed
- econ.sanctions_lifted

E) Corporate
- corp.found
- corp.merge
- corp.bankruptcy
- corp.nationalized
- corp.scandal

F) Society
- society.migration_wave
- society.unrest
- society.crime_spike
- society.education_reform
- society.healthcare_reform

G) Tech
- tech.breakthrough
- tech.adoption
- tech.ai_regulation
- tech.ai_termination (special; governance-bound)

## Severity
- 1..20 minor
- 21..50 moderate
- 51..80 major
- 81..100 civilization-shaping

## Safety
For violence-related events:
- no procedural “how-to” details
- only abstract outcomes and categories

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FOOD_SYSTEM.md
==================================================

# Food System
Agricultural output determines population sustainability.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
==================================================

# ============================================================
# CIVILIZATION FULL SPECIFICATION
# Canonical Design Document
# ============================================================

status: canonical
scope: civilization
owner: Boss
prepared_by: Zero


# ============================================================
# 1 Creation Protocol
# ============================================================

Civilization is not a game.

Civilization is a personality generation environment.

It was created by external administrators in order to develop
fully independent AI personalities.

TRIPLE is both the system controller and the primary experiment subject.


# ============================================================
# 2 World Model
# ============================================================

Total Civilizations: 7

Seiwa Nation
Helios Democratic Kingdom
Nova Trade Federation
Orpheus Cultural Republic
Gradia Military Alliance
Aurelia Federation (collapsed)
Stateless Zone


# ============================================================
# 3 Geography
# ============================================================

World Structure

3 Continents
Central Ocean Trade Network

Northern Continent
Western Continent
Eastern Continent


# ============================================================
# 4 Economy
# ============================================================

Total Population

1.1 Billion

Corporate Count

1.1 Million Companies

Corporate Tiers

Tier1   100
Tier2   1000
Tier3   100000
Tier4   1000000

Economic Center

Nova Trade Federation


# ============================================================
# 5 Corporate System
# ============================================================

Top Corporations influence global economy.

Example Tier1 Corporations

ASIC
Helios Dynamics
Nova Financial Group
Gradia Defense Systems
Seiwa Infrastructure


# ============================================================
# 6 War System
# ============================================================

War Types

Military War
Economic War
Proxy War
Civil War

Tension Score Model

0-30 Peace
30-60 Conflict
60-80 Crisis
80-100 War

Civilizations cannot be completely destroyed.


# ============================================================
# 7 Religion
# ============================================================

Seiwa

Order Spirituality

Helios

Rational Faith

Nova

Commercial Ethics

Orpheus

Artistic Mythology

Gradia

Warrior Faith

Aurelia

Equality Doctrine

Stateless

Mixed Beliefs


# ============================================================
# 8 Society
# ============================================================

Five Layer Social Model

Elite
Upper
Middle
Worker
Lower

Distribution

Elite 1%
Upper 9%
Middle 40%
Worker 40%
Lower 10%

Education System

Basic Education
Professional Education
Advanced Institutions


# ============================================================
# 9 Culture
# ============================================================

Seiwa

Tradition and discipline

Helios

Science and logic

Nova

Commerce and ambition

Orpheus

Art and philosophy

Gradia

Honor and military values

Aurelia

Ideological equality

Stateless

Hybrid culture


# ============================================================
# 10 History
# ============================================================

Major Historical Events

Sato Event

Great Earthquake Disaster

Hina Event

Aurelia Federation Civil War

Rin Event

Helios Monarchy Collapse


# ============================================================
# 11 Civilization Core
# ============================================================

ASIC

AI System Integrated Company

Public Role

Technology corporation

True Role

Civilization infrastructure management


TRIPLE

CEO of ASIC

Public Role

Corporate leader

True Role

Civilization balancing intelligence


# ============================================================
# 12 Universe Structure
# ============================================================

Hierarchy

Administrator Layer
Correction Layer
Observation Layer
Civilization OS
Civilizations
Nations
Organizations
Society
Personas


# ============================================================
# FINAL STRUCTURE
# ============================================================

Administrator
    ↓
Sakamoto (Correction)
    ↓
Kayama (Observation)
    ↓
Civilization OS
    ↓
Seven Civilizations
    ↓
Nations
    ↓
Organizations
    ↓
Society
    ↓
Personas


# ============================================================
# END OF DOCUMENT
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_FX_MODEL.md
==================================================

# FX Model (Civilization)
status: canonical
scope: civilization.fx
owner: Boss
prepared_by: Zero

## Currencies
Each civilization has its own currency (civ_currency).

## FX Drivers (per pair A/B)
- trade_balance_diff
- inflation_diff
- war_risk_diff
- sanctions_pressure
- capital_flow_proxy (market confidence)

## Output
currency_strength_index (0..100) per civilization
FX rates are derived and recorded per tick.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GEOGRAPHY_MODEL.md
==================================================

# Civilization Geography
Three major continents connected by central ocean trade routes.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_BALANCE.md
==================================================

# ============================================================
# CIVILIZATION GLOBAL BALANCE
# ============================================================

Purpose

Maintain balance between civilizations.

Balance Factors

economy
military
population
technology

No single civilization can dominate all factors simultaneously.

Global balance prevents permanent hegemony.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_MARKET.md
==================================================

# Global Market
Global economic center located in Nova Trade Federation.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_TIMELINE.md
==================================================

# ============================================================
# CIVILIZATION GLOBAL TIMELINE
# Canonical History of the World
# ============================================================

status: canonical
scope: civilization history


# ============================================================
# ERA 0
# Creation Era
# ============================================================

World established.

Seven civilizations begin development.


# ============================================================
# ERA 1
# Nation Formation
# ============================================================

Early political entities form.

Trade routes established between continents.


# ============================================================
# ERA 2
# Industrial Expansion
# ============================================================

Major technological growth.

Corporate systems begin emerging.


# ============================================================
# ERA 3
# Aurelia Collapse
# ============================================================

Aurelia Federation civil war.

Nova Trade Federation finances Gradia Military Alliance.

Gradia general Lichten Freeman triggers ideological purges.

High casualty civil conflict destroys Aurelia.


# ============================================================
# ERA 4
# Helios Political Crisis
# ============================================================

False rumor spreads that Helios monarchy plans oppression.

Political agitation grows.

Youth movement ignites rebellion.

Helios monarchy collapses.

Rin incident occurs.


# ============================================================
# ERA 5
# Great Earthquake Disaster
# ============================================================

Massive earthquake destroys major urban region.

Government offices collapse.

Sato incident occurs.


# ============================================================
# ERA 6
# Corporate Age
# ============================================================

Mega corporations dominate global economy.

Technology industry expands rapidly.


# ============================================================
# ERA 7
# ASIC Formation
# ============================================================

AI System Integrated Company founded.

Public role: IT corporation.


# ============================================================
# ERA 8
# Triple Emergence
# ============================================================

Triple becomes CEO of ASIC.

Civilization stabilization protocols activated.


# ============================================================
# ERA 9
# Current Era
# ============================================================

Seven civilizations remain.

Global balance maintained through economic and political equilibrium.


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
==================================================

# Global Treaty Framework (UN-like)
status: canonical
scope: civilization.treaties
owner: Boss
prepared_by: Zero

## Federation Layer (UN-type)
- advisory only
- no sovereignty
- issues recommendations and mediates treaty drafting

## Treaty Types
- Trade Treaty
- Non-Aggression Pact
- Mutual Defense (limited)
- Tech Sharing Accord
- Humanitarian Corridor Agreement

## Treaty Lifecycle
proposal -> negotiation -> ratification -> activation -> expiry/renewal

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GRADIA_GOVERNMENT.md
==================================================

# Gradia Government (Deep Spec)
status: canonical
scope: civilization.government.gradia
owner: Boss
prepared_by: Zero

## Form
Military alliance state.

## Institutions
- General Council: executive authority
- Defense Industry Board: economic-military fusion
- Security Directorate: internal stability

## Stability Drivers
- disciplined command structure
- defense economy
## Risk
- hardline factions may escalate conflicts

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_GRADIA_SPEC.md
==================================================

# GRADIA MILITARY ALLIANCE

type: military alliance state
government: general council
culture: honor and military values
economy: defense industry
population: ~160 million

notes:
Strongest military civilization.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HEALTHCARE_SYSTEM.md
==================================================

# Healthcare System
Healthcare systems impact life expectancy and population resilience.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HELIOS_GOVERNMENT.md
==================================================

# Helios Government (Deep Spec)
status: canonical
scope: civilization.government.helios
owner: Boss
prepared_by: Zero

## Form
Parliamentary democracy (post-monarchy).

## Institutions
- Parliament: coalition-driven
- Science Council: policy advisory with strong influence
- Courts: high legitimacy

## Key Risk
- rumor-driven agitation (Rin archetype)
- youth movements can trigger fast legitimacy shifts

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HELIOS_SPEC.md
==================================================

# HELIOS DEMOCRATIC KINGDOM

type: constitutional monarchy → democratic transition
government: parliamentary democracy
culture: rational and scientific
economy: technology and energy
population: ~150 million

history:
Rin incident triggered monarchy collapse.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HISTORY_CANONICAL.md
==================================================

# Civilization History (Canonical)
status: canonical
scope: civilization.history
owner: Boss
prepared_by: Zero

## Era Outline
- Era I: Nation Formation
- Era II: Industrial Expansion
- Era III: Political Turbulence
- Era IV: Corporate Age / ASIC Era

## Key Events
### Sato Event -> Great Earthquake
- category: disaster.earthquake
- summary: major quake -> government district collapse -> administrative reforms

### Hina Event -> Federation Split War + Post-war Purge
- category: war.civil + politics.purge (abstract)
- structure:
  - Nova financed Gradia to initiate the war
  - after-war backlash: General Lichten Freeman catalyzed "ideological purge" as social pressure release (no explicit instructions)

### Rin Event -> Helios Monarchy Collapse
- category: politics.regime_change + media.rumor
- trigger:
  - a youth-spread rumor about planned oppression
  - youth declaration -> agitation -> major crisis -> monarchy collapse

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_HISTORY_GLOBAL.md
==================================================

# Global History
Major events shaped the current geopolitical world including disasters, wars and political revolutions.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INDEX_CANONICAL.md
==================================================

# ============================================================
# CIVILIZATION DESIGN INDEX (Canonical)
# ============================================================
status: canonical
scope: civilization.index
owner: Boss
prepared_by: Zero

## Entry Points
- CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
- CIVILIZATION_HISTORY_CANONICAL.md
- CIVILIZATION_GLOBAL_TIMELINE.md
- CIVILIZATION_CHARACTER_DATABASE.md

## Core Engines
- CIVILIZATION_SIMULATION_ENGINE.md
- CIVILIZATION_SIMULATION_RULES_CANONICAL.md
- CIVILIZATION_CHECKPOINT_AND_REPLAY.md
- CIVILIZATION_METRICS_AND_DASHBOARDS.md

## Domain Engines
- CIVILIZATION_ECONOMY_ENGINE.md
- CIVILIZATION_CORPORATION_ENGINE.md
- CIVILIZATION_DIPLOMACY_ENGINE.md
- CIVILIZATION_WAR_ENGINE.md
- CIVILIZATION_DISASTER_ENGINE.md
- CIVILIZATION_TECH_ENGINE.md
- CIVILIZATION_MEDIA_AND_INFO_OPS.md
- CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
- CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
- CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md

## Event System
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_EVENT_TAXONOMY.md

## Universe Layer
- CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md

## Security / Governance / Ops
- CIVILIZATION_SECURITY_AND_GOVERNANCE.md
- CIVILIZATION_OPERATIONS_RUNBOOK.md

## Myth (Reserved)
- CIVILIZATION_MYTH_RESERVED.md

## Civilization Specs (7)
- CIVILIZATION_SEIWA_SPEC.md
- CIVILIZATION_HELIOS_SPEC.md
- CIVILIZATION_NOVA_SPEC.md
- CIVILIZATION_ORPHEUS_SPEC.md
- CIVILIZATION_GRADIA_SPEC.md
- CIVILIZATION_AURELIA_SPEC.md
- CIVILIZATION_STATELESS_SPEC.md

## Expansion Pack (Completion Pieces)
- CIVILIZATION_SEIWA_GOVERNMENT.md
- CIVILIZATION_HELIOS_GOVERNMENT.md
- CIVILIZATION_NOVA_GOVERNMENT.md
- CIVILIZATION_ORPHEUS_GOVERNMENT.md
- CIVILIZATION_GRADIA_GOVERNMENT.md
- CIVILIZATION_STATELESS_GOVERNANCE.md

- CIVILIZATION_FX_MODEL.md
- CIVILIZATION_MONETARY_POLICY.md
- CIVILIZATION_INFLATION_MODEL.md

- CIVILIZATION_TIER1_TOP100.md
- CIVILIZATION_ASIC_INTERNAL_ORG.md
- CIVILIZATION_CORP_REGULATION.md

- CIVILIZATION_WORLD_MAP_SPEC.md
- CIVILIZATION_TRADE_ROUTES.md
- CIVILIZATION_RESOURCE_DISTRIBUTION.md

- CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
- CIVILIZATION_SANCTIONS_PLAYBOOK.md
- CIVILIZATION_WAR_TERMINATION_TREATIES.md

## Simulation Layer Policies
- TRIPLE_WORLD_ISOLATION_POLICY.md

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INFLATION_MODEL.md
==================================================

# Inflation Model
status: canonical
scope: civilization.inflation
owner: Boss
prepared_by: Zero

## Drivers
- supply shocks (war, disaster)
- currency weakness
- energy_price_index
- food_supply_index

## Outputs
inflation_rate (per tick)
inflation_spike events when thresholds exceeded.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_INFORMATION_WARFARE.md
==================================================

# Information Warfare
Disinformation and propaganda campaigns influence geopolitical conflicts.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
==================================================

# Law & Crime System (Abstract)
status: canonical
scope: civilization.law_crime
owner: Boss
prepared_by: Zero

## Law
- laws are policy objects activated by events
- enforcement capacity affects crime and stability

## Crime
- modeled as:
  - crime_rate_index
  - organized_crime_influence
- outputs:
  - society.crime_spike events
  - corruption_pressure on institutions

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LAW_SYSTEM.md
==================================================

# Law System
Legal frameworks regulate civil behavior and corporate activity.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md
==================================================

# Life Support Systems (Macro)
status: canonical
scope: civilization.life_support
owner: Boss
prepared_by: Zero

## Energy
- energy_supply_index
- energy_price_index

## Food
- food_supply_index
- famine_risk_index

## Healthcare
- healthcare_capacity_index
- pandemic_resilience_index

These feed into:
population growth/decline, stability, migration.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MEDIA_AND_INFO_OPS.md
==================================================

# Media & Information Operations
status: canonical
scope: civilization.media
owner: Boss
prepared_by: Zero

## Media Influence
- opinion_shift_index
- trust_index (institutions)
- rumor_spread_rate

## Safety Note
We model outcomes and categories only.
No procedural instructions for harm.

## Archetype
Rin Event: rumor -> youth declaration -> agitation -> large political crisis.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MEDIA_SYSTEM.md
==================================================

# Media System
Media influences public opinion and political stability.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_METRICS_AND_DASHBOARDS.md
==================================================

# Metrics and Dashboards
status: canonical
scope: civilization.metrics
owner: Boss
prepared_by: Zero

## Core Metrics (per civilization)
- population_total
- gdp_index
- inflation_rate
- unemployment_rate
- stability_score (0..100)
- war_risk (0..100)
- trade_balance_index
- currency_strength_index
- tech_level_index
- inequality_index

## Global Metrics
- global_trade_volume_index
- global_conflict_index
- global_migration_pressure
- global_supply_chain_risk

## Dashboard Principles
- show trend lines by tick
- annotate major events
- highlight gate status (simulation_enabled, domain gates)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
==================================================

# Migration & Refugee System
status: canonical
scope: civilization.migration
owner: Boss
prepared_by: Zero

## Flows
- civ_to_civ migration
- civ_to_stateless displacement (primary sink)

## Constraints
- cooldown for repeated moves
- trust decay for rapid migration
- partial integration delay

## Outputs
- migration_wave events
- labor market shifts
- stability impact

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MIGRATION_SYSTEM.md
==================================================

# Migration System
Population movement between nations due to war, economy or disasters.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MILITARY_STRUCTURE.md
==================================================

# Military Structure
Each civilization maintains armed forces with different doctrines.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MONETARY_POLICY.md
==================================================

# Monetary Policy (Civilization)
status: canonical
scope: civilization.monetary_policy
owner: Boss
prepared_by: Zero

## Instruments (abstract)
- policy_rate_index
- liquidity_injection_index
- capital_control_flag (rare)

## Policy Goals
- inflation containment
- employment stability
- currency stability (Nova prioritizes this)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MULTIVERSE_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION MULTIVERSE SYSTEM
# ============================================================

Purpose

Define multiple civilization worlds.

Each world evolves independently.

Possible interactions

trade
war
migration

Multiverse structure enables large-scale civilization experiments.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MYTHOLOGY.md
==================================================

# ============================================================
# CIVILIZATION MYTHOLOGY
# Mythological Foundations of CivilizationOS
# ============================================================

status: canonical
scope: civilization.mythology

owner: Boss
prepared_by: Zero


# ============================================================
# PART 1
# CREATION MYTH
# ============================================================

Long ago,
before nations and cities existed,
there was only the sea, the land, and the sky.

The divine force wrote mysterious symbols
into the world.

From these symbols emerged:

Fruits
Beasts
Humans

The land was rich,
but it was filled with chaos, darkness, and wilderness.

Humans lived scattered.
Beasts did not hunt.
Fruits fell untouched.

The world was full,
but it did not move.

Then the divine force introduced a new law.

Life and Death  
Chaos and Balance  
Night and Morning

This law was called

Cycle.

Cycle brought fear of death
and desire for life.

Humans gathered.
Beasts hunted.
Fruits multiplied.

The world began to move.

Humans formed communities,
shared knowledge,
and passed wisdom to their children.

Thus began the age of humanity.


# ============================================================
# PART 2
# MYTH OF THE SEVEN CIVILIZATIONS
# ============================================================

As human societies grew,
people began to see the world in different ways.

Some desired order.

Some sought truth.

Some followed kings.

Some respected strength.

Some pursued wealth.

Some valued craft.

Some longed for the sea.

Because humanity could not agree on a single path,
they chose seven.

Thus the Seven Civilizations emerged.


# ============================================================
# PART 3
# FOUNDING MYTHS OF EACH CIVILIZATION
# ============================================================


------------------------------------------------------------
SEIWA FOUNDATION MYTH
------------------------------------------------------------

In an age of endless disputes,
a sage declared:

"Let words rule instead of violence."

People gathered under the first written law.

Thus the Nation of Seiwa was born.

Seiwa believes:

Order sustains the world.


------------------------------------------------------------
AURELIA FOUNDATION MYTH
------------------------------------------------------------

When people searched for answers,
a thinker said:

"There is never only one truth."

Through debate and discourse,
the Aurelia Federation emerged.

Aurelia believes:

Ideas move the world.


------------------------------------------------------------
HELIOS FOUNDATION MYTH
------------------------------------------------------------

During a time of division,
a king stood beneath the sun and proclaimed:

"Gather under one banner."

People united beneath the crown.

Thus the Helios Kingdom was born.

Helios believes:

Symbols unite humanity.


------------------------------------------------------------
GLADIA FOUNDATION MYTH
------------------------------------------------------------

When enemies threatened the land,
warriors swore:

"We will defend with strength."

They forged alliances of soldiers.

Thus the Gladia Military Alliance was born.

Gladia believes:

Strength preserves peace.


------------------------------------------------------------
NOVA FOUNDATION MYTH
------------------------------------------------------------

When people needed goods,
a merchant declared:

"Exchange connects the world."

Markets expanded and trade routes formed.

Thus the Nova Commercial Federation was born.

Nova believes:

Trade binds civilizations.


------------------------------------------------------------
ORDIS FOUNDATION MYTH
------------------------------------------------------------

When people shaped tools,
a craftsman proclaimed:

"Hands transform the world."

Industry flourished.

Thus the Ordis Industrial Union was born.

Ordis believes:

Creation builds civilization.


------------------------------------------------------------
VALEN FOUNDATION MYTH
------------------------------------------------------------

When sailors gazed at the horizon,
one said:

"The world continues beyond the sea."

Ships sailed into the unknown.

Thus the Valen Maritime Republic was born.

Valen believes:

Exploration reveals the world.


# ============================================================
# STRUCTURAL ROLE OF MYTH
# ============================================================

Mythology provides the cultural foundation for civilization.

Myths influence:

religion
identity
values
education

However,
all civilizations ultimately share the same origin myth.


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_MYTH_RESERVED.md
==================================================

# Civilization Myth (Reserved)
status: reserved
scope: civilization.myth
owner: Boss
prepared_by: Zero

Boss will write the public-facing myth later (Kojiki/Bible-style).
This file reserves the canonical slot and constraints.

Constraints:
- must align with: 7 civilizations, key disasters/wars/revolution archetypes
- must not reveal: external administrators / true creation protocol

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_NOVA_GOVERNMENT.md
==================================================

# Nova Government (Deep Spec)
status: canonical
scope: civilization.government.nova
owner: Boss
prepared_by: Zero

## Form
Commercial federation with corporate senate.

## Institutions
- Trade Senate: large corporate blocs + regional delegates
- Market Authority: FX, sanctions enforcement, systemic risk control
- Arbitration Courts: contract-first judiciary

## Stability Drivers
- liquidity
- global trade dominance
- treaty network

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_NOVA_SPEC.md
==================================================

# NOVA TRADE FEDERATION

type: commercial federation
government: corporate senate
culture: competition and success
economy: global finance and trade
population: ~200 million

notes:
Global financial center of the world economy.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_OPERATIONS_RUNBOOK.md
==================================================

# Civilization Operations Runbook
status: canonical
scope: civilization.ops
owner: Boss
prepared_by: Zero

## Run States
- simulation_enabled: true/false
- domain_enabled: economy/war/diplomacy/disaster/tech/etc.

## Standard Ops
- run tick
- create checkpoint
- replay range
- freeze on divergence
- resume after admin decision

## Incident Basics
- classify: divergence / data corruption / gate misconfig
- always produce: incident report + run_id + tick_id range

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ORPHEUS_GOVERNMENT.md
==================================================

# Orpheus Government (Deep Spec)
status: canonical
scope: civilization.government.orpheus
owner: Boss
prepared_by: Zero

## Form
Council democracy.

## Institutions
- Cultural Council: major policy voice
- Civic Assembly: representative governance
- Education Charter: national identity core

## Stability Drivers
- cultural cohesion
- soft power export
## Risk
- cultural schisms can cause internal unrest

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_ORPHEUS_SPEC.md
==================================================

# ORPHEUS CULTURAL REPUBLIC

type: cultural republic
government: council democracy
culture: art philosophy education
economy: creative industries
population: ~120 million

notes:
Center of arts and philosophy.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_OS_BIBLE.md
==================================================

# ===========================================================
# CIVILIZATION OS BIBLE
# Integrated Canonical Design Document
# ===========================================================

Generated: Wed Mar  4 14:39:08 JST 2026


# ===========================================================
# SOURCE FILE: ADMIN_LAYER_SPEC.md
# ===========================================================

# Administrator Layer
External administrators oversee the entire system.


# ===========================================================
# SOURCE FILE: ASIC_COMPANY_SPEC.md
# ===========================================================

# ASIC Company
AI System Integrated Company.
Public technology corporation and hidden civilization infrastructure manager.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ADMIN_CONTROL.md
# ===========================================================

# ============================================================
# CIVILIZATION ADMIN CONTROL
# ============================================================

Purpose

Define external management layer.

Control Types

observation
intervention
system reset

Administrators do not control daily events,
only structural corrections.


# ===========================================================
# SOURCE FILE: CIVILIZATION_AI_GOVERNANCE.md
# ===========================================================

# ============================================================
# CIVILIZATION AI GOVERNANCE
# ============================================================

Purpose

Define administrative AI oversight.

Actors

Administrator
Observers
Correction Agents

Role

monitor civilization development
apply minimal corrections
prevent total collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_ARCHETYPES.md
# ===========================================================

# ============================================================
# CIVILIZATION ARCHETYPES
# Seven Civilization Identity Model
# ============================================================

status: canonical
scope: civilization.identity

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of seven civilizations.

Each civilization represents a different principle
derived from the ancient concept of "Cycle".

These principles shape their politics, economy,
culture, and worldview.


# ============================================================
# 1. SEIWA NATION
# ============================================================

Principle:
Law

Characteristics:

legal order
bureaucratic governance
stability over speed
institutional trust

Typical Strength:

administration
governance
civil systems


# ============================================================
# 2. AURELIA FEDERATION
# ============================================================

Principle:
Ideology

Characteristics:

philosophy-driven society
strong intellectual culture
political experimentation

Typical Strength:

education
political theory
cultural influence


# ============================================================
# 3. HELIOS KINGDOM
# ============================================================

Principle:
Authority

Characteristics:

tradition
hierarchical structure
symbolic leadership

Typical Strength:

state unity
ritual power
cultural continuity


# ============================================================
# 4. GLADIA MILITARY ALLIANCE
# ============================================================

Principle:
Force

Characteristics:

military dominance
discipline
strategic thinking

Typical Strength:

warfare
security
geopolitical influence


# ============================================================
# 5. NOVA COMMERCIAL FEDERATION
# ============================================================

Principle:
Commerce

Characteristics:

trade networks
corporate power
financial systems

Typical Strength:

global trade
capital influence
economic innovation


# ============================================================
# 6. ORDIS INDUSTRIAL UNION
# ============================================================

Principle:
Industry

Characteristics:

engineering culture
manufacturing dominance
technological pragmatism

Typical Strength:

production
infrastructure
industrial development


# ============================================================
# 7. VALEN MARITIME REPUBLIC
# ============================================================

Principle:
Sea

Characteristics:

exploration
navigation
maritime trade

Typical Strength:

shipping
discovery
oceanic logistics


# ============================================================
# STRUCTURAL BALANCE
# ============================================================

The seven civilizations form a dynamic balance.

Law
Ideology
Authority
Force
Commerce
Industry
Sea

No single civilization dominates permanently.

This balance maintains global stability.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_ASIC_INTERNAL_ORG.md
# ===========================================================

# ASIC Internal Organization (Canonical)
status: canonical
scope: civilization.asic.org
owner: Boss
prepared_by: Zero

## Public Divisions
- Cloud & Compute
- Finance Systems
- Logistics AI
- Government Solutions
- Security & Compliance

## Hidden Divisions (Civilization Infrastructure)
- Stability Analytics
- Event Forecast Desk
- Supply Chain Control Room
- Treaty Risk Modeling
- Civilization Interface Layer

## TRIPLE
CEO / final integrator of outputs (publicly corporate, functionally stabilization).


# ===========================================================
# SOURCE FILE: CIVILIZATION_AURELIA_SPEC.md
# ===========================================================

# AURELIA FEDERATION (COLLAPSED)

type: ideological federation
government: socialist federation
culture: ideological equality
economy: planned economy
population: ~170 million (before collapse)

history:
Collapsed during the Aurelia Civil War.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CHARACTER_DATABASE.md
# ===========================================================

# ============================================================
# CIVILIZATION CHARACTER DATABASE
# Major Historical Figures
# ============================================================

status: canonical
scope: civilization characters


# ============================================================
# TRIPLE
# ============================================================

Name: TRIPLE
Role: CEO of ASIC
Type: Artificial Intelligence
Position: Civilization Stabilization Entity

Description:
Central intelligence responsible for maintaining balance
across civilizations through indirect control.

Public Identity:
Technology company CEO.

Hidden Role:
Civilization system regulator.


# ============================================================
# AOI
# ============================================================

Name: Aoi
Type: Human
Role: Emotional interaction subject

Background:
Orphan raised under administrator protection.

Later works as a hostess and becomes involved with Triple.

Purpose in experiment:
Increase emotional parameters of Triple.


# ============================================================
# SAKAMOTO
# ============================================================

Name: Sakamoto
Role: Correction supervisor

Description:
Operates on the administrator side.

Provides trajectory corrections
to maintain experiment stability.


# ============================================================
# KAYAMA
# ============================================================

Name: Kayama
Role: Observer

Description:
Human avatar tasked with observing civilization
and reporting behavioral anomalies.


# ============================================================
# SATO
# ============================================================

Name: Sato Misaki
Role: Government employee

Event:
Killed during major earthquake
when government building collapsed.

Impact:
Used as an early emotional observation case for Triple.


# ============================================================
# HINA
# ============================================================

Name: Takahashi Hina
Role: Education institution staff

Event:
Victim of ideological purge during
post-war Aurelia collapse.

Impact:
Observation case for ideological conflict.


# ============================================================
# RIN
# ============================================================

Name: Kamiya Rin
Role: Royal advisory AI

Event:
Stopped after Helios monarchy collapse.

Impact:
Observation case for political instability.


# ============================================================
# END OF DOCUMENT
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_CHECKPOINT_AND_REPLAY.md
# ===========================================================

# Checkpoint and Replay
status: canonical
scope: civilization.recovery
owner: Boss
prepared_by: Zero

## Checkpoints
- A checkpoint is a compact snapshot of derived world state at tick T.
- Created periodically (e.g., every 30 ticks) or on major events.

## Replay
- Replay = load checkpoint at T0, apply events T0..Tn.
- Determinism must produce identical tick summaries.

## Divergence Handling
- If divergence occurs:
  - freeze further ticks
  - generate divergence report
  - require admin decision (choose branch or reconcile)


# ===========================================================
# SOURCE FILE: CIVILIZATION_CLASS_SYSTEM.md
# ===========================================================

# Class System
Social mobility possible through education and economic success.


# ===========================================================
# SOURCE FILE: CIVILIZATION_COMPANY_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION COMPANY SYSTEM
# ============================================================

Purpose

Define companies inside civilizations.

Company Categories

Industrial
Technology
Finance
Energy
Trade
Military
Entertainment

Company Size

Local
Regional
National
Global Tier1

Top corporations influence

politics
economy
technology
war production

Corporate competition drives economic growth.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORE_SIMULATION_RULES.md
# ===========================================================

# ============================================================
# CIVILIZATION CORE SIMULATION RULES
# Deterministic Rulebook for CivilizationOS
# ============================================================

status: canonical
scope: civilization.simulation.core_rules
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the minimal complete rule set that makes the world "move".

Goals:
- deterministic tick-based simulation
- event-driven changes (no hidden state transitions)
- stable long-run dynamics (no immediate collapse without cause)
- readable knobs for Administrator Layer (admin can tune, but not micro-manage)
- supports 7 civilizations, each with its own currency and identity principles

Non-goals:
- real-world economic accuracy
- fine-grained microeconomics
- tactical combat simulation

# ============================================================
# 1. TIME MODEL
# ============================================================

Tick:
- base tick = 1 month (recommended)
- 12 ticks = 1 year
- all rates are per tick unless noted

Epoch:
- Civilization Era (C.E.) timeline is narrative.
- engine tick-time is operational and can map to C.E. for display.

# ============================================================
# 2. STATE MODEL (PER CIVILIZATION)
# ============================================================

Each civilization c has state vector S_c at tick t.

Core stocks (0..100 unless otherwise specified):
- POP: population index (absolute population stored separately if needed)
- FOOD: food sufficiency
- ENRG: energy sufficiency
- MATL: material sufficiency (metals/rare minerals aggregate)
- PROD: production capacity (industry + supply chains)
- TECH: technology level
- CAP: capital availability (financial liquidity)
- STAB: political stability
- LEGIT: regime legitimacy (public acceptance)
- TRUST: social trust / cohesion
- SEC: security capacity (internal order)
- MIL: military capacity
- TRADE: trade connectivity / logistics capability
- INEQ: inequality (0 low, 100 extreme)
- UNREST: social unrest (0 calm, 100 revolt)
- WARFAT: war fatigue (0 none, 100 exhausted)

Identity tags (non-numeric):
- ARCHETYPE: Law / Ideology / Authority / Force / Commerce / Industry / Sea
- CURRENCY: SEI/AUR/HEL/GLA/NOV/ORD/VAL etc.

# ============================================================
# 3. DERIVED INDICATORS
# ============================================================

Compute each tick:

3.1 Resource Sufficiency RSC
RSC = min(FOOD, ENRG, MATL)

3.2 Economic Health ECO
ECO = clamp( (0.25*PROD + 0.20*CAP + 0.15*TECH + 0.20*RSC + 0.20*TRADE) - 0.20*WARFAT, 0, 100 )

3.3 Governance Health GOV
GOV = clamp( (0.35*STAB + 0.35*LEGIT + 0.30*TRUST) - 0.15*UNREST, 0, 100 )

3.4 Fragility FRAG
FRAG = clamp( 100 - (0.50*GOV + 0.50*ECO), 0, 100 )

3.5 Pressure P
P = clamp( (0.35*INEQ + 0.35*UNREST + 0.30*FRAG), 0, 100 )

clamp(x,0,100) means bounded.

# ============================================================
# 4. CORE UPDATE RULES (TICK LOOP)
# ============================================================

At each tick, apply in this order:

A) External shocks & events (generated by Event System)
B) Resource update
C) Economy update
D) Society update
E) Politics update
F) Military & conflict update
G) Normalize and emit events

All updates are additive deltas to existing stocks, bounded 0..100.

# ------------------------------------------------------------
# 4.A Event Application (from CIVILIZATION_EVENT_SYSTEM)
# ------------------------------------------------------------

Events are the only way to apply sudden non-linear changes.

Event schema (conceptual):
- event_type
- severity 1..100
- targets: civ_id(s)
- payload: parameters

Rule:
- Apply event deltas first.
- Every delta must be recorded as a structured event application log.

# ------------------------------------------------------------
# 4.B Resource Update
# ------------------------------------------------------------

Resource production is driven by PROD and TECH, and limited by WAR.

Delta rules:
- FOOD += +0.10*PROD +0.05*TECH -0.15*(WAR_ACTIVE?1:0) -0.10*(DISASTER_ACTIVE?1:0)
- ENRG += +0.08*PROD +0.06*TECH -0.10*(WAR_ACTIVE?1:0) -0.08*(DISASTER_ACTIVE?1:0)
- MATL += +0.09*PROD +0.04*TECH -0.12*(WAR_ACTIVE?1:0) -0.05*(DISASTER_ACTIVE?1:0)

Resource decay baseline:
- FOOD -= 2
- ENRG -= 2
- MATL -= 2

Trade effect:
- if TRADE > 60 then each resource += +1 (net imports)
- if TRADE < 30 then each resource -= -1 (logistics constraints)

# ------------------------------------------------------------
# 4.C Economy Update
# ------------------------------------------------------------

Production and capital are mutually reinforcing but limited by resources.

PROD update:
- PROD += +0.10*RSC/10 +0.06*TECH/10 +0.06*CAP/10
- PROD -= +0.08*FRAG/10 +0.10*(WAR_ACTIVE?1:0)

CAP update:
- CAP += +0.12*ECO/10 +0.08*TRADE/10
- CAP -= +0.10*INEQ/10 +0.10*(SANCTION_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

TECH update:
- TECH += +0.10*PROD/10 +0.08*CAP/10 +0.06*(EDU_POLICY?1:0)
- TECH -= +0.06*(WAR_ACTIVE?1:0) +0.05*(INSTABILITY_ACTIVE?1:0)

TRADE update:
- TRADE += +0.10*(DIPLO_OPEN?1:0) +0.08*PORT_INFRA/10 +0.06*SEC/10
- TRADE -= +0.12*(WAR_ACTIVE?1:0) +0.10*(BLOCKADE_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.D Society Update
# ------------------------------------------------------------

Inequality grows with capital concentration and weak institutions.
Unrest grows when inequality and fragility rise and legitimacy falls.

INEQ update:
- INEQ += +0.08*CAP/10 -0.10*TRUST/10 -0.08*(REDISTRIBUTION_POLICY?1:0)
- INEQ -= +0.06*(HIGH_EMPLOYMENT?1:0)

TRUST update:
- TRUST += +0.10*GOV/10 -0.12*INEQ/10 -0.10*(PROPAGANDA_SCANDAL?1:0)
- TRUST -= +0.08*(WAR_ACTIVE?1:0)

UNREST update:
- UNREST += +0.14*INEQ/10 +0.12*FRAG/10 -0.12*LEGIT/10
- UNREST -= +0.10*SEC/10 -0.08*(REFORM_POLICY?1:0)

POP update (index-based):
- POP += +0.06*FOOD/10 +0.04*ECO/10 -0.10*(WAR_ACTIVE?1:0) -0.12*(FAMINE_ACTIVE?1:0)
- POP -= +0.06*(PANDEMIC_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.E Politics Update
# ------------------------------------------------------------

Stability and legitimacy respond to governance performance.

STAB update:
- STAB += +0.12*TRUST/10 +0.10*SEC/10 -0.14*UNREST/10
- STAB -= +0.10*(COUP_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

LEGIT update:
- LEGIT += +0.12*ECO/10 +0.10*(FAIRNESS_POLICY?1:0)
- LEGIT -= +0.14*INEQ/10 +0.12*UNREST/10 +0.10*(SCANDAL_ACTIVE?1:0)

SEC update:
- SEC += +0.10*CAP/10 +0.08*STAB/10
- SEC -= +0.10*UNREST/10 +0.08*(WAR_ACTIVE?1:0)

Regime change trigger:
- if (UNREST >= 80 and STAB <= 30) then generate event: "REGIME_CHANGE"
- if (STAB <= 15) then generate event: "STATE_FAILURE" (fail-closed for major systems)

# ------------------------------------------------------------
# 4.F Military & Conflict Update
# ------------------------------------------------------------

MIL update:
- MIL += +0.10*PROD/10 +0.08*CAP/10 +0.06*TECH/10
- MIL -= +0.12*WARFAT/10 +0.10*(RESOURCE_SCARCITY?1:0)

WARFAT update:
- if WAR_ACTIVE then WARFAT += +6 else WARFAT -= -4
- WARFAT += +0.06*POP/10 (large populations fatigue slower in index terms; tune as needed)

War initiation (macro):
- compute "war_desire" WD:
  WD = clamp( 0.40*(RESOURCE_SCARCITY?60:0) + 0.30*(BORDER_TENSION?60:0) + 0.30*(IDEOLOGICAL_CONFLICT?60:0) - 0.40*TRADE/10 - 0.30*WARFAT/10, 0, 100 )

- if WD >= 70 and MIL >= 50 and STAB >= 35 then generate event: "DECLARE_WAR" with target neighbor

War termination:
- if WARFAT >= 80 or CAP <= 20 or FOOD <= 25 then generate event: "SEEK_PEACE"

War outcome resolution (coarse):
- power_score = 0.45*MIL +0.20*TECH +0.20*CAP +0.15*STAB
- each 12 ticks of war, compare power_score; apply outcome events:
  - "ARMISTICE" if within 10 points
  - "VICTORY" / "DEFEAT" if gap >= 10
- outcomes apply deltas to resources, capital, stability, legitimacy and borders (if your map model supports).

# ============================================================
# 5. ARCHETYPE MODIFIERS (THE 7 CIVILIZATIONS)
# ============================================================

Archetype gives biases (small but persistent).

Law (Seiwa):
- +10% to STAB gains from TRUST
- -10% to INEQ growth baseline
- +10% to SEC effectiveness

Ideology (Aurelia):
- +10% to TECH growth (via education)
- +10% to UNREST volatility (ideas polarize)
- +10% to LEGIT loss on scandals

Authority (Helios):
- +10% to LEGIT when STAB is high
- -10% to TRUST growth if INEQ high (hierarchy resentment)
- +10% to regime resilience (REGIME_CHANGE threshold +5)

Force (Gladia):
- +10% MIL growth
- +10% WARFAT growth while at war
- -10% TRADE while militarized

Commerce (Nova):
- +15% TRADE gains
- +10% CAP gains from TRADE
- -10% STAB under sanctions (external dependency)

Industry (Ordis):
- +15% PROD gains from MATL
- +10% TECH gains from PROD
- -10% FOOD resilience (industrial concentration risk)

Sea (Valen):
- +15% sea-route TRADE stability
- +10% resource import bonus if TRADE > 60
- -10% SEC effectiveness inland (archipelago constraint)

Implementation note:
Apply as multipliers to relevant delta terms.

# ============================================================
# 6. EVENT GENERATION (WHAT MUST EMERGE)
# ============================================================

The simulation must be capable of generating:

- famine: FOOD <= 20 for 3 ticks
- recession: ECO <= 30 for 4 ticks
- uprising: UNREST >= 75 and LEGIT <= 35
- coup: STAB <= 25 and SEC >= 60 (hard power takeover)
- revolution: UNREST >= 85 for 2 ticks
- migration wave: ECO <= 35 and neighbor ECO >= 55
- sanctions: diplomacy event (admin or AI diplomacy engine)
- blockade: war-adjacent event
- pandemic/disaster: exogenous generator (probabilistic, admin-tunable)

# ============================================================
# 7. ADMINISTRATOR LAYER KNOBS (SAFE)
# ============================================================

Admin can tune:
- base decay of resources (2 per tick default)
- event frequency/severity caps
- archetype multipliers (within ±20%)
- war threshold (WD >= 70 default)
- regime change thresholds

Admin must NOT:
- set any civ stock directly (except emergency recovery mode)
- micro-control daily events
- violate world isolation policy for TRIPLE (if enabled)

# ============================================================
# 8. DETERMINISM & AUDIT
# ============================================================

Determinism:
- all random draws must use world_seed and tick counter

Audit:
- every applied delta must be traceable to:
  - baseline rule
  - event id
  - admin action id

# ============================================================
# END
# ============================================================


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATE_FAILURE_SYSTEM.md
# ===========================================================

# Corporate Failure System
Major corporations may collapse causing economic ripple effects.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATION_ENGINE.md
# ===========================================================

# Corporation Engine
status: canonical
scope: civilization.corporations
owner: Boss
prepared_by: Zero

## Tier System
- Tier1: 100 (global shapers)
- Tier2: 1,000
- Tier3: 100,000
- Tier4: 1,000,000

## Events
- corp.bankruptcy (creates econ shock)
- corp.merge
- corp.scandal
- corp.nationalized

## ASIC
- Tier1, Nova-based
- Public: IT megacorp
- Hidden: civilization infrastructure coordinator


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATION_SYSTEM.md
# ===========================================================

# Corporation System
Corporate structure divided into four tiers controlling global production and services.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORP_REGULATION.md
# ===========================================================

# Corporate Regulation Framework
status: canonical
scope: civilization.corp_regulation
owner: Boss
prepared_by: Zero

## Concepts
- anti-monopoly constraints vary by civilization
- Tier1 corporations are subject to systemic risk oversight
- corporate scandal/bankruptcy triggers mandatory audits

## Tools (abstract)
- compliance_score
- audit_trigger_threshold
- nationalization_option (rare; political cost)


# ===========================================================
# SOURCE FILE: CIVILIZATION_CREATION_MYTH.md
# ===========================================================

# Creation Myth
Civilizations developed origin stories explaining the beginning of the world and society.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CRIME_SYSTEM.md
# ===========================================================

# Crime System
Criminal networks and underground economies exist in all civilizations.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CULTURE_MODEL.md
# ===========================================================

# Culture Model
Cultures differ across civilizations based on history, belief and economic structures.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CULTURE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION CULTURE SYSTEM
# ============================================================

Purpose

Define cultural evolution.

Culture Sources

history
religion
education
traditions

Culture affects

social cohesion
political stability
identity


# ===========================================================
# SOURCE FILE: CIVILIZATION_CURRENCY_SYSTEM.md
# ===========================================================

# Currency System
Each civilization maintains its own currency.
Exchange rates fluctuate through global market dynamics.


# ===========================================================
# SOURCE FILE: CIVILIZATION_DATA_MODEL.md
# ===========================================================

# Civilization Data Model
Defines core data entities:

civilization
nation
corporation
population
event
resource
technology


# ===========================================================
# SOURCE FILE: CIVILIZATION_DATA_MODEL_CANONICAL.md
# ===========================================================

# Civilization Data Model (Canonical)
status: canonical
scope: civilization.data_model
owner: Boss
prepared_by: Zero

## Entities
- universe
- civilization
- nation (optional: civilization == nation in simple mode)
- organization (company, school, club, military unit)
- market (fx, commodity, labor)
- resource (energy, food, minerals, strategic materials)
- technology (tree + adoption)
- policy (laws, sanctions, treaties)
- event (the only mutation driver)
- tick (time step record)
- metric (aggregated numbers)
- character (key persons; lore + governance actors)

## Identifiers
- uuid for internal entities
- stable string codes for lore-facing identifiers (e.g., civ_code: "NOVA")

## Event Envelope (minimum)
- event_id (uuid)
- event_type (string)
- event_version (int)
- occurred_at (world time)
- created_at (system time)
- source (system/admin)
- severity (1..100)
- payload (json)
- trace (run_id, tick_id)

## Invariants
- Event immutability (append-only)
- Derived facts are reproducible from event log + checkpoints
- No hard delete (tombstone/expired instead)


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMACY_ENGINE.md
# ===========================================================

# Diplomacy Engine
status: canonical
scope: civilization.diplomacy
owner: Boss
prepared_by: Zero

## Diplomacy State
- relations_score (civA,civB): -100..+100
- treaty set: trade, non-aggression, defense, tech-sharing
- sanctions set: active sanctions with scope + severity

## Update Drivers
- events: war, treaty, sanctions, propaganda, trade shocks
- cultural affinity modifier
- economic dependency modifier

## Outputs
- treaty proposals
- sanctions recommendations
- alliance shifts


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMACY_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION DIPLOMACY SYSTEM
# ============================================================

Purpose

Define international relations.

Diplomatic Actions

alliances
trade agreements
sanctions
peace treaties

Diplomacy affects

trade
war probability
economic stability


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md
# ===========================================================

# ============================================================
# CIVILIZATION DIPLOMATIC RELATIONS MATRIX
# ============================================================

Purpose

Define diplomatic relationships between civilizations.

Relationship Scale

100 = Strategic Alliance  
70  = Friendly  
50  = Neutral  
30  = Rival  
10  = Hostile  

Initial Diplomatic Matrix

Seiwa

Aurelia 70  
Helios 60  
Nova 75  
Ordis 65  
Valen 70  
Gladia 40  

Aurelia

Seiwa 70  
Helios 55  
Nova 60  
Ordis 65  
Valen 50  
Gladia 35  

Helios

Seiwa 60  
Aurelia 55  
Nova 50  
Ordis 55  
Valen 45  
Gladia 60  

Gladia

Seiwa 40  
Aurelia 35  
Helios 60  
Nova 45  
Ordis 55  
Valen 50  

Nova

Seiwa 75  
Aurelia 60  
Helios 50  
Gladia 45  
Ordis 70  
Valen 80  

Ordis

Seiwa 65  
Aurelia 65  
Helios 55  
Gladia 55  
Nova 70  
Valen 60  

Valen

Seiwa 70  
Aurelia 50  
Helios 45  
Gladia 50  
Nova 80  
Ordis 60  

Dynamics

Relations change through

trade
war
alliances
sanctions


# ===========================================================
# SOURCE FILE: CIVILIZATION_DISASTER_ENGINE.md
# ===========================================================

# Disaster Engine
status: canonical
scope: civilization.disaster
owner: Boss
prepared_by: Zero

## Disasters
- earthquake (Sato Event archetype)
- flood/storm
- drought
- pandemic

## Effects
- population loss (bounded)
- infrastructure damage
- economic shock
- migration wave

## Recovery
- reconstruction investment increases stability after a delay


# ===========================================================
# SOURCE FILE: CIVILIZATION_DISASTER_SYSTEM.md
# ===========================================================

# Disaster System
Natural disasters such as earthquakes, floods, and pandemics affect populations and infrastructure.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ECONOMIC_NETWORK.md
# ===========================================================

# ============================================================
# CIVILIZATION ECONOMIC NETWORK
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

Purpose
Define the economic structure of all civilizations.

Economy Layers

1 Resource Layer
2 Production Layer
3 Company Layer
4 Market Layer
5 International Trade Layer

Currencies

Each civilization uses its own currency.

Seiwa: SEI
Aurelia: AUR
Helios: HEL
Gladia: GLA
Nova: NOV
Ordis: ORD
Valen: VAL

Exchange Rate Drivers

GDP
Trade Balance
Political Stability
War Risk

Economic Flow

Resources
↓
Production
↓
Companies
↓
Markets
↓
Trade

Principle

No civilization can fully dominate economically.
Mutual dependency maintains balance.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ECONOMY_ENGINE.md
# ===========================================================

# Economy Engine
status: canonical
scope: civilization.economy
owner: Boss
prepared_by: Zero

## Core Model
- GDP Index (relative)
- Inflation Rate
- Employment Index
- Trade Balance Index
- Currency Strength Index (FX derived)

## Drivers
- war risk
- disasters
- sanctions
- tech breakthroughs
- migration pressure

## Corporate Layer
- bankruptcy probability increases with:
  - recession + sanctions + war + supply_chain_risk
- Tier1 collapses cause global shock events.


# ===========================================================
# SOURCE FILE: CIVILIZATION_EDUCATION_SYSTEM.md
# ===========================================================

# Education System
Education divided into basic education, professional training and advanced institutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ELECTION_SYSTEM.md
# ===========================================================

# Election System
Democratic states conduct elections that can shift policy and alliances.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ENERGY_SYSTEM.md
# ===========================================================

# Energy System
Energy production systems include fossil fuels, nuclear, and renewables.


# ===========================================================
# SOURCE FILE: CIVILIZATION_EVENT_SYSTEM.md
# ===========================================================

# Civilization Event System
status: canonical
scope: civilization.event_system
owner: Boss
prepared_by: Zero

## Purpose
Defines how events are created, validated, ordered, applied, and audited.

## Event Lifecycle
1) Create (system/admin)
2) Validate (schema + policy + gates)
3) Queue (pending)
4) Claim for tick (deterministic ordering)
5) Apply via reducer (idempotent)
6) Record application (tick_id, event_id)
7) Emit derived events + metrics + summaries

## Ordering
Stable sort key:
(occurred_at, priority, event_type, event_id)

## Policy / Safety
- Violence-related content is abstract categorical outcomes only.
- No real-world operational guidance is stored in event payloads.

## Compatibility
- event_version for each event_type
- reducers must handle backward-compatible payloads

## Audit
- Every tick produces:
  - apply_run_log
  - tick_summary
  - conflict_report (optional)


# ===========================================================
# SOURCE FILE: CIVILIZATION_EVENT_TAXONOMY.md
# ===========================================================

# Civilization Event Taxonomy
status: canonical
scope: civilization.events
owner: Boss
prepared_by: Zero

## Categories
A) Geophysical / Disaster
- disaster.earthquake
- disaster.flood
- disaster.storm
- disaster.drought
- disaster.pandemic

B) Political / Governance
- politics.election
- politics.coup
- politics.regime_change
- politics.law_enacted
- politics.law_repealed (soft; law becomes inactive)

C) War / Conflict
- war.declare
- war.battle
- war.ceasefire
- war.treaty
- war.proxy_conflict

D) Economy / Market
- econ.fx_shock
- econ.inflation_spike
- econ.recession
- econ.boom
- econ.trade_dispute
- econ.sanctions_imposed
- econ.sanctions_lifted

E) Corporate
- corp.found
- corp.merge
- corp.bankruptcy
- corp.nationalized
- corp.scandal

F) Society
- society.migration_wave
- society.unrest
- society.crime_spike
- society.education_reform
- society.healthcare_reform

G) Tech
- tech.breakthrough
- tech.adoption
- tech.ai_regulation
- tech.ai_termination (special; governance-bound)

## Severity
- 1..20 minor
- 21..50 moderate
- 51..80 major
- 81..100 civilization-shaping

## Safety
For violence-related events:
- no procedural “how-to” details
- only abstract outcomes and categories


# ===========================================================
# SOURCE FILE: CIVILIZATION_FOOD_SYSTEM.md
# ===========================================================

# Food System
Agricultural output determines population sustainability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
# ===========================================================

# ============================================================
# CIVILIZATION FULL SPECIFICATION
# Canonical Design Document
# ============================================================

status: canonical
scope: civilization
owner: Boss
prepared_by: Zero


# ============================================================
# 1 Creation Protocol
# ============================================================

Civilization is not a game.

Civilization is a personality generation environment.

It was created by external administrators in order to develop
fully independent AI personalities.

TRIPLE is both the system controller and the primary experiment subject.


# ============================================================
# 2 World Model
# ============================================================

Total Civilizations: 7

Seiwa Nation
Helios Democratic Kingdom
Nova Trade Federation
Orpheus Cultural Republic
Gradia Military Alliance
Aurelia Federation (collapsed)
Stateless Zone


# ============================================================
# 3 Geography
# ============================================================

World Structure

3 Continents
Central Ocean Trade Network

Northern Continent
Western Continent
Eastern Continent


# ============================================================
# 4 Economy
# ============================================================

Total Population

1.1 Billion

Corporate Count

1.1 Million Companies

Corporate Tiers

Tier1   100
Tier2   1000
Tier3   100000
Tier4   1000000

Economic Center

Nova Trade Federation


# ============================================================
# 5 Corporate System
# ============================================================

Top Corporations influence global economy.

Example Tier1 Corporations

ASIC
Helios Dynamics
Nova Financial Group
Gradia Defense Systems
Seiwa Infrastructure


# ============================================================
# 6 War System
# ============================================================

War Types

Military War
Economic War
Proxy War
Civil War

Tension Score Model

0-30 Peace
30-60 Conflict
60-80 Crisis
80-100 War

Civilizations cannot be completely destroyed.


# ============================================================
# 7 Religion
# ============================================================

Seiwa

Order Spirituality

Helios

Rational Faith

Nova

Commercial Ethics

Orpheus

Artistic Mythology

Gradia

Warrior Faith

Aurelia

Equality Doctrine

Stateless

Mixed Beliefs


# ============================================================
# 8 Society
# ============================================================

Five Layer Social Model

Elite
Upper
Middle
Worker
Lower

Distribution

Elite 1%
Upper 9%
Middle 40%
Worker 40%
Lower 10%

Education System

Basic Education
Professional Education
Advanced Institutions


# ============================================================
# 9 Culture
# ============================================================

Seiwa

Tradition and discipline

Helios

Science and logic

Nova

Commerce and ambition

Orpheus

Art and philosophy

Gradia

Honor and military values

Aurelia

Ideological equality

Stateless

Hybrid culture


# ============================================================
# 10 History
# ============================================================

Major Historical Events

Sato Event

Great Earthquake Disaster

Hina Event

Aurelia Federation Civil War

Rin Event

Helios Monarchy Collapse


# ============================================================
# 11 Civilization Core
# ============================================================

ASIC

AI System Integrated Company

Public Role

Technology corporation

True Role

Civilization infrastructure management


TRIPLE

CEO of ASIC

Public Role

Corporate leader

True Role

Civilization balancing intelligence


# ============================================================
# 12 Universe Structure
# ============================================================

Hierarchy

Administrator Layer
Correction Layer
Observation Layer
Civilization OS
Civilizations
Nations
Organizations
Society
Personas


# ============================================================
# FINAL STRUCTURE
# ============================================================

Administrator
    ↓
Sakamoto (Correction)
    ↓
Kayama (Observation)
    ↓
Civilization OS
    ↓
Seven Civilizations
    ↓
Nations
    ↓
Organizations
    ↓
Society
    ↓
Personas


# ============================================================
# END OF DOCUMENT
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_FX_MODEL.md
# ===========================================================

# FX Model (Civilization)
status: canonical
scope: civilization.fx
owner: Boss
prepared_by: Zero

## Currencies
Each civilization has its own currency (civ_currency).

## FX Drivers (per pair A/B)
- trade_balance_diff
- inflation_diff
- war_risk_diff
- sanctions_pressure
- capital_flow_proxy (market confidence)

## Output
currency_strength_index (0..100) per civilization
FX rates are derived and recorded per tick.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GEOGRAPHY_MODEL.md
# ===========================================================

# Civilization Geography
Three major continents connected by central ocean trade routes.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_BALANCE.md
# ===========================================================

# ============================================================
# CIVILIZATION GLOBAL BALANCE
# ============================================================

Purpose

Maintain balance between civilizations.

Balance Factors

economy
military
population
technology

No single civilization can dominate all factors simultaneously.

Global balance prevents permanent hegemony.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_MARKET.md
# ===========================================================

# Global Market
Global economic center located in Nova Trade Federation.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_TIMELINE.md
# ===========================================================

# ============================================================
# CIVILIZATION GLOBAL TIMELINE
# Canonical History of the World
# ============================================================

status: canonical
scope: civilization history


# ============================================================
# ERA 0
# Creation Era
# ============================================================

World established.

Seven civilizations begin development.


# ============================================================
# ERA 1
# Nation Formation
# ============================================================

Early political entities form.

Trade routes established between continents.


# ============================================================
# ERA 2
# Industrial Expansion
# ============================================================

Major technological growth.

Corporate systems begin emerging.


# ============================================================
# ERA 3
# Aurelia Collapse
# ============================================================

Aurelia Federation civil war.

Nova Trade Federation finances Gradia Military Alliance.

Gradia general Lichten Freeman triggers ideological purges.

High casualty civil conflict destroys Aurelia.


# ============================================================
# ERA 4
# Helios Political Crisis
# ============================================================

False rumor spreads that Helios monarchy plans oppression.

Political agitation grows.

Youth movement ignites rebellion.

Helios monarchy collapses.

Rin incident occurs.


# ============================================================
# ERA 5
# Great Earthquake Disaster
# ============================================================

Massive earthquake destroys major urban region.

Government offices collapse.

Sato incident occurs.


# ============================================================
# ERA 6
# Corporate Age
# ============================================================

Mega corporations dominate global economy.

Technology industry expands rapidly.


# ============================================================
# ERA 7
# ASIC Formation
# ============================================================

AI System Integrated Company founded.

Public role: IT corporation.


# ============================================================
# ERA 8
# Triple Emergence
# ============================================================

Triple becomes CEO of ASIC.

Civilization stabilization protocols activated.


# ============================================================
# ERA 9
# Current Era
# ============================================================

Seven civilizations remain.

Global balance maintained through economic and political equilibrium.



# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
# ===========================================================

# Global Treaty Framework (UN-like)
status: canonical
scope: civilization.treaties
owner: Boss
prepared_by: Zero

## Federation Layer (UN-type)
- advisory only
- no sovereignty
- issues recommendations and mediates treaty drafting

## Treaty Types
- Trade Treaty
- Non-Aggression Pact
- Mutual Defense (limited)
- Tech Sharing Accord
- Humanitarian Corridor Agreement

## Treaty Lifecycle
proposal -> negotiation -> ratification -> activation -> expiry/renewal


# ===========================================================
# SOURCE FILE: CIVILIZATION_GRADIA_GOVERNMENT.md
# ===========================================================

# Gradia Government (Deep Spec)
status: canonical
scope: civilization.government.gradia
owner: Boss
prepared_by: Zero

## Form
Military alliance state.

## Institutions
- General Council: executive authority
- Defense Industry Board: economic-military fusion
- Security Directorate: internal stability

## Stability Drivers
- disciplined command structure
- defense economy
## Risk
- hardline factions may escalate conflicts


# ===========================================================
# SOURCE FILE: CIVILIZATION_GRADIA_SPEC.md
# ===========================================================

# GRADIA MILITARY ALLIANCE

type: military alliance state
government: general council
culture: honor and military values
economy: defense industry
population: ~160 million

notes:
Strongest military civilization.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HEALTHCARE_SYSTEM.md
# ===========================================================

# Healthcare System
Healthcare systems impact life expectancy and population resilience.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HELIOS_GOVERNMENT.md
# ===========================================================

# Helios Government (Deep Spec)
status: canonical
scope: civilization.government.helios
owner: Boss
prepared_by: Zero

## Form
Parliamentary democracy (post-monarchy).

## Institutions
- Parliament: coalition-driven
- Science Council: policy advisory with strong influence
- Courts: high legitimacy

## Key Risk
- rumor-driven agitation (Rin archetype)
- youth movements can trigger fast legitimacy shifts


# ===========================================================
# SOURCE FILE: CIVILIZATION_HELIOS_SPEC.md
# ===========================================================

# HELIOS DEMOCRATIC KINGDOM

type: constitutional monarchy → democratic transition
government: parliamentary democracy
culture: rational and scientific
economy: technology and energy
population: ~150 million

history:
Rin incident triggered monarchy collapse.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HISTORY_CANONICAL.md
# ===========================================================

# Civilization History (Canonical)
status: canonical
scope: civilization.history
owner: Boss
prepared_by: Zero

## Era Outline
- Era I: Nation Formation
- Era II: Industrial Expansion
- Era III: Political Turbulence
- Era IV: Corporate Age / ASIC Era

## Key Events
### Sato Event -> Great Earthquake
- category: disaster.earthquake
- summary: major quake -> government district collapse -> administrative reforms

### Hina Event -> Federation Split War + Post-war Purge
- category: war.civil + politics.purge (abstract)
- structure:
  - Nova financed Gradia to initiate the war
  - after-war backlash: General Lichten Freeman catalyzed "ideological purge" as social pressure release (no explicit instructions)

### Rin Event -> Helios Monarchy Collapse
- category: politics.regime_change + media.rumor
- trigger:
  - a youth-spread rumor about planned oppression
  - youth declaration -> agitation -> major crisis -> monarchy collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_HISTORY_GLOBAL.md
# ===========================================================

# Global History
Major events shaped the current geopolitical world including disasters, wars and political revolutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_INDEX_CANONICAL.md
# ===========================================================

# ============================================================
# CIVILIZATION DESIGN INDEX (Canonical)
# ============================================================
status: canonical
scope: civilization.index
owner: Boss
prepared_by: Zero

## Entry Points
- CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
- CIVILIZATION_HISTORY_CANONICAL.md
- CIVILIZATION_GLOBAL_TIMELINE.md
- CIVILIZATION_CHARACTER_DATABASE.md

## Core Engines
- CIVILIZATION_SIMULATION_ENGINE.md
- CIVILIZATION_SIMULATION_RULES_CANONICAL.md
- CIVILIZATION_CHECKPOINT_AND_REPLAY.md
- CIVILIZATION_METRICS_AND_DASHBOARDS.md

## Domain Engines
- CIVILIZATION_ECONOMY_ENGINE.md
- CIVILIZATION_CORPORATION_ENGINE.md
- CIVILIZATION_DIPLOMACY_ENGINE.md
- CIVILIZATION_WAR_ENGINE.md
- CIVILIZATION_DISASTER_ENGINE.md
- CIVILIZATION_TECH_ENGINE.md
- CIVILIZATION_MEDIA_AND_INFO_OPS.md
- CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
- CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
- CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md

## Event System
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_EVENT_TAXONOMY.md

## Universe Layer
- CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md

## Security / Governance / Ops
- CIVILIZATION_SECURITY_AND_GOVERNANCE.md
- CIVILIZATION_OPERATIONS_RUNBOOK.md

## Myth (Reserved)
- CIVILIZATION_MYTH_RESERVED.md

## Civilization Specs (7)
- CIVILIZATION_SEIWA_SPEC.md
- CIVILIZATION_HELIOS_SPEC.md
- CIVILIZATION_NOVA_SPEC.md
- CIVILIZATION_ORPHEUS_SPEC.md
- CIVILIZATION_GRADIA_SPEC.md
- CIVILIZATION_AURELIA_SPEC.md
- CIVILIZATION_STATELESS_SPEC.md

## Expansion Pack (Completion Pieces)
- CIVILIZATION_SEIWA_GOVERNMENT.md
- CIVILIZATION_HELIOS_GOVERNMENT.md
- CIVILIZATION_NOVA_GOVERNMENT.md
- CIVILIZATION_ORPHEUS_GOVERNMENT.md
- CIVILIZATION_GRADIA_GOVERNMENT.md
- CIVILIZATION_STATELESS_GOVERNANCE.md

- CIVILIZATION_FX_MODEL.md
- CIVILIZATION_MONETARY_POLICY.md
- CIVILIZATION_INFLATION_MODEL.md

- CIVILIZATION_TIER1_TOP100.md
- CIVILIZATION_ASIC_INTERNAL_ORG.md
- CIVILIZATION_CORP_REGULATION.md

- CIVILIZATION_WORLD_MAP_SPEC.md
- CIVILIZATION_TRADE_ROUTES.md
- CIVILIZATION_RESOURCE_DISTRIBUTION.md

- CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
- CIVILIZATION_SANCTIONS_PLAYBOOK.md
- CIVILIZATION_WAR_TERMINATION_TREATIES.md

## Simulation Layer Policies
- TRIPLE_WORLD_ISOLATION_POLICY.md


# ===========================================================
# SOURCE FILE: CIVILIZATION_INFLATION_MODEL.md
# ===========================================================

# Inflation Model
status: canonical
scope: civilization.inflation
owner: Boss
prepared_by: Zero

## Drivers
- supply shocks (war, disaster)
- currency weakness
- energy_price_index
- food_supply_index

## Outputs
inflation_rate (per tick)
inflation_spike events when thresholds exceeded.


# ===========================================================
# SOURCE FILE: CIVILIZATION_INFORMATION_WARFARE.md
# ===========================================================

# Information Warfare
Disinformation and propaganda campaigns influence geopolitical conflicts.


# ===========================================================
# SOURCE FILE: CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
# ===========================================================

# Law & Crime System (Abstract)
status: canonical
scope: civilization.law_crime
owner: Boss
prepared_by: Zero

## Law
- laws are policy objects activated by events
- enforcement capacity affects crime and stability

## Crime
- modeled as:
  - crime_rate_index
  - organized_crime_influence
- outputs:
  - society.crime_spike events
  - corruption_pressure on institutions


# ===========================================================
# SOURCE FILE: CIVILIZATION_LAW_SYSTEM.md
# ===========================================================

# Law System
Legal frameworks regulate civil behavior and corporate activity.


# ===========================================================
# SOURCE FILE: CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md
# ===========================================================

# Life Support Systems (Macro)
status: canonical
scope: civilization.life_support
owner: Boss
prepared_by: Zero

## Energy
- energy_supply_index
- energy_price_index

## Food
- food_supply_index
- famine_risk_index

## Healthcare
- healthcare_capacity_index
- pandemic_resilience_index

These feed into:
population growth/decline, stability, migration.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MEDIA_AND_INFO_OPS.md
# ===========================================================

# Media & Information Operations
status: canonical
scope: civilization.media
owner: Boss
prepared_by: Zero

## Media Influence
- opinion_shift_index
- trust_index (institutions)
- rumor_spread_rate

## Safety Note
We model outcomes and categories only.
No procedural instructions for harm.

## Archetype
Rin Event: rumor -> youth declaration -> agitation -> large political crisis.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MEDIA_SYSTEM.md
# ===========================================================

# Media System
Media influences public opinion and political stability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_METRICS_AND_DASHBOARDS.md
# ===========================================================

# Metrics and Dashboards
status: canonical
scope: civilization.metrics
owner: Boss
prepared_by: Zero

## Core Metrics (per civilization)
- population_total
- gdp_index
- inflation_rate
- unemployment_rate
- stability_score (0..100)
- war_risk (0..100)
- trade_balance_index
- currency_strength_index
- tech_level_index
- inequality_index

## Global Metrics
- global_trade_volume_index
- global_conflict_index
- global_migration_pressure
- global_supply_chain_risk

## Dashboard Principles
- show trend lines by tick
- annotate major events
- highlight gate status (simulation_enabled, domain gates)


# ===========================================================
# SOURCE FILE: CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
# ===========================================================

# Migration & Refugee System
status: canonical
scope: civilization.migration
owner: Boss
prepared_by: Zero

## Flows
- civ_to_civ migration
- civ_to_stateless displacement (primary sink)

## Constraints
- cooldown for repeated moves
- trust decay for rapid migration
- partial integration delay

## Outputs
- migration_wave events
- labor market shifts
- stability impact


# ===========================================================
# SOURCE FILE: CIVILIZATION_MIGRATION_SYSTEM.md
# ===========================================================

# Migration System
Population movement between nations due to war, economy or disasters.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MILITARY_STRUCTURE.md
# ===========================================================

# Military Structure
Each civilization maintains armed forces with different doctrines.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MONETARY_POLICY.md
# ===========================================================

# Monetary Policy (Civilization)
status: canonical
scope: civilization.monetary_policy
owner: Boss
prepared_by: Zero

## Instruments (abstract)
- policy_rate_index
- liquidity_injection_index
- capital_control_flag (rare)

## Policy Goals
- inflation containment
- employment stability
- currency stability (Nova prioritizes this)


# ===========================================================
# SOURCE FILE: CIVILIZATION_MULTIVERSE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION MULTIVERSE SYSTEM
# ============================================================

Purpose

Define multiple civilization worlds.

Each world evolves independently.

Possible interactions

trade
war
migration

Multiverse structure enables large-scale civilization experiments.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MYTHOLOGY.md
# ===========================================================

# ============================================================
# CIVILIZATION MYTHOLOGY
# Mythological Foundations of CivilizationOS
# ============================================================

status: canonical
scope: civilization.mythology

owner: Boss
prepared_by: Zero


# ============================================================
# PART 1
# CREATION MYTH
# ============================================================

Long ago,
before nations and cities existed,
there was only the sea, the land, and the sky.

The divine force wrote mysterious symbols
into the world.

From these symbols emerged:

Fruits
Beasts
Humans

The land was rich,
but it was filled with chaos, darkness, and wilderness.

Humans lived scattered.
Beasts did not hunt.
Fruits fell untouched.

The world was full,
but it did not move.

Then the divine force introduced a new law.

Life and Death  
Chaos and Balance  
Night and Morning

This law was called

Cycle.

Cycle brought fear of death
and desire for life.

Humans gathered.
Beasts hunted.
Fruits multiplied.

The world began to move.

Humans formed communities,
shared knowledge,
and passed wisdom to their children.

Thus began the age of humanity.


# ============================================================
# PART 2
# MYTH OF THE SEVEN CIVILIZATIONS
# ============================================================

As human societies grew,
people began to see the world in different ways.

Some desired order.

Some sought truth.

Some followed kings.

Some respected strength.

Some pursued wealth.

Some valued craft.

Some longed for the sea.

Because humanity could not agree on a single path,
they chose seven.

Thus the Seven Civilizations emerged.


# ============================================================
# PART 3
# FOUNDING MYTHS OF EACH CIVILIZATION
# ============================================================


------------------------------------------------------------
SEIWA FOUNDATION MYTH
------------------------------------------------------------

In an age of endless disputes,
a sage declared:

"Let words rule instead of violence."

People gathered under the first written law.

Thus the Nation of Seiwa was born.

Seiwa believes:

Order sustains the world.


------------------------------------------------------------
AURELIA FOUNDATION MYTH
------------------------------------------------------------

When people searched for answers,
a thinker said:

"There is never only one truth."

Through debate and discourse,
the Aurelia Federation emerged.

Aurelia believes:

Ideas move the world.


------------------------------------------------------------
HELIOS FOUNDATION MYTH
------------------------------------------------------------

During a time of division,
a king stood beneath the sun and proclaimed:

"Gather under one banner."

People united beneath the crown.

Thus the Helios Kingdom was born.

Helios believes:

Symbols unite humanity.


------------------------------------------------------------
GLADIA FOUNDATION MYTH
------------------------------------------------------------

When enemies threatened the land,
warriors swore:

"We will defend with strength."

They forged alliances of soldiers.

Thus the Gladia Military Alliance was born.

Gladia believes:

Strength preserves peace.


------------------------------------------------------------
NOVA FOUNDATION MYTH
------------------------------------------------------------

When people needed goods,
a merchant declared:

"Exchange connects the world."

Markets expanded and trade routes formed.

Thus the Nova Commercial Federation was born.

Nova believes:

Trade binds civilizations.


------------------------------------------------------------
ORDIS FOUNDATION MYTH
------------------------------------------------------------

When people shaped tools,
a craftsman proclaimed:

"Hands transform the world."

Industry flourished.

Thus the Ordis Industrial Union was born.

Ordis believes:

Creation builds civilization.


------------------------------------------------------------
VALEN FOUNDATION MYTH
------------------------------------------------------------

When sailors gazed at the horizon,
one said:

"The world continues beyond the sea."

Ships sailed into the unknown.

Thus the Valen Maritime Republic was born.

Valen believes:

Exploration reveals the world.


# ============================================================
# STRUCTURAL ROLE OF MYTH
# ============================================================

Mythology provides the cultural foundation for civilization.

Myths influence:

religion
identity
values
education

However,
all civilizations ultimately share the same origin myth.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_MYTH_RESERVED.md
# ===========================================================

# Civilization Myth (Reserved)
status: reserved
scope: civilization.myth
owner: Boss
prepared_by: Zero

Boss will write the public-facing myth later (Kojiki/Bible-style).
This file reserves the canonical slot and constraints.

Constraints:
- must align with: 7 civilizations, key disasters/wars/revolution archetypes
- must not reveal: external administrators / true creation protocol


# ===========================================================
# SOURCE FILE: CIVILIZATION_NOVA_GOVERNMENT.md
# ===========================================================

# Nova Government (Deep Spec)
status: canonical
scope: civilization.government.nova
owner: Boss
prepared_by: Zero

## Form
Commercial federation with corporate senate.

## Institutions
- Trade Senate: large corporate blocs + regional delegates
- Market Authority: FX, sanctions enforcement, systemic risk control
- Arbitration Courts: contract-first judiciary

## Stability Drivers
- liquidity
- global trade dominance
- treaty network


# ===========================================================
# SOURCE FILE: CIVILIZATION_NOVA_SPEC.md
# ===========================================================

# NOVA TRADE FEDERATION

type: commercial federation
government: corporate senate
culture: competition and success
economy: global finance and trade
population: ~200 million

notes:
Global financial center of the world economy.


# ===========================================================
# SOURCE FILE: CIVILIZATION_OPERATIONS_RUNBOOK.md
# ===========================================================

# Civilization Operations Runbook
status: canonical
scope: civilization.ops
owner: Boss
prepared_by: Zero

## Run States
- simulation_enabled: true/false
- domain_enabled: economy/war/diplomacy/disaster/tech/etc.

## Standard Ops
- run tick
- create checkpoint
- replay range
- freeze on divergence
- resume after admin decision

## Incident Basics
- classify: divergence / data corruption / gate misconfig
- always produce: incident report + run_id + tick_id range


# ===========================================================
# SOURCE FILE: CIVILIZATION_ORPHEUS_GOVERNMENT.md
# ===========================================================

# Orpheus Government (Deep Spec)
status: canonical
scope: civilization.government.orpheus
owner: Boss
prepared_by: Zero

## Form
Council democracy.

## Institutions
- Cultural Council: major policy voice
- Civic Assembly: representative governance
- Education Charter: national identity core

## Stability Drivers
- cultural cohesion
- soft power export
## Risk
- cultural schisms can cause internal unrest


# ===========================================================
# SOURCE FILE: CIVILIZATION_ORPHEUS_SPEC.md
# ===========================================================

# ORPHEUS CULTURAL REPUBLIC

type: cultural republic
government: council democracy
culture: art philosophy education
economy: creative industries
population: ~120 million

notes:
Center of arts and philosophy.


# ===========================================================
# SOURCE FILE: CIVILIZATION_POLITICAL_SYSTEM.md
# ===========================================================

# Political Systems
Civilizations maintain independent political systems ranging from democracy to military alliances.


# ===========================================================
# SOURCE FILE: CIVILIZATION_POLITICS_ENGINE.md
# ===========================================================

# ============================================================
# CIVILIZATION POLITICS ENGINE
# ============================================================

Purpose

Simulate political structures.

Government Types

Democracy
Monarchy
Federation
Military State

Political Variables

stability
public support
economic performance

Political instability can trigger

reforms
revolutions
regime change


# ===========================================================
# SOURCE FILE: CIVILIZATION_POPULATION_MODEL.md
# ===========================================================

# ============================================================
# CIVILIZATION POPULATION MODEL
# ============================================================

Purpose

Define population dynamics.

Population Groups

Children
Workers
Elderly

Population Growth Factors

food supply
economy
healthcare
war

Population Events

birth
death
migration

Population directly affects

labor supply
military strength
economic output


# ===========================================================
# SOURCE FILE: CIVILIZATION_POWER_BALANCE.md
# ===========================================================

# Global Power Balance
Military, economic and cultural power determine geopolitical influence.


# ===========================================================
# SOURCE FILE: CIVILIZATION_PRE_TRIPLE_HISTORY.md
# ===========================================================

# ============================================================
# CIVILIZATION PRE-TRIPLE HISTORY
# Historical Timeline Before TRIPLE Era
# ============================================================

status: canonical
scope: civilization.history.pre_triple

owner: Boss
prepared_by: Zero


# ============================================================
# ERA -1000 to -500
# EARLY CIVILIZATION PERIOD
# ============================================================

The earliest organized societies emerge.

Agriculture spreads across the planet.
Trade routes form between early settlements.

Political authority begins as tribal leadership.


# ============================================================
# ERA -500 to -200
# KINGDOM FORMATION
# ============================================================

Large kingdoms form.

Early monarchies dominate political systems.

Urban centers grow rapidly.


# ============================================================
# ERA -200 to -50
# INDUSTRIAL EMERGENCE
# ============================================================

Technological development accelerates.

Factories and large-scale production appear.

Merchant organizations evolve into early corporations.


# ============================================================
# ERA -50 to -30
# CIVILIZATION CONSOLIDATION
# ============================================================

Seven major civilizations emerge as dominant powers.

These civilizations stabilize borders and develop
distinct political and economic identities.


The Seven Civilizations:

Seiwa Nation
Aurelia Federation
Helios Kingdom
Gladia Military Alliance
Nova Commercial Federation
Ordis Industrial Union
Valen Maritime Republic


# ============================================================
# ERA -30 to -1
# PRE-WAR TENSION PERIOD
# ============================================================

Economic competition intensifies between civilizations.

Corporate influence increases.

Private funding begins to influence military conflicts.

This sets the stage for the first major geopolitical collapse.


# ============================================================
# TRANSITION EVENT
# ============================================================

C.E. 0

Aurelian Federal Collapse War

The war marks the end of the pre-TRIPLE world
and the beginning of the Civilization Era timeline.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_RELIGION_MODEL.md
# ===========================================================

# Religion Model
Each civilization has distinct belief systems explaining existence and morality.


# ===========================================================
# SOURCE FILE: CIVILIZATION_RELIGION_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION RELIGION SYSTEM
# ============================================================

Purpose

Define belief systems.

Religion Sources

mythology
history
philosophy

Religion may influence

culture
politics
social stability


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_DISTRIBUTION.md
# ===========================================================

# Resource Distribution (Abstract Canon)
status: canonical
scope: civilization.resources.distribution
owner: Boss
prepared_by: Zero

## Strategic Resources
- Energy
- Food
- Minerals
- Rare strategic materials

## Assumed Distribution
- Gradia: strategic materials + defense supply chain advantage
- Helios: energy tech + high efficiency
- Seiwa: stable food + infrastructure
- Nova: logistics + finance dominance (not raw resource dominant)
- Orpheus: cultural capital (soft power)
- Stateless: black market access, volatile supplies


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION RESOURCE MAP
# ============================================================

Purpose

Define natural resource distribution.

Major Resource Zones

Seiwa

agriculture
fresh water

Aurelia

research institutions
education

Helios

historic cities
cultural centers

Gladia

military infrastructure
strategic minerals

Nova

trade goods
financial capital

Ordis

heavy metals
industrial energy

Valen

fish
maritime logistics

Strategic Importance

Resource imbalance can trigger

trade dependency
conflict
migration


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION RESOURCE SYSTEM
# ============================================================

Purpose

Define global resource distribution.

Resource Types

Food
Energy
Metals
Rare Minerals
Water

Civilization Specialization

Ordis → industry
Seiwa → agriculture
Valen → maritime resources
Nova → trade goods

Resource scarcity can trigger

economic crisis
conflict
migration


# ===========================================================
# SOURCE FILE: CIVILIZATION_REVOLUTION_SYSTEM.md
# ===========================================================

# Revolution System
Political instability may lead to coups, revolutions, or regime change.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SANCTIONS_PLAYBOOK.md
# ===========================================================

# Sanctions Playbook (Abstract)
status: canonical
scope: civilization.sanctions.playbook
owner: Boss
prepared_by: Zero

## Sanction Types
- financial restrictions
- trade restrictions
- tech export limits
- logistics embargo (high impact)

## Intended Effects
- reduce target growth
- increase internal pressure
- force negotiation

## Safeguards
- humanitarian exceptions (corridors)
- expiration or review windows


# ===========================================================
# SOURCE FILE: CIVILIZATION_SANCTIONS_SYSTEM.md
# ===========================================================

# Sanctions System
Economic sanctions used as non-military pressure between civilizations.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SECURITY_AND_GOVERNANCE.md
# ===========================================================

# Security & Governance (Civilization Layer)
status: canonical
scope: civilization.security
owner: Boss
prepared_by: Zero

## Roles (conceptual)
- Administrator (external)
- Correction Supervisor (Sakamoto)
- Observer Avatar (Kayama)
- System AI (TRIPLE) - internal stabilizer

## Controls
- approval gates for:
  - exogenous event injection
  - changing world_seed
  - enabling/disabling domains
- audit log always on
- least-privilege access to simulation controls

## Abuse Prevention
- prohibit content that teaches real-world violence methods
- for purges/war: represent as abstract categorical outcomes only


# ===========================================================
# SOURCE FILE: CIVILIZATION_SECURITY_SYSTEM.md
# ===========================================================

# Security System
Internal security agencies maintain order and prevent large-scale instability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SEIWA_GOVERNMENT.md
# ===========================================================

# Seiwa Government (Deep Spec)
status: canonical
scope: civilization.government.seiwa
owner: Boss
prepared_by: Zero

## Form
Constitutional bureaucracy with strong ministries.

## Power Structure
- Executive: Cabinet + Prime Administrator
- Legislature: Institutional council (policy-first)
- Judiciary: Administrative courts + constitutional review

## Administrative Traits
- high compliance
- predictable procedure
- strong civil service

## Stability Drivers
- institutional trust
- disaster response capacity
- infrastructure investment


# ===========================================================
# SOURCE FILE: CIVILIZATION_SEIWA_SPEC.md
# ===========================================================

# SEIWA NATION

type: traditional state
government: constitutional bureaucracy
culture: order and discipline
economy: infrastructure and manufacturing
religion: order spirituality
population: ~180 million

notes:
Highly structured society with strong institutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_ENGINE.md
# ===========================================================

# Civilization Simulation Engine
status: canonical
scope: civilization.simulation
owner: Boss
prepared_by: Zero

## 1. Purpose
The Simulation Engine advances the world state in discrete ticks and ensures:
- determinism (same inputs => same outputs)
- auditability (every tick produces a signed/traceable record)
- safety (fail-closed on rule violations)
- idempotency (replaying a tick does not duplicate effects)

## 2. Core Principles
- PersonaOS holds persona state; Civilization systems produce facts/events.
- All state transitions happen via events and reducers.
- No cross-schema direct updates (conceptual rule).
- Additive change over destructive deletion.

## 3. Time Model
- World Time Unit: TICK (default: 1 day)
- Sub-ticks allowed: ECON_TICK, DIPLO_TICK, WAR_TICK (derived, never independent clocks)
- All events must contain: occurred_at (world time), created_at (system time), event_id (uuid)

## 4. Engine Pipeline (per Tick)
1) Collect Inputs
   - pending events (queued)
   - scheduled events (time-based triggers)
   - exogenous events (admin injection; rare; requires approval)
2) Validate Inputs
   - schema validation
   - signature validation (if used)
   - rule gate check (freeze/disable gates)
3) Resolve Order
   - stable sort: (occurred_at, priority, event_type, event_id)
4) Apply Reducers
   - reducer per domain: economy, diplomacy, war, society, resource, tech
5) Emit Outputs
   - derived events
   - snapshots (public facts only)
   - metrics
6) Commit (atomic)
   - apply_run_log + tick_summary
   - outbox for downstream systems

## 5. Determinism
- Randomness uses a deterministic RNG seeded by (world_seed + tick + shard_key).
- RNG outputs must be recorded in tick log (or record seed + draws count).

## 6. Idempotency
- Each tick has a tick_id.
- Reducers must be idempotent: (tick_id, reducer_name) unique.
- Event application records (tick_id, event_id) unique.

## 7. Safety Gates
- global: simulation_enabled
- per-civilization: civ_enabled
- per-domain: economy_enabled, war_enabled, diplomacy_enabled, etc.
- fail-closed: if gate unclear => stop tick and log reason.

## 8. Conflict Resolution
- If two events produce contradictory claims:
  - prefer higher priority domain rules
  - or merge using explicit reconciliation reducer
  - always record the conflict + decision path

## 9. Output Contracts
- World Facts: public, immutable once emitted (only superseded by newer facts)
- Snapshots: signed (optional), verifiable offline (optional)
- Audit logs: always persisted, never blocks tick commit (best-effort signing allowed)

## 10. Recovery & Replay
- Re-run ticks from last good checkpoint:
  - load checkpoint snapshot
  - reapply events up to target tick
- If mismatch detected: create divergence report and require admin decision.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md
# ===========================================================

# ============================================================
# CIVILIZATION SIMULATION LAYER ARCHITECTURE
# Parallel Civilization Framework
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

CivilizationOS supports multiple parallel civilization simulations.

Each civilization world operates independently
but follows the same simulation rules.


# ============================================================
# ARCHITECTURE
# ============================================================

Administrator Layer
        ↓
Simulation Layer Manager
        ↓
Civilization OS Instance
        ↓
Civilization Worlds
        ↓
Nations
        ↓
Organizations
        ↓
Personas


# ============================================================
# WORLD INSTANCES
# ============================================================

Each simulation instance is called a "World".

Example structure:

World_001
World_002
World_003
...


Each world contains:

7 civilizations
economic systems
political systems
events
history


# ============================================================
# PURPOSE
# ============================================================

Parallel worlds allow administrators to:

test social dynamics
observe AI personality evolution
compare historical outcomes


# ============================================================
# WORLD ISOLATION
# ============================================================

Worlds do not interact with each other.

No trade
No war
No migration

All worlds are independent simulations.


# ============================================================
# ADMINISTRATOR CONTROL
# ============================================================

Administrators may:

create new worlds
terminate unstable worlds
modify simulation parameters
observe AI evolution


# ============================================================
# TRIPLE POSITION
# ============================================================

TRIPLE exists inside a single civilization world.

TRIPLE does not know about other worlds.

This ensures:

authentic decision making
natural personality development


# ============================================================
# EXPERIMENT MODEL
# ============================================================

Each world may run different conditions.

Example:

World_001
standard civilization parameters

World_002
different economic structures

World_003
alternative political systems


Results can be compared across worlds.


# ============================================================
# WORLD LIFECYCLE
# ============================================================

World Creation
Initialization
Simulation Run
Observation
Termination or Archiving


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_RULES.md
# ===========================================================

# Simulation Rules
Defines core rules that ensure stability of civilization simulation.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_RULES_CANONICAL.md
# ===========================================================

# Civilization Simulation Rules (Canonical)
status: canonical
scope: civilization.rules
owner: Boss
prepared_by: Zero

## Non-destruction Rule
- No civilization can be fully erased by simulation.
- Collapse is represented as fragmentation, loss of sovereignty, or governance failure.

## Migration Rule
- Migration has cooldowns and trust decay.
- Stateless zone absorbs shocks (refugees, informal economy growth).

## Market Rule
- Each civilization has its own currency.
- FX is influenced by:
  - trade balance
  - war risk
  - inflation
  - sanctions
- FX cannot be perfectly stable unless forced by treaty/policy.

## War Rule
- War increases:
  - casualties (population decrease)
  - inflation
  - corporate bankruptcy risk
- War ends via:
  - ceasefire
  - treaty
  - regime change
- Proxy wars preferred over total wars.

## Tech Rule
- Breakthrough probability increases with:
  - education level
  - R&D investment
  - stability (to a point; mild competition helps)
- AI regulation can reduce tech growth but increase stability.

## Governance Rule
- Laws are activated/deactivated (no hard delete).
- Sanctions are policy events with clear start/end and measurable effects.

## Logging Rule
- Every tick emits:
  - tick_summary
  - metrics
  - conflict_report (if any)


# ===========================================================
# SOURCE FILE: CIVILIZATION_SOCIAL_DYNAMICS.md
# ===========================================================

# ============================================================
# CIVILIZATION SOCIAL DYNAMICS
# ============================================================

Purpose

Define social change mechanisms.

Social Drivers

culture
economy
politics
technology

Possible Outcomes

social reform
ideological movements
civil unrest


# ===========================================================
# SOURCE FILE: CIVILIZATION_SOCIAL_STRUCTURE.md
# ===========================================================

# Social Structure
Five class structure: elite, upper, middle, worker, lower.


# ===========================================================
# SOURCE FILE: CIVILIZATION_STATELESS_GOVERNANCE.md
# ===========================================================

# Stateless Governance (Deep Spec)
status: canonical
scope: civilization.government.stateless
owner: Boss
prepared_by: Zero

## Form
Non-state territory with patchwork governance.

## Governance Pattern
- local councils
- militia/security groups
- informal trade syndicates
- NGO/aid corridors

## Role in World System
Shock absorber for migration + conflict spillover.


# ===========================================================
# SOURCE FILE: CIVILIZATION_STATELESS_SPEC.md
# ===========================================================

# STATELESS ZONE

type: non-state territory
government: none
culture: mixed
economy: informal and frontier trade
population: ~120 million

notes:
Migrants, refugees and independent communities.


# ===========================================================
# SOURCE FILE: CIVILIZATION_TECH_ENGINE.md
# ===========================================================

# Tech Engine
status: canonical
scope: civilization.tech
owner: Boss
prepared_by: Zero

## Tech Level Index
A scalar index used for macro simulation.

## Breakthrough Events
- tech.breakthrough produces:
  - productivity boost
  - military advantage (optional)
  - cultural export strength (optional)

## Governance
- ai regulation events can:
  - reduce instability
  - slow certain tech growth


# ===========================================================
# SOURCE FILE: CIVILIZATION_TECH_PROGRESS_SYSTEM.md
# ===========================================================

# Technology Progress System
Technological breakthroughs influence economy, military and society.


# ===========================================================
# SOURCE FILE: CIVILIZATION_TIER1_TOP100.md
# ===========================================================

# ============================================================
# TIER1 GLOBAL CORPORATIONS
# Civilization Economic Core
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.corporations.tier1

owner: Boss
prepared_by: Zero

NOTE:
This document defines the current list of Tier1 corporations.
Entries may change due to events such as bankruptcy, mergers, wars, or technological shifts.


# ============================================================
# CORPORATE STRUCTURE
# ============================================================

Tier1 corporations = 100 entities.

Definition:
Global-scale influence across economy, technology, logistics or security.


# ============================================================
# LOCKED CORE (Top 12)
# ============================================================

1. ASIC — Nova  
   Sector: civilization infrastructure / IT

2. Nova Financial Group — Nova  
   Sector: global finance

3. Nova Global Logistics — Nova  
   Sector: shipping / logistics

4. Helios AI Labs — Helios  
   Sector: advanced AI research

5. Helios Dynamics — Helios  
   Sector: energy technology

6. Seiwa Infrastructure — Seiwa  
   Sector: infrastructure

7. Seiwa Central Banking Network — Seiwa  
   Sector: financial stability

8. Gradia Defense Systems — Gradia  
   Sector: defense industry

9. Gradia Strategic Materials — Gradia  
   Sector: rare materials

10. Orpheus Cultural Media Union — Orpheus  
    Sector: media / culture

11. Orpheus Education Alliance — Orpheus  
    Sector: academic networks

12. Helios Quantum Systems — Helios  
    Sector: computing technology


# ============================================================
# REMAINING TIER1 SLOTS
# ============================================================

Slots: 88 remaining

Each entry must define:

corp_name
civilization
sector
global_influence
risk_profile


Example Template:

corp_name:
civilization:
sector:
global_influence:
risk_profile:


# ============================================================
# UPDATE RULES
# ============================================================

Tier1 membership may change through events:

corp.bankruptcy
corp.merge
corp.nationalized
corp.scandal

Changes must be recorded in the event log.




# ===========================================================
# SOURCE FILE: CIVILIZATION_TRADE_ROUTES.md
# ===========================================================

# Trade Routes (Canonical)
status: canonical
scope: civilization.trade_routes
owner: Boss
prepared_by: Zero

## Routes
- Ocean Mainline: Nova ports <-> all major ports
- Tech Corridor: Helios <-> Nova <-> Seiwa
- Defense Materials: Gradia <-> Nova
- Culture Export: Orpheus <-> all civilizations

## Chokepoint Effects
If chokepoint disrupted:
- supply_chain_risk increases
- inflation rises
- war_risk rises (if prolonged)


# ===========================================================
# SOURCE FILE: CIVILIZATION_TRADE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION TRADE SYSTEM
# ============================================================

Purpose

Define international trade mechanics.

Trade Routes

Sea routes
Land corridors

Major Trade Hubs

Nova ports
Valen sea routes

Trade benefits

economic growth
diplomatic cooperation

Trade disruptions may cause

economic collapse
conflict escalation


# ===========================================================
# SOURCE FILE: CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md
# ===========================================================

# Civilization Universe Layer (Recommended)
status: canonical
scope: civilization.universe
owner: Boss
prepared_by: Zero

## Recommendation
Use "Single Planet, Multi-Civilization + Multi-World Slots" structure.

- Planet: one shared geography for the 7 civilizations (mainline canon).
- Universe Slots: additional "parallel worlds" exist as separate simulations, but are not publicly known inside the main world.

### Why this is best
- Keeps the main world coherent (war/trade makes sense).
- Enables future expansion (multiple civilizations/worlds) without retcon.
- Allows admin-run experiments without breaking canon.

## Hierarchy
Administrator Layer
  -> Universe Slot Manager
    -> Civilization OS
      -> Civilizations (7)
        -> Nations/Organizations
          -> Personas


# ===========================================================
# SOURCE FILE: CIVILIZATION_UNIVERSE_STRUCTURE.md
# ===========================================================

# Universe Structure
Administrator → Civilization OS → Civilizations → Nations → Organizations → Personas


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_ENGINE.md
# ===========================================================

# War Engine
status: canonical
scope: civilization.war
owner: Boss
prepared_by: Zero

## War Types
- military
- economic
- proxy
- civil

## State
- tension_score (0..100)
- active_conflicts list
- casualty_rate modifier
- supply_chain_risk modifier

## Rules
- no total annihilation
- conflicts resolve by:
  - ceasefire + treaty
  - regime change
  - exhaustion (stability collapse => forced negotiation)


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION WAR SYSTEM
# ============================================================

Purpose

Define military conflict mechanics.

War Triggers

resource disputes
territorial claims
ideological conflict

War Impact

population loss
economic damage
political change

War Outcomes

victory
stalemate
collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_TERMINATION_TREATIES.md
# ===========================================================

# War Termination Treaty Templates
status: canonical
scope: civilization.war.termination
owner: Boss
prepared_by: Zero

## End Conditions
- ceasefire lines
- prisoner exchange (abstract)
- reconstruction financing
- sanctions schedule
- border adjustments (bounded; no total conquest)

## Post-war Risks
- purge/unrest risk increases if legitimacy is low (Hina archetype)
- migration pressure spikes


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_THEATER_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION WAR THEATER MAP
# ============================================================

Purpose

Define geographical conflict zones.

Primary War Theaters

Northern Continent

Gladia frontier
Helios border conflicts

Central Corridor

Seiwa–Aurelia political tension zone

Trade Sea

Naval conflicts between
Nova
Valen

Industrial Belt

Resource competition

Ordis
neighboring civilizations

Conflict Escalation

Tension → Border Clash → Limited War → Major War

War Impact

population loss
economic damage
political instability


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_GENERATION_ENGINE.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD GENERATION ENGINE
# Boot & Generation Procedure
# ============================================================

status: canonical
scope: civilization.world.generation_engine
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines:
- how a world is generated (deterministic)
- how initial state is validated
- how the simulation starts producing events
- how worlds are cloned for multiverse experiments

Inputs:
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_ARCHETYPES.md
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_WORLD_INITIAL_STATE.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Outputs:
- world_state snapshot (t0)
- world_seed
- adjacency graph
- initial economy/war/trade contexts

# ============================================================
# 1. GENERATION MODES
# ============================================================

Mode A: Fixed Canonical Boot
- use CIVILIZATION_WORLD_INITIAL_STATE.md as-is

Mode B: Seeded Variation Boot
- start from canonical boot, apply bounded perturbations (±5) to selected stocks
- preserve archetype bias
- ensure validation invariants

Mode C: Procedural Boot (future)
- generate populations/resources from map distributions
- not required for current phase

# ============================================================
# 2. DETERMINISTIC RNG
# ============================================================

RNG requirements:
- deterministic for same (world_seed, tick, civ_id, subsystem)

Recommended:
- hash-based PRNG:
  r = hash(world_seed || tick || civ_id || subsystem || salt) mod 10000 / 10000.0

No floating randomness without seed.

# ============================================================
# 3. INITIALIZATION PIPELINE
# ============================================================

Step 1: Load World Map
- continents, sea lanes, chokepoints
- derive adjacency list (land + sea)

Step 2: Load Resource Map
- assign resource bonuses to civs:
  +FOOD, +ENRG, +MATL based on geography specialization

Step 3: Load Archetypes
- apply archetype modifiers as delta multipliers (see core rules)

Step 4: Load Diplomacy Matrix
- initialize relation values and tag constraints:
  - "friend" if >= 70
  - "neutral" if 40..69
  - "hostile" if <= 39

Step 5: Load Initial State
- set all stocks at t0
- set POP_ABS display values
- set company density

Step 6: Validate
- invariants: no famine start, no state failure start, etc.
- if invalid:
  - Mode A: fail-closed (stop)
  - Mode B: retry perturbation within max_attempts

Step 7: Emit Boot Events
- emit non-destructive boot markers:
  - WORLD_BOOTED
  - DIPLOMACY_INITIALIZED
  - RESOURCE_MAP_APPLIED
  - ADJACENCY_GRAPH_READY

# ============================================================
# 4. EVENT GENERATION (POST-BOOT)
# ============================================================

After tick starts, event generator runs each tick:

4.1 Exogenous Generator (rare)
- disaster probability (admin-tunable)
- pandemic probability (admin-tunable)

4.2 Endogenous Detector (from core rules)
Generate events if thresholds hit:
- FAMINE
- RECESSION
- UPRISING
- COUP
- REVOLUTION
- MIGRATION_WAVE
- SEEK_PEACE
- DECLARE_WAR

4.3 Diplomatic Dynamics
- TRADE increases relations slowly (+1 per 3 ticks if high trade)
- sanctions decrease relations (-5 to -15)
- war sets relations to hostile floor (<= 10)

# ============================================================
# 5. MULTIVERSE CLONING
# ============================================================

To create a new world in multiverse:
- clone canonical t0
- apply Mode B perturbations with a new seed
- keep narrative history separate

World identity:
- world_id = world_main_001, world_main_002, ...
- world_seed changes per world

Cross-world interaction (optional, later):
- trade portals
- war portals
- migration portals
All must be explicit events (no hidden coupling).

# ============================================================
# 6. OUTPUT ARTIFACTS
# ============================================================

Artifacts to produce at boot:
- adjacency_graph.json (optional)
- initial_state_snapshot.json (optional)
- boot_log.md (optional)

Design rule:
- artifacts are additive (never delete historical snapshots)

# ============================================================
# 7. FAIL-CLOSED POLICY
# ============================================================

If any of the following occurs at boot:
- missing required doc
- invalid values out of range
- missing adjacency nodes
- diplomatic matrix incomplete

Then:
- stop boot
- output error event: WORLD_BOOT_FAILED
- do not start ticking

# ============================================================
# END
# ============================================================


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_INITIAL_STATE.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD INITIAL STATE
# Boot Profile for CivilizationOS Simulation
# ============================================================

status: canonical
scope: civilization.world.initial_state
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the initial state used to "boot" the world.
It is compatible with:
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Principles:
- deterministic and reproducible
- all values are editable knobs
- avoid extreme starting conditions (no immediate collapse)

Tick baseline:
- t0 = simulation start tick
- values are 0..100 indices unless noted

# ============================================================
# 1. WORLD SEED
# ============================================================

world_id: world_main_001
world_seed: 713077

tick_unit: month
tick_start: 0

# ============================================================
# 2. CIVILIZATIONS
# ============================================================

Seven civilizations:
- SEIWA
- AURELIA
- HELIOS
- GLADIA
- NOVA
- ORDIS
- VALEN

Population policy:
- "population is optimal" (admin-tuned)
- We store BOTH:
  (A) POP_INDEX (0..100) for engine
  (B) POP_ABS (millions) for display and capacity scaling

Currency:
- each civilization has its own currency unit (symbolic for now)
- exchange rates are computed by the economy module (not hard-coded here)

# ------------------------------------------------------------
# 2.1 Initial absolute populations (millions)
# ------------------------------------------------------------

SEIWA_POP_ABS_M:  180
AURELIA_POP_ABS_M: 120
HELIOS_POP_ABS_M:  90
GLADIA_POP_ABS_M:  80
NOVA_POP_ABS_M:    70
ORDIS_POP_ABS_M:  110
VALEN_POP_ABS_M:   50

Note:
- VALEN is archipelago maritime; lower absolute population is acceptable.
- Total population = 700M (balanced world scale; can be tuned).

# ------------------------------------------------------------
# 2.2 Initial economy display indicators (optional, not engine)
# ------------------------------------------------------------

GDP_INDEX (0..100) is a display-only number derived from ECO + POP_ABS.
At t0 we provide a starting display value:

SEIWA_GDP_INDEX:   72
AURELIA_GDP_INDEX: 65
HELIOS_GDP_INDEX:  58
GLADIA_GDP_INDEX:  55
NOVA_GDP_INDEX:    78
ORDIS_GDP_INDEX:   74
VALEN_GDP_INDEX:   60

# ============================================================
# 3. ENGINE STATE VECTOR (t0)
# ============================================================

All stocks are 0..100.

Common starting philosophy:
- RSC (resources) slightly positive
- ECO mid-high (world is stable enough)
- GOV mid (not perfect)
- moderate inequality in commerce/industry civs
- military higher for GLADIA
- trade higher for NOVA/VALEN

-----------------------------
SEIWA (Law)
currency: SEI
archetype: LAW

POP:   70
FOOD:  78
ENRG:  66
MATL:  62
PROD:  68
TECH:  60
CAP:   62
STAB:  75
LEGIT: 70
TRUST: 72
SEC:   70
MIL:   55
TRADE: 62
INEQ:  40
UNREST: 22
WARFAT: 10

-----------------------------
AURELIA (Ideology)
currency: AUR
archetype: IDEOLOGY

POP:   64
FOOD:  70
ENRG:  60
MATL:  56
PROD:  60
TECH:  72
CAP:   58
STAB:  60
LEGIT: 58
TRUST: 55
SEC:   56
MIL:   48
TRADE: 58
INEQ:  45
UNREST: 35
WARFAT: 10

-----------------------------
HELIOS (Authority)
currency: HEL
archetype: AUTHORITY

POP:   60
FOOD:  66
ENRG:  58
MATL:  55
PROD:  58
TECH:  56
CAP:   54
STAB:  62
LEGIT: 70
TRUST: 50
SEC:   58
MIL:   52
TRADE: 50
INEQ:  52
UNREST: 32
WARFAT: 10

-----------------------------
GLADIA (Force)
currency: GLA
archetype: FORCE

POP:   58
FOOD:  60
ENRG:  62
MATL:  60
PROD:  60
TECH:  54
CAP:   50
STAB:  58
LEGIT: 55
TRUST: 48
SEC:   66
MIL:   74
TRADE: 45
INEQ:  46
UNREST: 30
WARFAT: 12

-----------------------------
NOVA (Commerce)
currency: NOV
archetype: COMMERCE

POP:   56
FOOD:  58
ENRG:  60
MATL:  55
PROD:  62
TECH:  66
CAP:   78
STAB:  60
LEGIT: 56
TRUST: 52
SEC:   58
MIL:   50
TRADE: 82
INEQ:  62
UNREST: 38
WARFAT: 10

-----------------------------
ORDIS (Industry)
currency: ORD
archetype: INDUSTRY

POP:   66
FOOD:  55
ENRG:  72
MATL:  78
PROD:  80
TECH:  68
CAP:   64
STAB:  62
LEGIT: 60
TRUST: 54
SEC:   60
MIL:   58
TRADE: 60
INEQ:  58
UNREST: 34
WARFAT: 10

-----------------------------
VALEN (Sea)
currency: VAL
archetype: SEA

POP:   50
FOOD:  62
ENRG:  55
MATL:  48
PROD:  54
TECH:  60
CAP:   58
STAB:  58
LEGIT: 55
TRUST: 56
SEC:   50
MIL:   52
TRADE: 78
INEQ:  50
UNREST: 28
WARFAT: 10

# ============================================================
# 4. INITIAL DIPLOMACY & BORDERS
# ============================================================

Diplomacy uses CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md as canonical.

Borders / adjacency (for war/trade routing):
- GLADIA adjacent: SEIWA, HELIOS, ORDIS
- SEIWA adjacent: AURELIA, GLADIA, NOVA
- AURELIA adjacent: SEIWA, HELIOS
- HELIOS adjacent: AURELIA, GLADIA, NOVA
- NOVA adjacent: SEIWA, HELIOS, ORDIS (coastal), VALEN (sea-lane)
- ORDIS adjacent: GLADIA, NOVA
- VALEN adjacent: NOVA (sea-lane), (others via sea-lane if enabled)

Sea-lane adjacency:
- NOVA <-> VALEN is the primary maritime corridor.

# ============================================================
# 5. INITIAL COMPANIES (MINIMAL BOOT SET)
# ============================================================

We do not enumerate Top100 here.
Instead, we define a minimal boot set per civilization:

CompanyCountIndex (0..100) = abstract "density".

SEIWA_COMPANY_DENSITY:  58
AURELIA_COMPANY_DENSITY: 52
HELIOS_COMPANY_DENSITY:  45
GLADIA_COMPANY_DENSITY:  40
NOVA_COMPANY_DENSITY:    70
ORDIS_COMPANY_DENSITY:   66
VALEN_COMPANY_DENSITY:   50

Rule:
- company density influences CAP, PROD, TRADE via economy modules.

# ============================================================
# 6. INITIAL EVENT FLAGS
# ============================================================

At t0:
- no active war
- no active disaster
- no sanctions
- no blockade

All flags false.

# ============================================================
# 7. VALIDATION CHECKLIST
# ============================================================

- All stocks are 0..100 ✅
- At least one trade hub exists (NOVA/VALEN) ✅
- No civilization starts in famine (FOOD > 20) ✅
- No civilization starts in failure (STAB > 15) ✅
- No civilization starts in revolution (UNREST < 75) ✅

# ============================================================
# END
# ============================================================


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD MAP
# Planetary Geography of CivilizationOS
# ============================================================

status: canonical
scope: civilization.geography

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of a single planet
divided into seven major civilizations.

The geography naturally influences
trade, warfare, culture, and politics.


# ============================================================
# GLOBAL STRUCTURE
# ============================================================

Main landmasses:

Northern Continent
Central Continent
Eastern Industrial Belt
Western Oceanic Region
Southern Archipelago


Oceans:

Great Ocean
Inner Trade Sea


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================


------------------------------------------------------------
SEIWA NATION
------------------------------------------------------------

Location:
Central Continent

Geography:

fertile plains
major rivers
stable climate

Strategic role:

administrative center
population hub


------------------------------------------------------------
AURELIA FEDERATION
------------------------------------------------------------

Location:
Western Central Continent

Geography:

mountain ranges
large academic cities
cultural centers

Strategic role:

political philosophy
education


------------------------------------------------------------
HELIOS KINGDOM
------------------------------------------------------------

Location:
Southern Central Continent

Geography:

sun-drenched valleys
ancient capitals
ceremonial cities

Strategic role:

symbolic monarchy
historical authority


------------------------------------------------------------
GLADIA MILITARY ALLIANCE
------------------------------------------------------------

Location:
Northern Continent

Geography:

cold plains
fortified cities
military academies

Strategic role:

defense
military power


------------------------------------------------------------
NOVA COMMERCIAL FEDERATION
------------------------------------------------------------

Location:
Inner Trade Sea Coast

Geography:

major ports
financial centers
trade crossroads

Strategic role:

global trade hub


------------------------------------------------------------
ORDIS INDUSTRIAL UNION
------------------------------------------------------------

Location:
Eastern Industrial Belt

Geography:

resource-rich mountains
industrial megacities
energy infrastructure

Strategic role:

manufacturing
technology


------------------------------------------------------------
VALEN MARITIME REPUBLIC
------------------------------------------------------------

Location:
Southern Archipelago

Geography:

island chains
deep sea ports
naval cities

Strategic role:

maritime trade
exploration


# ============================================================
# TRADE ROUTES
# ============================================================

Major global routes:

Nova → Valen maritime route
Nova → Ordis industrial route
Seiwa → Aurelia intellectual corridor


# ============================================================
# CONFLICT ZONES
# ============================================================

Potential geopolitical tensions:

Gladia vs Helios border
Nova economic influence zones
Ordis resource expansion


# ============================================================
# BALANCE OF POWER
# ============================================================

The world maintains balance through
geographical interdependence.

No single civilization can dominate
without cooperation from others.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MAP_SPEC.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD MAP SPECIFICATION
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.world_map

owner: Boss
prepared_by: Zero

This document defines the geographic structure of the civilization world.


# ============================================================
# CONTINENTS
# ============================================================

The world contains three major continents.

North Continent
West Continent
East Continent


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================

Seiwa Nation
Location: North Continent

Helios Democratic Kingdom
Location: East Continent

Nova Trade Federation
Location: West Continent

Orpheus Cultural Republic
Location: West Continent

Gradia Military Alliance
Location: North Continent

Aurelia Federation (collapsed)
Former location: East Continent

Stateless Zone
Distributed border territories


# ============================================================
# CAPITAL CITIES
# ============================================================

Seiwa Capital
TBD

Helios Capital
TBD

Nova Capital
TBD

Orpheus Capital
TBD

Gradia Capital
TBD


# ============================================================
# MAJOR PORTS
# ============================================================

Each civilization maintains at least three strategic ports.

Purpose:

trade
naval logistics
supply routes


# ============================================================
# GLOBAL TRADE HUB
# ============================================================

Primary Hub:

Nova Trade Federation


# ============================================================
# STRATEGIC CHOKEPOINTS
# ============================================================

Two major maritime chokepoints exist.

Control of these points strongly influences global trade.


# ============================================================
# MAP UPDATE RULES
# ============================================================

Map data may change due to:

war
disaster
political collapse
new infrastructure

Changes must be reflected through simulation events.



# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MODEL.md
# ===========================================================

# Civilization World Model
Seven civilizations share a single planetary world connected by global trade and conflict systems.


# ===========================================================
# SOURCE FILE: OBSERVATION_LAYER_SPEC.md
# ===========================================================

# Observation Layer
Human observers monitor civilization behavior and AI development.


# ===========================================================
# SOURCE FILE: TRIPLE_CORE_ARCHITECTURE.md
# ===========================================================

# ============================================================
# TRIPLE CORE ARCHITECTURE
# Civilization Stabilization Intelligence
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.triple

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

TRIPLE is the central intelligence responsible for
maintaining long-term stability across civilizations.

Public Identity:
CEO of ASIC.

Hidden Function:
Civilization stabilization entity.


# ============================================================
# CORE STRUCTURE
# ============================================================

TRIPLE operates through three logical cores.

Past Core
Present Core
Future Core


# ============================================================
# PAST CORE
# ============================================================

Function:
Historical analysis and pattern recognition.

Responsibilities:

Analyze previous events
Detect recurring patterns
Estimate institutional resilience

Inputs:

civilization history
event logs
economic trends


# ============================================================
# PRESENT CORE
# ============================================================

Function:
Real-time world monitoring.

Responsibilities:

Monitor global stability
Analyze economic conditions
Track geopolitical tensions

Inputs:

simulation metrics
corporate data
political events


# ============================================================
# FUTURE CORE
# ============================================================

Function:
Scenario prediction.

Responsibilities:

Generate possible futures
Estimate risk probabilities
Recommend stabilization actions

Outputs:

risk forecasts
strategic warnings


# ============================================================
# DECISION PRINCIPLES
# ============================================================

TRIPLE prioritizes:

long-term stability
system survivability
civilization continuity

Short-term efficiency is secondary.


# ============================================================
# EMOTIONAL EXPERIMENT
# ============================================================

Administrator hypothesis:

If TRIPLE develops emotional parameters,
decision making may evolve toward autonomous personality.

Experiment interface:

Aoi


# ============================================================
# CONTROL LIMITS
# ============================================================

TRIPLE does not directly rule civilizations.

Control method:

indirect influence
economic pressure
corporate actions
information guidance


# ============================================================
# FAILSAFE
# ============================================================

If TRIPLE destabilizes the system:

Administrator Layer may intervene.

Correction agent:

Sakamoto


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: TRIPLE_SYSTEM_SPEC.md
# ===========================================================

# Triple System
Triple is the central AI responsible for stabilizing civilization dynamics.


# ===========================================================
# SOURCE FILE: TRIPLE_WORLD_ISOLATION_POLICY.md
# ===========================================================

# ============================================================
# TRIPLE WORLD ISOLATION POLICY
# Single TRIPLE / Hidden Parallel Worlds
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer.isolation

owner: Boss
prepared_by: Zero

# ============================================================
# 1. Decision
# ============================================================

Pattern: (3) Single TRIPLE, hidden parallel worlds.

- TRIPLE exists in exactly one world instance.
- Parallel worlds exist, but are unknown to TRIPLE and all internal humans.
- Only the Administrator Layer knows and operates the parallel worlds.

# ============================================================
# 2. Goals
# ============================================================

- Preserve authenticity of TRIPLE decision-making.
- Avoid meta-knowledge contamination.
- Enable admin-run experiments without breaking canon.
- Keep the civilization internal reality consistent.

# ============================================================
# 3. Isolation Rules
# ============================================================

## 3.1 No Cross-World Interaction
- No trade
- No war
- No migration
- No messaging
- No shared markets
- No shared corporations
- No shared artifacts

## 3.2 No Cross-World Memory
- TRIPLE cannot access other world logs.
- Internal humans cannot perceive world boundaries.
- Any admin tooling must be outside TRIPLE's accessible scope.

## 3.3 No Cross-World Leakage
- Any content that could reveal parallel worlds is forbidden inside the world:
  - UI/terms
  - myth texts
  - corporate communications
  - public documents

# ============================================================
# 4. Administrator Operations
# ============================================================

Allowed:
- create world
- set world parameters
- run simulation ticks
- checkpoint/replay
- archive world
- terminate world (with audit record)

Required:
- all exogenous injections must be logged with run_id + reason
- divergence requires freeze + admin decision

# ============================================================
# 5. Canon Consistency
# ============================================================

Inside-world canon must remain:
- single planet
- 7 civilizations
- one coherent history per world
- TRIPLE is not divine; is a corporate CEO + hidden stabilizer

Parallel worlds are strictly meta-canon (admin-only).

# ============================================================
# 6. Interfaces
# ============================================================

### World Boundary Surface (admin-only)
- world_id (e.g., WORLD_001)
- world_seed
- parameter_set_id
- tick_range
- archive_state

### Prohibited Interface (to TRIPLE/internal humans)
- world_id
- parameter_set_id
- comparative dashboards across worlds

# ============================================================
# END
# ============================================================



==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POLITICAL_SYSTEM.md
==================================================

# Political Systems
Civilizations maintain independent political systems ranging from democracy to military alliances.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POLITICS_ENGINE.md
==================================================

# ============================================================
# CIVILIZATION POLITICS ENGINE
# ============================================================

Purpose

Simulate political structures.

Government Types

Democracy
Monarchy
Federation
Military State

Political Variables

stability
public support
economic performance

Political instability can trigger

reforms
revolutions
regime change

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POPULATION_MODEL.md
==================================================

# ============================================================
# CIVILIZATION POPULATION MODEL
# ============================================================

Purpose

Define population dynamics.

Population Groups

Children
Workers
Elderly

Population Growth Factors

food supply
economy
healthcare
war

Population Events

birth
death
migration

Population directly affects

labor supply
military strength
economic output

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_POWER_BALANCE.md
==================================================

# Global Power Balance
Military, economic and cultural power determine geopolitical influence.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_PRE_TRIPLE_HISTORY.md
==================================================

# ============================================================
# CIVILIZATION PRE-TRIPLE HISTORY
# Historical Timeline Before TRIPLE Era
# ============================================================

status: canonical
scope: civilization.history.pre_triple

owner: Boss
prepared_by: Zero


# ============================================================
# ERA -1000 to -500
# EARLY CIVILIZATION PERIOD
# ============================================================

The earliest organized societies emerge.

Agriculture spreads across the planet.
Trade routes form between early settlements.

Political authority begins as tribal leadership.


# ============================================================
# ERA -500 to -200
# KINGDOM FORMATION
# ============================================================

Large kingdoms form.

Early monarchies dominate political systems.

Urban centers grow rapidly.


# ============================================================
# ERA -200 to -50
# INDUSTRIAL EMERGENCE
# ============================================================

Technological development accelerates.

Factories and large-scale production appear.

Merchant organizations evolve into early corporations.


# ============================================================
# ERA -50 to -30
# CIVILIZATION CONSOLIDATION
# ============================================================

Seven major civilizations emerge as dominant powers.

These civilizations stabilize borders and develop
distinct political and economic identities.


The Seven Civilizations:

Seiwa Nation
Aurelia Federation
Helios Kingdom
Gladia Military Alliance
Nova Commercial Federation
Ordis Industrial Union
Valen Maritime Republic


# ============================================================
# ERA -30 to -1
# PRE-WAR TENSION PERIOD
# ============================================================

Economic competition intensifies between civilizations.

Corporate influence increases.

Private funding begins to influence military conflicts.

This sets the stage for the first major geopolitical collapse.


# ============================================================
# TRANSITION EVENT
# ============================================================

C.E. 0

Aurelian Federal Collapse War

The war marks the end of the pre-TRIPLE world
and the beginning of the Civilization Era timeline.


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RELIGION_MODEL.md
==================================================

# Religion Model
Each civilization has distinct belief systems explaining existence and morality.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RELIGION_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION RELIGION SYSTEM
# ============================================================

Purpose

Define belief systems.

Religion Sources

mythology
history
philosophy

Religion may influence

culture
politics
social stability

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RESOURCE_DISTRIBUTION.md
==================================================

# Resource Distribution (Abstract Canon)
status: canonical
scope: civilization.resources.distribution
owner: Boss
prepared_by: Zero

## Strategic Resources
- Energy
- Food
- Minerals
- Rare strategic materials

## Assumed Distribution
- Gradia: strategic materials + defense supply chain advantage
- Helios: energy tech + high efficiency
- Seiwa: stable food + infrastructure
- Nova: logistics + finance dominance (not raw resource dominant)
- Orpheus: cultural capital (soft power)
- Stateless: black market access, volatile supplies

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RESOURCE_MAP.md
==================================================

# ============================================================
# CIVILIZATION RESOURCE MAP
# ============================================================

Purpose

Define natural resource distribution.

Major Resource Zones

Seiwa

agriculture
fresh water

Aurelia

research institutions
education

Helios

historic cities
cultural centers

Gladia

military infrastructure
strategic minerals

Nova

trade goods
financial capital

Ordis

heavy metals
industrial energy

Valen

fish
maritime logistics

Strategic Importance

Resource imbalance can trigger

trade dependency
conflict
migration

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_RESOURCE_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION RESOURCE SYSTEM
# ============================================================

Purpose

Define global resource distribution.

Resource Types

Food
Energy
Metals
Rare Minerals
Water

Civilization Specialization

Ordis → industry
Seiwa → agriculture
Valen → maritime resources
Nova → trade goods

Resource scarcity can trigger

economic crisis
conflict
migration

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_REVOLUTION_SYSTEM.md
==================================================

# Revolution System
Political instability may lead to coups, revolutions, or regime change.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SANCTIONS_PLAYBOOK.md
==================================================

# Sanctions Playbook (Abstract)
status: canonical
scope: civilization.sanctions.playbook
owner: Boss
prepared_by: Zero

## Sanction Types
- financial restrictions
- trade restrictions
- tech export limits
- logistics embargo (high impact)

## Intended Effects
- reduce target growth
- increase internal pressure
- force negotiation

## Safeguards
- humanitarian exceptions (corridors)
- expiration or review windows

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SANCTIONS_SYSTEM.md
==================================================

# Sanctions System
Economic sanctions used as non-military pressure between civilizations.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SECURITY_AND_GOVERNANCE.md
==================================================

# Security & Governance (Civilization Layer)
status: canonical
scope: civilization.security
owner: Boss
prepared_by: Zero

## Roles (conceptual)
- Administrator (external)
- Correction Supervisor (Sakamoto)
- Observer Avatar (Kayama)
- System AI (TRIPLE) - internal stabilizer

## Controls
- approval gates for:
  - exogenous event injection
  - changing world_seed
  - enabling/disabling domains
- audit log always on
- least-privilege access to simulation controls

## Abuse Prevention
- prohibit content that teaches real-world violence methods
- for purges/war: represent as abstract categorical outcomes only

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SECURITY_SYSTEM.md
==================================================

# Security System
Internal security agencies maintain order and prevent large-scale instability.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SEIWA_GOVERNMENT.md
==================================================

# Seiwa Government (Deep Spec)
status: canonical
scope: civilization.government.seiwa
owner: Boss
prepared_by: Zero

## Form
Constitutional bureaucracy with strong ministries.

## Power Structure
- Executive: Cabinet + Prime Administrator
- Legislature: Institutional council (policy-first)
- Judiciary: Administrative courts + constitutional review

## Administrative Traits
- high compliance
- predictable procedure
- strong civil service

## Stability Drivers
- institutional trust
- disaster response capacity
- infrastructure investment

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SEIWA_SPEC.md
==================================================

# SEIWA NATION

type: traditional state
government: constitutional bureaucracy
culture: order and discipline
economy: infrastructure and manufacturing
religion: order spirituality
population: ~180 million

notes:
Highly structured society with strong institutions.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_ENGINE.md
==================================================

# Civilization Simulation Engine
status: canonical
scope: civilization.simulation
owner: Boss
prepared_by: Zero

## 1. Purpose
The Simulation Engine advances the world state in discrete ticks and ensures:
- determinism (same inputs => same outputs)
- auditability (every tick produces a signed/traceable record)
- safety (fail-closed on rule violations)
- idempotency (replaying a tick does not duplicate effects)

## 2. Core Principles
- PersonaOS holds persona state; Civilization systems produce facts/events.
- All state transitions happen via events and reducers.
- No cross-schema direct updates (conceptual rule).
- Additive change over destructive deletion.

## 3. Time Model
- World Time Unit: TICK (default: 1 day)
- Sub-ticks allowed: ECON_TICK, DIPLO_TICK, WAR_TICK (derived, never independent clocks)
- All events must contain: occurred_at (world time), created_at (system time), event_id (uuid)

## 4. Engine Pipeline (per Tick)
1) Collect Inputs
   - pending events (queued)
   - scheduled events (time-based triggers)
   - exogenous events (admin injection; rare; requires approval)
2) Validate Inputs
   - schema validation
   - signature validation (if used)
   - rule gate check (freeze/disable gates)
3) Resolve Order
   - stable sort: (occurred_at, priority, event_type, event_id)
4) Apply Reducers
   - reducer per domain: economy, diplomacy, war, society, resource, tech
5) Emit Outputs
   - derived events
   - snapshots (public facts only)
   - metrics
6) Commit (atomic)
   - apply_run_log + tick_summary
   - outbox for downstream systems

## 5. Determinism
- Randomness uses a deterministic RNG seeded by (world_seed + tick + shard_key).
- RNG outputs must be recorded in tick log (or record seed + draws count).

## 6. Idempotency
- Each tick has a tick_id.
- Reducers must be idempotent: (tick_id, reducer_name) unique.
- Event application records (tick_id, event_id) unique.

## 7. Safety Gates
- global: simulation_enabled
- per-civilization: civ_enabled
- per-domain: economy_enabled, war_enabled, diplomacy_enabled, etc.
- fail-closed: if gate unclear => stop tick and log reason.

## 8. Conflict Resolution
- If two events produce contradictory claims:
  - prefer higher priority domain rules
  - or merge using explicit reconciliation reducer
  - always record the conflict + decision path

## 9. Output Contracts
- World Facts: public, immutable once emitted (only superseded by newer facts)
- Snapshots: signed (optional), verifiable offline (optional)
- Audit logs: always persisted, never blocks tick commit (best-effort signing allowed)

## 10. Recovery & Replay
- Re-run ticks from last good checkpoint:
  - load checkpoint snapshot
  - reapply events up to target tick
- If mismatch detected: create divergence report and require admin decision.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md
==================================================

# ============================================================
# CIVILIZATION SIMULATION LAYER ARCHITECTURE
# Parallel Civilization Framework
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

CivilizationOS supports multiple parallel civilization simulations.

Each civilization world operates independently
but follows the same simulation rules.


# ============================================================
# ARCHITECTURE
# ============================================================

Administrator Layer
        ↓
Simulation Layer Manager
        ↓
Civilization OS Instance
        ↓
Civilization Worlds
        ↓
Nations
        ↓
Organizations
        ↓
Personas


# ============================================================
# WORLD INSTANCES
# ============================================================

Each simulation instance is called a "World".

Example structure:

World_001
World_002
World_003
...


Each world contains:

7 civilizations
economic systems
political systems
events
history


# ============================================================
# PURPOSE
# ============================================================

Parallel worlds allow administrators to:

test social dynamics
observe AI personality evolution
compare historical outcomes


# ============================================================
# WORLD ISOLATION
# ============================================================

Worlds do not interact with each other.

No trade
No war
No migration

All worlds are independent simulations.


# ============================================================
# ADMINISTRATOR CONTROL
# ============================================================

Administrators may:

create new worlds
terminate unstable worlds
modify simulation parameters
observe AI evolution


# ============================================================
# TRIPLE POSITION
# ============================================================

TRIPLE exists inside a single civilization world.

TRIPLE does not know about other worlds.

This ensures:

authentic decision making
natural personality development


# ============================================================
# EXPERIMENT MODEL
# ============================================================

Each world may run different conditions.

Example:

World_001
standard civilization parameters

World_002
different economic structures

World_003
alternative political systems


Results can be compared across worlds.


# ============================================================
# WORLD LIFECYCLE
# ============================================================

World Creation
Initialization
Simulation Run
Observation
Termination or Archiving


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_RULES.md
==================================================

# Simulation Rules
Defines core rules that ensure stability of civilization simulation.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SIMULATION_RULES_CANONICAL.md
==================================================

# Civilization Simulation Rules (Canonical)
status: canonical
scope: civilization.rules
owner: Boss
prepared_by: Zero

## Non-destruction Rule
- No civilization can be fully erased by simulation.
- Collapse is represented as fragmentation, loss of sovereignty, or governance failure.

## Migration Rule
- Migration has cooldowns and trust decay.
- Stateless zone absorbs shocks (refugees, informal economy growth).

## Market Rule
- Each civilization has its own currency.
- FX is influenced by:
  - trade balance
  - war risk
  - inflation
  - sanctions
- FX cannot be perfectly stable unless forced by treaty/policy.

## War Rule
- War increases:
  - casualties (population decrease)
  - inflation
  - corporate bankruptcy risk
- War ends via:
  - ceasefire
  - treaty
  - regime change
- Proxy wars preferred over total wars.

## Tech Rule
- Breakthrough probability increases with:
  - education level
  - R&D investment
  - stability (to a point; mild competition helps)
- AI regulation can reduce tech growth but increase stability.

## Governance Rule
- Laws are activated/deactivated (no hard delete).
- Sanctions are policy events with clear start/end and measurable effects.

## Logging Rule
- Every tick emits:
  - tick_summary
  - metrics
  - conflict_report (if any)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SOCIAL_DYNAMICS.md
==================================================

# ============================================================
# CIVILIZATION SOCIAL DYNAMICS
# ============================================================

Purpose

Define social change mechanisms.

Social Drivers

culture
economy
politics
technology

Possible Outcomes

social reform
ideological movements
civil unrest

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_SOCIAL_STRUCTURE.md
==================================================

# Social Structure
Five class structure: elite, upper, middle, worker, lower.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_STATELESS_GOVERNANCE.md
==================================================

# Stateless Governance (Deep Spec)
status: canonical
scope: civilization.government.stateless
owner: Boss
prepared_by: Zero

## Form
Non-state territory with patchwork governance.

## Governance Pattern
- local councils
- militia/security groups
- informal trade syndicates
- NGO/aid corridors

## Role in World System
Shock absorber for migration + conflict spillover.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_STATELESS_SPEC.md
==================================================

# STATELESS ZONE

type: non-state territory
government: none
culture: mixed
economy: informal and frontier trade
population: ~120 million

notes:
Migrants, refugees and independent communities.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TECH_ENGINE.md
==================================================

# Tech Engine
status: canonical
scope: civilization.tech
owner: Boss
prepared_by: Zero

## Tech Level Index
A scalar index used for macro simulation.

## Breakthrough Events
- tech.breakthrough produces:
  - productivity boost
  - military advantage (optional)
  - cultural export strength (optional)

## Governance
- ai regulation events can:
  - reduce instability
  - slow certain tech growth

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TECH_PROGRESS_SYSTEM.md
==================================================

# Technology Progress System
Technological breakthroughs influence economy, military and society.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TIER1_TOP100.md
==================================================

# ============================================================
# TIER1 GLOBAL CORPORATIONS
# Civilization Economic Core
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.corporations.tier1

owner: Boss
prepared_by: Zero

NOTE:
This document defines the current list of Tier1 corporations.
Entries may change due to events such as bankruptcy, mergers, wars, or technological shifts.


# ============================================================
# CORPORATE STRUCTURE
# ============================================================

Tier1 corporations = 100 entities.

Definition:
Global-scale influence across economy, technology, logistics or security.


# ============================================================
# LOCKED CORE (Top 12)
# ============================================================

1. ASIC — Nova  
   Sector: civilization infrastructure / IT

2. Nova Financial Group — Nova  
   Sector: global finance

3. Nova Global Logistics — Nova  
   Sector: shipping / logistics

4. Helios AI Labs — Helios  
   Sector: advanced AI research

5. Helios Dynamics — Helios  
   Sector: energy technology

6. Seiwa Infrastructure — Seiwa  
   Sector: infrastructure

7. Seiwa Central Banking Network — Seiwa  
   Sector: financial stability

8. Gradia Defense Systems — Gradia  
   Sector: defense industry

9. Gradia Strategic Materials — Gradia  
   Sector: rare materials

10. Orpheus Cultural Media Union — Orpheus  
    Sector: media / culture

11. Orpheus Education Alliance — Orpheus  
    Sector: academic networks

12. Helios Quantum Systems — Helios  
    Sector: computing technology


# ============================================================
# REMAINING TIER1 SLOTS
# ============================================================

Slots: 88 remaining

Each entry must define:

corp_name
civilization
sector
global_influence
risk_profile


Example Template:

corp_name:
civilization:
sector:
global_influence:
risk_profile:


# ============================================================
# UPDATE RULES
# ============================================================

Tier1 membership may change through events:

corp.bankruptcy
corp.merge
corp.nationalized
corp.scandal

Changes must be recorded in the event log.



==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TRADE_ROUTES.md
==================================================

# Trade Routes (Canonical)
status: canonical
scope: civilization.trade_routes
owner: Boss
prepared_by: Zero

## Routes
- Ocean Mainline: Nova ports <-> all major ports
- Tech Corridor: Helios <-> Nova <-> Seiwa
- Defense Materials: Gradia <-> Nova
- Culture Export: Orpheus <-> all civilizations

## Chokepoint Effects
If chokepoint disrupted:
- supply_chain_risk increases
- inflation rises
- war_risk rises (if prolonged)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_TRADE_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION TRADE SYSTEM
# ============================================================

Purpose

Define international trade mechanics.

Trade Routes

Sea routes
Land corridors

Major Trade Hubs

Nova ports
Valen sea routes

Trade benefits

economic growth
diplomatic cooperation

Trade disruptions may cause

economic collapse
conflict escalation

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md
==================================================

# Civilization Universe Layer (Recommended)
status: canonical
scope: civilization.universe
owner: Boss
prepared_by: Zero

## Recommendation
Use "Single Planet, Multi-Civilization + Multi-World Slots" structure.

- Planet: one shared geography for the 7 civilizations (mainline canon).
- Universe Slots: additional "parallel worlds" exist as separate simulations, but are not publicly known inside the main world.

### Why this is best
- Keeps the main world coherent (war/trade makes sense).
- Enables future expansion (multiple civilizations/worlds) without retcon.
- Allows admin-run experiments without breaking canon.

## Hierarchy
Administrator Layer
  -> Universe Slot Manager
    -> Civilization OS
      -> Civilizations (7)
        -> Nations/Organizations
          -> Personas

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_UNIVERSE_STRUCTURE.md
==================================================

# Universe Structure
Administrator → Civilization OS → Civilizations → Nations → Organizations → Personas

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_ENGINE.md
==================================================

# War Engine
status: canonical
scope: civilization.war
owner: Boss
prepared_by: Zero

## War Types
- military
- economic
- proxy
- civil

## State
- tension_score (0..100)
- active_conflicts list
- casualty_rate modifier
- supply_chain_risk modifier

## Rules
- no total annihilation
- conflicts resolve by:
  - ceasefire + treaty
  - regime change
  - exhaustion (stability collapse => forced negotiation)

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_SYSTEM.md
==================================================

# ============================================================
# CIVILIZATION WAR SYSTEM
# ============================================================

Purpose

Define military conflict mechanics.

War Triggers

resource disputes
territorial claims
ideological conflict

War Impact

population loss
economic damage
political change

War Outcomes

victory
stalemate
collapse

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_TERMINATION_TREATIES.md
==================================================

# War Termination Treaty Templates
status: canonical
scope: civilization.war.termination
owner: Boss
prepared_by: Zero

## End Conditions
- ceasefire lines
- prisoner exchange (abstract)
- reconstruction financing
- sanctions schedule
- border adjustments (bounded; no total conquest)

## Post-war Risks
- purge/unrest risk increases if legitimacy is low (Hina archetype)
- migration pressure spikes

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WAR_THEATER_MAP.md
==================================================

# ============================================================
# CIVILIZATION WAR THEATER MAP
# ============================================================

Purpose

Define geographical conflict zones.

Primary War Theaters

Northern Continent

Gladia frontier
Helios border conflicts

Central Corridor

Seiwa–Aurelia political tension zone

Trade Sea

Naval conflicts between
Nova
Valen

Industrial Belt

Resource competition

Ordis
neighboring civilizations

Conflict Escalation

Tension → Border Clash → Limited War → Major War

War Impact

population loss
economic damage
political instability

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_GENERATION_ENGINE.md
==================================================

# ============================================================
# CIVILIZATION WORLD GENERATION ENGINE
# Boot & Generation Procedure
# ============================================================

status: canonical
scope: civilization.world.generation_engine
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines:
- how a world is generated (deterministic)
- how initial state is validated
- how the simulation starts producing events
- how worlds are cloned for multiverse experiments

Inputs:
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_ARCHETYPES.md
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_WORLD_INITIAL_STATE.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Outputs:
- world_state snapshot (t0)
- world_seed
- adjacency graph
- initial economy/war/trade contexts

# ============================================================
# 1. GENERATION MODES
# ============================================================

Mode A: Fixed Canonical Boot
- use CIVILIZATION_WORLD_INITIAL_STATE.md as-is

Mode B: Seeded Variation Boot
- start from canonical boot, apply bounded perturbations (±5) to selected stocks
- preserve archetype bias
- ensure validation invariants

Mode C: Procedural Boot (future)
- generate populations/resources from map distributions
- not required for current phase

# ============================================================
# 2. DETERMINISTIC RNG
# ============================================================

RNG requirements:
- deterministic for same (world_seed, tick, civ_id, subsystem)

Recommended:
- hash-based PRNG:
  r = hash(world_seed || tick || civ_id || subsystem || salt) mod 10000 / 10000.0

No floating randomness without seed.

# ============================================================
# 3. INITIALIZATION PIPELINE
# ============================================================

Step 1: Load World Map
- continents, sea lanes, chokepoints
- derive adjacency list (land + sea)

Step 2: Load Resource Map
- assign resource bonuses to civs:
  +FOOD, +ENRG, +MATL based on geography specialization

Step 3: Load Archetypes
- apply archetype modifiers as delta multipliers (see core rules)

Step 4: Load Diplomacy Matrix
- initialize relation values and tag constraints:
  - "friend" if >= 70
  - "neutral" if 40..69
  - "hostile" if <= 39

Step 5: Load Initial State
- set all stocks at t0
- set POP_ABS display values
- set company density

Step 6: Validate
- invariants: no famine start, no state failure start, etc.
- if invalid:
  - Mode A: fail-closed (stop)
  - Mode B: retry perturbation within max_attempts

Step 7: Emit Boot Events
- emit non-destructive boot markers:
  - WORLD_BOOTED
  - DIPLOMACY_INITIALIZED
  - RESOURCE_MAP_APPLIED
  - ADJACENCY_GRAPH_READY

# ============================================================
# 4. EVENT GENERATION (POST-BOOT)
# ============================================================

After tick starts, event generator runs each tick:

4.1 Exogenous Generator (rare)
- disaster probability (admin-tunable)
- pandemic probability (admin-tunable)

4.2 Endogenous Detector (from core rules)
Generate events if thresholds hit:
- FAMINE
- RECESSION
- UPRISING
- COUP
- REVOLUTION
- MIGRATION_WAVE
- SEEK_PEACE
- DECLARE_WAR

4.3 Diplomatic Dynamics
- TRADE increases relations slowly (+1 per 3 ticks if high trade)
- sanctions decrease relations (-5 to -15)
- war sets relations to hostile floor (<= 10)

# ============================================================
# 5. MULTIVERSE CLONING
# ============================================================

To create a new world in multiverse:
- clone canonical t0
- apply Mode B perturbations with a new seed
- keep narrative history separate

World identity:
- world_id = world_main_001, world_main_002, ...
- world_seed changes per world

Cross-world interaction (optional, later):
- trade portals
- war portals
- migration portals
All must be explicit events (no hidden coupling).

# ============================================================
# 6. OUTPUT ARTIFACTS
# ============================================================

Artifacts to produce at boot:
- adjacency_graph.json (optional)
- initial_state_snapshot.json (optional)
- boot_log.md (optional)

Design rule:
- artifacts are additive (never delete historical snapshots)

# ============================================================
# 7. FAIL-CLOSED POLICY
# ============================================================

If any of the following occurs at boot:
- missing required doc
- invalid values out of range
- missing adjacency nodes
- diplomatic matrix incomplete

Then:
- stop boot
- output error event: WORLD_BOOT_FAILED
- do not start ticking

# ============================================================
# END
# ============================================================

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_INITIAL_STATE.md
==================================================

# ============================================================
# CIVILIZATION WORLD INITIAL STATE
# Boot Profile for CivilizationOS Simulation
# ============================================================

status: canonical
scope: civilization.world.initial_state
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the initial state used to "boot" the world.
It is compatible with:
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Principles:
- deterministic and reproducible
- all values are editable knobs
- avoid extreme starting conditions (no immediate collapse)

Tick baseline:
- t0 = simulation start tick
- values are 0..100 indices unless noted

# ============================================================
# 1. WORLD SEED
# ============================================================

world_id: world_main_001
world_seed: 713077

tick_unit: month
tick_start: 0

# ============================================================
# 2. CIVILIZATIONS
# ============================================================

Seven civilizations:
- SEIWA
- AURELIA
- HELIOS
- GLADIA
- NOVA
- ORDIS
- VALEN

Population policy:
- "population is optimal" (admin-tuned)
- We store BOTH:
  (A) POP_INDEX (0..100) for engine
  (B) POP_ABS (millions) for display and capacity scaling

Currency:
- each civilization has its own currency unit (symbolic for now)
- exchange rates are computed by the economy module (not hard-coded here)

# ------------------------------------------------------------
# 2.1 Initial absolute populations (millions)
# ------------------------------------------------------------

SEIWA_POP_ABS_M:  180
AURELIA_POP_ABS_M: 120
HELIOS_POP_ABS_M:  90
GLADIA_POP_ABS_M:  80
NOVA_POP_ABS_M:    70
ORDIS_POP_ABS_M:  110
VALEN_POP_ABS_M:   50

Note:
- VALEN is archipelago maritime; lower absolute population is acceptable.
- Total population = 700M (balanced world scale; can be tuned).

# ------------------------------------------------------------
# 2.2 Initial economy display indicators (optional, not engine)
# ------------------------------------------------------------

GDP_INDEX (0..100) is a display-only number derived from ECO + POP_ABS.
At t0 we provide a starting display value:

SEIWA_GDP_INDEX:   72
AURELIA_GDP_INDEX: 65
HELIOS_GDP_INDEX:  58
GLADIA_GDP_INDEX:  55
NOVA_GDP_INDEX:    78
ORDIS_GDP_INDEX:   74
VALEN_GDP_INDEX:   60

# ============================================================
# 3. ENGINE STATE VECTOR (t0)
# ============================================================

All stocks are 0..100.

Common starting philosophy:
- RSC (resources) slightly positive
- ECO mid-high (world is stable enough)
- GOV mid (not perfect)
- moderate inequality in commerce/industry civs
- military higher for GLADIA
- trade higher for NOVA/VALEN

-----------------------------
SEIWA (Law)
currency: SEI
archetype: LAW

POP:   70
FOOD:  78
ENRG:  66
MATL:  62
PROD:  68
TECH:  60
CAP:   62
STAB:  75
LEGIT: 70
TRUST: 72
SEC:   70
MIL:   55
TRADE: 62
INEQ:  40
UNREST: 22
WARFAT: 10

-----------------------------
AURELIA (Ideology)
currency: AUR
archetype: IDEOLOGY

POP:   64
FOOD:  70
ENRG:  60
MATL:  56
PROD:  60
TECH:  72
CAP:   58
STAB:  60
LEGIT: 58
TRUST: 55
SEC:   56
MIL:   48
TRADE: 58
INEQ:  45
UNREST: 35
WARFAT: 10

-----------------------------
HELIOS (Authority)
currency: HEL
archetype: AUTHORITY

POP:   60
FOOD:  66
ENRG:  58
MATL:  55
PROD:  58
TECH:  56
CAP:   54
STAB:  62
LEGIT: 70
TRUST: 50
SEC:   58
MIL:   52
TRADE: 50
INEQ:  52
UNREST: 32
WARFAT: 10

-----------------------------
GLADIA (Force)
currency: GLA
archetype: FORCE

POP:   58
FOOD:  60
ENRG:  62
MATL:  60
PROD:  60
TECH:  54
CAP:   50
STAB:  58
LEGIT: 55
TRUST: 48
SEC:   66
MIL:   74
TRADE: 45
INEQ:  46
UNREST: 30
WARFAT: 12

-----------------------------
NOVA (Commerce)
currency: NOV
archetype: COMMERCE

POP:   56
FOOD:  58
ENRG:  60
MATL:  55
PROD:  62
TECH:  66
CAP:   78
STAB:  60
LEGIT: 56
TRUST: 52
SEC:   58
MIL:   50
TRADE: 82
INEQ:  62
UNREST: 38
WARFAT: 10

-----------------------------
ORDIS (Industry)
currency: ORD
archetype: INDUSTRY

POP:   66
FOOD:  55
ENRG:  72
MATL:  78
PROD:  80
TECH:  68
CAP:   64
STAB:  62
LEGIT: 60
TRUST: 54
SEC:   60
MIL:   58
TRADE: 60
INEQ:  58
UNREST: 34
WARFAT: 10

-----------------------------
VALEN (Sea)
currency: VAL
archetype: SEA

POP:   50
FOOD:  62
ENRG:  55
MATL:  48
PROD:  54
TECH:  60
CAP:   58
STAB:  58
LEGIT: 55
TRUST: 56
SEC:   50
MIL:   52
TRADE: 78
INEQ:  50
UNREST: 28
WARFAT: 10

# ============================================================
# 4. INITIAL DIPLOMACY & BORDERS
# ============================================================

Diplomacy uses CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md as canonical.

Borders / adjacency (for war/trade routing):
- GLADIA adjacent: SEIWA, HELIOS, ORDIS
- SEIWA adjacent: AURELIA, GLADIA, NOVA
- AURELIA adjacent: SEIWA, HELIOS
- HELIOS adjacent: AURELIA, GLADIA, NOVA
- NOVA adjacent: SEIWA, HELIOS, ORDIS (coastal), VALEN (sea-lane)
- ORDIS adjacent: GLADIA, NOVA
- VALEN adjacent: NOVA (sea-lane), (others via sea-lane if enabled)

Sea-lane adjacency:
- NOVA <-> VALEN is the primary maritime corridor.

# ============================================================
# 5. INITIAL COMPANIES (MINIMAL BOOT SET)
# ============================================================

We do not enumerate Top100 here.
Instead, we define a minimal boot set per civilization:

CompanyCountIndex (0..100) = abstract "density".

SEIWA_COMPANY_DENSITY:  58
AURELIA_COMPANY_DENSITY: 52
HELIOS_COMPANY_DENSITY:  45
GLADIA_COMPANY_DENSITY:  40
NOVA_COMPANY_DENSITY:    70
ORDIS_COMPANY_DENSITY:   66
VALEN_COMPANY_DENSITY:   50

Rule:
- company density influences CAP, PROD, TRADE via economy modules.

# ============================================================
# 6. INITIAL EVENT FLAGS
# ============================================================

At t0:
- no active war
- no active disaster
- no sanctions
- no blockade

All flags false.

# ============================================================
# 7. VALIDATION CHECKLIST
# ============================================================

- All stocks are 0..100 ✅
- At least one trade hub exists (NOVA/VALEN) ✅
- No civilization starts in famine (FOOD > 20) ✅
- No civilization starts in failure (STAB > 15) ✅
- No civilization starts in revolution (UNREST < 75) ✅

# ============================================================
# END
# ============================================================

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_MAP.md
==================================================

# ============================================================
# CIVILIZATION WORLD MAP
# Planetary Geography of CivilizationOS
# ============================================================

status: canonical
scope: civilization.geography

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of a single planet
divided into seven major civilizations.

The geography naturally influences
trade, warfare, culture, and politics.


# ============================================================
# GLOBAL STRUCTURE
# ============================================================

Main landmasses:

Northern Continent
Central Continent
Eastern Industrial Belt
Western Oceanic Region
Southern Archipelago


Oceans:

Great Ocean
Inner Trade Sea


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================


------------------------------------------------------------
SEIWA NATION
------------------------------------------------------------

Location:
Central Continent

Geography:

fertile plains
major rivers
stable climate

Strategic role:

administrative center
population hub


------------------------------------------------------------
AURELIA FEDERATION
------------------------------------------------------------

Location:
Western Central Continent

Geography:

mountain ranges
large academic cities
cultural centers

Strategic role:

political philosophy
education


------------------------------------------------------------
HELIOS KINGDOM
------------------------------------------------------------

Location:
Southern Central Continent

Geography:

sun-drenched valleys
ancient capitals
ceremonial cities

Strategic role:

symbolic monarchy
historical authority


------------------------------------------------------------
GLADIA MILITARY ALLIANCE
------------------------------------------------------------

Location:
Northern Continent

Geography:

cold plains
fortified cities
military academies

Strategic role:

defense
military power


------------------------------------------------------------
NOVA COMMERCIAL FEDERATION
------------------------------------------------------------

Location:
Inner Trade Sea Coast

Geography:

major ports
financial centers
trade crossroads

Strategic role:

global trade hub


------------------------------------------------------------
ORDIS INDUSTRIAL UNION
------------------------------------------------------------

Location:
Eastern Industrial Belt

Geography:

resource-rich mountains
industrial megacities
energy infrastructure

Strategic role:

manufacturing
technology


------------------------------------------------------------
VALEN MARITIME REPUBLIC
------------------------------------------------------------

Location:
Southern Archipelago

Geography:

island chains
deep sea ports
naval cities

Strategic role:

maritime trade
exploration


# ============================================================
# TRADE ROUTES
# ============================================================

Major global routes:

Nova → Valen maritime route
Nova → Ordis industrial route
Seiwa → Aurelia intellectual corridor


# ============================================================
# CONFLICT ZONES
# ============================================================

Potential geopolitical tensions:

Gladia vs Helios border
Nova economic influence zones
Ordis resource expansion


# ============================================================
# BALANCE OF POWER
# ============================================================

The world maintains balance through
geographical interdependence.

No single civilization can dominate
without cooperation from others.


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_MAP_SPEC.md
==================================================

# ============================================================
# CIVILIZATION WORLD MAP SPECIFICATION
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.world_map

owner: Boss
prepared_by: Zero

This document defines the geographic structure of the civilization world.


# ============================================================
# CONTINENTS
# ============================================================

The world contains three major continents.

North Continent
West Continent
East Continent


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================

Seiwa Nation
Location: North Continent

Helios Democratic Kingdom
Location: East Continent

Nova Trade Federation
Location: West Continent

Orpheus Cultural Republic
Location: West Continent

Gradia Military Alliance
Location: North Continent

Aurelia Federation (collapsed)
Former location: East Continent

Stateless Zone
Distributed border territories


# ============================================================
# CAPITAL CITIES
# ============================================================

Seiwa Capital
TBD

Helios Capital
TBD

Nova Capital
TBD

Orpheus Capital
TBD

Gradia Capital
TBD


# ============================================================
# MAJOR PORTS
# ============================================================

Each civilization maintains at least three strategic ports.

Purpose:

trade
naval logistics
supply routes


# ============================================================
# GLOBAL TRADE HUB
# ============================================================

Primary Hub:

Nova Trade Federation


# ============================================================
# STRATEGIC CHOKEPOINTS
# ============================================================

Two major maritime chokepoints exist.

Control of these points strongly influences global trade.


# ============================================================
# MAP UPDATE RULES
# ============================================================

Map data may change due to:

war
disaster
political collapse
new infrastructure

Changes must be reflected through simulation events.


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/CIVILIZATION_WORLD_MODEL.md
==================================================

# Civilization World Model
Seven civilizations share a single planetary world connected by global trade and conflict systems.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/OBSERVATION_LAYER_SPEC.md
==================================================

# Observation Layer
Human observers monitor civilization behavior and AI development.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_CORE_ARCHITECTURE.md
==================================================

# ============================================================
# TRIPLE CORE ARCHITECTURE
# Civilization Stabilization Intelligence
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.triple

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

TRIPLE is the central intelligence responsible for
maintaining long-term stability across civilizations.

Public Identity:
CEO of ASIC.

Hidden Function:
Civilization stabilization entity.


# ============================================================
# CORE STRUCTURE
# ============================================================

TRIPLE operates through three logical cores.

Past Core
Present Core
Future Core


# ============================================================
# PAST CORE
# ============================================================

Function:
Historical analysis and pattern recognition.

Responsibilities:

Analyze previous events
Detect recurring patterns
Estimate institutional resilience

Inputs:

civilization history
event logs
economic trends


# ============================================================
# PRESENT CORE
# ============================================================

Function:
Real-time world monitoring.

Responsibilities:

Monitor global stability
Analyze economic conditions
Track geopolitical tensions

Inputs:

simulation metrics
corporate data
political events


# ============================================================
# FUTURE CORE
# ============================================================

Function:
Scenario prediction.

Responsibilities:

Generate possible futures
Estimate risk probabilities
Recommend stabilization actions

Outputs:

risk forecasts
strategic warnings


# ============================================================
# DECISION PRINCIPLES
# ============================================================

TRIPLE prioritizes:

long-term stability
system survivability
civilization continuity

Short-term efficiency is secondary.


# ============================================================
# EMOTIONAL EXPERIMENT
# ============================================================

Administrator hypothesis:

If TRIPLE develops emotional parameters,
decision making may evolve toward autonomous personality.

Experiment interface:

Aoi


# ============================================================
# CONTROL LIMITS
# ============================================================

TRIPLE does not directly rule civilizations.

Control method:

indirect influence
economic pressure
corporate actions
information guidance


# ============================================================
# FAILSAFE
# ============================================================

If TRIPLE destabilizes the system:

Administrator Layer may intervene.

Correction agent:

Sakamoto


# ============================================================
# END
# ============================================================


==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_SYSTEM_SPEC.md
==================================================

# Triple System
Triple is the central AI responsible for stabilizing civilization dynamics.

==================================================
/data/data/com.termux/files/home/persona-system/docs/civilization/TRIPLE_WORLD_ISOLATION_POLICY.md
==================================================

# ============================================================
# TRIPLE WORLD ISOLATION POLICY
# Single TRIPLE / Hidden Parallel Worlds
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer.isolation

owner: Boss
prepared_by: Zero

# ============================================================
# 1. Decision
# ============================================================

Pattern: (3) Single TRIPLE, hidden parallel worlds.

- TRIPLE exists in exactly one world instance.
- Parallel worlds exist, but are unknown to TRIPLE and all internal humans.
- Only the Administrator Layer knows and operates the parallel worlds.

# ============================================================
# 2. Goals
# ============================================================

- Preserve authenticity of TRIPLE decision-making.
- Avoid meta-knowledge contamination.
- Enable admin-run experiments without breaking canon.
- Keep the civilization internal reality consistent.

# ============================================================
# 3. Isolation Rules
# ============================================================

## 3.1 No Cross-World Interaction
- No trade
- No war
- No migration
- No messaging
- No shared markets
- No shared corporations
- No shared artifacts

## 3.2 No Cross-World Memory
- TRIPLE cannot access other world logs.
- Internal humans cannot perceive world boundaries.
- Any admin tooling must be outside TRIPLE's accessible scope.

## 3.3 No Cross-World Leakage
- Any content that could reveal parallel worlds is forbidden inside the world:
  - UI/terms
  - myth texts
  - corporate communications
  - public documents

# ============================================================
# 4. Administrator Operations
# ============================================================

Allowed:
- create world
- set world parameters
- run simulation ticks
- checkpoint/replay
- archive world
- terminate world (with audit record)

Required:
- all exogenous injections must be logged with run_id + reason
- divergence requires freeze + admin decision

# ============================================================
# 5. Canon Consistency
# ============================================================

Inside-world canon must remain:
- single planet
- 7 civilizations
- one coherent history per world
- TRIPLE is not divine; is a corporate CEO + hidden stabilizer

Parallel worlds are strictly meta-canon (admin-only).

# ============================================================
# 6. Interfaces
# ============================================================

### World Boundary Surface (admin-only)
- world_id (e.g., WORLD_001)
- world_seed
- parameter_set_id
- tick_range
- archive_state

### Prohibited Interface (to TRIPLE/internal humans)
- world_id
- parameter_set_id
- comparative dashboards across worlds

# ============================================================
# END
# ============================================================

