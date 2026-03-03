# ============================================================
# CIVILIZATION SYSTEM - ALL CANONICAL (One-file)
# status: CANONICAL
# owner: Boss
# prepared_by: Zero
# last_updated: 2026-03-01
# ============================================================

## 0. 位置づけ（階層：憲法 → 構造 → 運用 → 実装）
- 000_FULL_00_96_CANONICAL.md：文明憲法（system_control / fail-closed / guard / 優先順）
- 本書：構造＋依存＋責務＋Freeze＋Event標準＋Roadmap を “一括定義” した設計正本
- 運用層正本（別）：LSAM_RUNTIME_OPERATIONAL_LAYER_v1_0_CANONICAL.md（監視/停止/復旧/事故対応）
- 実装：DB関数/Edge/Cron/Apps（本書の境界・禁止依存を破らない）

本書は 000_FULL_00_96_CANONICAL.md を上書きしない。常に従属。

---

# 1. 全体構造（2本の木：完全分離）

/persona-system
/erp-system

接続は「境界（integration/event-bridge）」のみ。
直接参照・直接更新は全禁止。

---

# 2. persona-system 最終ブレイクダウン（設計固定）

persona-system/
  core/
    state-model/
    event-registry/
    apply-engine/
    snapshot-contract/
  civilization/
    dispatcher/
    retry-policy/
    world-registry/
  integration/
    signature-verify/
    external-event/
    translator/
  governance/
    policy/
    weight-control/
    audit-standard/
  worlds/
    life/
      domain-model/
      event-catalog/
      outbox-contract/
    streaming/
      domain-model/
      event-catalog/
      outbox-contract/
    game/
      domain-model/
      event-catalog/
      outbox-contract/
    commerce/
      domain-model/
      event-catalog/
      outbox-contract/
    social/  (optional)
    system/  (optional: internal ops events)
  expression-layer/
    asset-model/
    visual-runtime/
    persona-create/

## Persona側 原則（固定）
- stateの唯一正本：persona-system/core（apply-engineのみ mutate）
- 外界公開は snapshot のみ（snapshot-contractが唯一の公開契約）
- worlds は事実のみ（event/outbox）を発行、core を直接更新禁止
- integration は署名検証・翻訳・境界ゲートの責務を持つ（バイパス禁止）
- civilization は dispatcher（claim→route→apply）の唯一経路

---

# 3. erp-system 最終ブレイクダウン（設計固定）

erp-system/
  core/
    master-data/
    auth-permission/
    workflow/
    numbering/
    audit/
    tenant/
  domains/
    <domain>/
      domain-model/
      command/
      read/
      policy/
      events/
  management/
    kpi/
    dashboard/
    risk/
    forecast/
  integration/
    api/
    event-bridge/
    import/
    export/

## ERP側 原則（固定）
- ERPは enterprise-only（文明スコープを持たない）
- domains は同型（domain-model/command/read/policy/events）
- management は read-only（command禁止）
- integration は外部境界のみ（境界の外へ出す・境界から入れる）

---

# 4. ERP モジュール（domains）定義（設計固定）

domains/
  sales/
  purchase/
  inventory/
  accounting/
  finance/
  hr/
  manufacturing/   (必要なら)
  logistics/
  crm/
  project/

※ 上記を “ERP標準モジュール集合” として採用。
※ 追加は可能（ただし同型テンプレに従う）。

---

# 5. 依存図（完全版：Dependency Graph）

## 5.1 Persona 内部依存
integration -> civilization -> core -> expression
worlds -> (event_outbox only) -> integration

- core は worlds を参照しない
- worlds は core を参照しない（event_registry参照は “定義参照” として許可）
- expression は snapshot参照のみ

## 5.2 ERP 内部依存
core -> domains -> management(read-only)
domains -> integration(event-bridge)

- management は domains/command に依存禁止（readのみ）

## 5.3 ERP ↔ Persona（境界依存：唯一）
erp/domains/*/events
  -> erp/integration/event-bridge
  -> persona/integration
  -> persona/civilization
  -> persona/core

---

# 6. 禁止依存（設計レベルの絶対禁止）

- persona/worlds  ─X─► persona/core（直接更新禁止）
- erp/domains     ─X─► persona/core（直接更新禁止）
- erp/management  ─X─► erp/domains/command（command呼び出し禁止）
- persona/expression ─X─► persona/core（更新禁止）
- integration バイパス ─X─►（署名・翻訳・ゲートを飛ばす行為は全禁止）

---

# 7. 責務マトリクス（誰が何をするか：固定）

## 7.1 Persona責務
- core：
  - apply-engineでのみ状態を更新
  - snapshot再発行
  - event-registry を正本として保持
- civilization：
  - outbox claim / dispatch / retry / route
- integration：
  - 外部入力の署名検証・翻訳・境界ゲート
- governance：
  - weight-control / policy / audit基準（統治）
- worlds：
  - 事実記録（domain）と event_outbox 生成のみ
- expression：
  - snapshot参照して表現（描画/生成ルート）

## 7.2 ERP責務
- core：
  - 権限、監査、採番、承認基盤、テナント、マスタの正本
- domains：
  - 現実確定（command）と参照（read）の責務
- management：
  - 集計・可視化（read-only）
- integration：
  - 外部との境界（API/Import/Export/Event-bridge）

---

# 8. Event 標準（内部イベント / 境界イベント）

## 8.1 命名（固定）
- event_type：UPPER_SNAKE_CASE（必要なら PREFIX_ を付与）
- world内イベントは worldごとに event-catalog に登録
- persona_event は core/event-registry が唯一正本

## 8.2 境界イベント（OS間）必須フィールド（固定）
- event_id (uuid)
- source_os (text)
- target_os (text)
- event_type (text)
- event_version (int, default 1)
- occurred_at (timestamptz)
- payload (jsonb)
- signature (text)  ※境界イベントのみ

ルール：
- 互換破壊は event_version を +1（共存を許容）
- signature は version を含む payload を対象とする
- 境界の入口は persona/integration のみ（バイパス禁止）

---

# 9. Freeze Tier（凍結レベル：設計固定）

## Tier 0（Hard Freeze）
Persona：
- core/state-model
- core/apply-engine（構造）
- core/snapshot-contract

ERP：
- core/auth-permission
- core/workflow
- core/audit
- core/tenant

## Tier 1（Controlled）
Persona：
- core/event-registry（重み・マッピング）
- civilization/*
- integration/*
- governance/*

ERP：
- domains/*/command
- domains/*/policy
- integration/event-bridge

## Tier 2（Flexible）
Persona：
- worlds/*
- expression-layer/*

ERP：
- domains/*/read
- management/*

---

# 10. 変更波及（Impact：設計固定）

- worlds/domain-model 変更：当該world内に局所化（Tier2）
- ERP domain/read 変更：当該アプリ/UIに局所化（Tier2）
- persona event-registry（重み）変更：人格挙動に全体影響（Tier1）
- persona apply-engine 変更：人格世界に重大影響（Tier0）
- ERP core 変更：ERP全体に重大影響（Tier0）

---

# 11. 進化ロードマップ（設計順：実装前提なし）

Persona：
- P0：core固定（Tier0）
- P1：civilization/integration（Tier1）
- P2：worlds最小（Tier2）
- P3：expression（Tier2）

ERP：
- E0：core固定（Tier0）
- E1：最小domains（Tier1）
- E2：会計連結（Tier1）
- E3：management（Tier2）
- E4：拡張domains（Tier1/2）

接続（任意）：
- X1：ERP -> Persona（event-bridge → persona/integration）※最後

---

# 12. 運用層正本とのリンク（参照のみ）
- 運用層の正本は別ファイル（監視/停止/復旧/事故対応）。
- 本書は「設計（構造/依存/責務/Freeze）」を固定し、運用手順の詳細は運用正本へ委譲する。


---

# 13. Event Standard v2 参照（正本リンク）

本設計は以下の Event 標準を参照する：

- ./event_standard_v2/00_EVENT_STANDARD_V2_CANONICAL.md
- ./event_standard_v2/schemas/00_base_event.schema.json
- ./event_standard_v2/schemas/01_interface_event.schema.json
- ./event_standard_v2/templates/SCHEMA_TEMPLATE_v1.schema.json
- ./event_standard_v2/templates/COMPATIBILITY_TABLE_TEMPLATE.md
- ./event_standard_v2/templates/REGISTRY_ENTRY_TEMPLATE.md

Eventの追加・変更・互換管理は必ず event_standard_v2 の規約に従う。
本書と矛盾する場合は 000_FULL_00_96_CANONICAL.md を最優先とする。


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
# ============================================================
# 01 GLOBAL STRUCTURE
# ============================================================

1. GLOBAL STRUCTURE
============================================================

ERP System  →  Integration Boundary  →  Persona System

Direct mutation across systems is permanently prohibited.
Only INTERFACE_EVENT may cross the boundary.

============================================================# ============================================================
# 02 PERSONA SYSTEM STRUCTURE
# ============================================================

2. PERSONA SYSTEM STRUCTURE
============================================================

persona-system/
  core/
  civilization/
  integration/
  governance/
  snapshot/
  expression-layer/
  worlds/

------------------------------------------------------------
2.1 CORE (Tier 0)
------------------------------------------------------------
- state-model
- apply-engine
- axis-engine
- identity-model
- persona-state

Core is the ONLY component allowed to mutate persona state.

------------------------------------------------------------
2.2 CIVILIZATION (Tier 1)
------------------------------------------------------------
- dispatcher
- retry
- routing
- world-bridge

No state mutation here.

------------------------------------------------------------
2.3 INTEGRATION (Tier 1)
------------------------------------------------------------
- interface-event-ingest
- signature-verify
- schema-validate
- gate-control

Fail-closed on validation failure.

------------------------------------------------------------
2.4 GOVERNANCE (Tier 1)
------------------------------------------------------------
- system-control
- fail-closed control
- audit-log

------------------------------------------------------------
2.5 SNAPSHOT (Tier 0 output)
------------------------------------------------------------
- canonical snapshot generation
- public representation only
- no reverse mutation

------------------------------------------------------------
2.6 EXPRESSION-LAYER (Tier 2)
------------------------------------------------------------
- visual
- speech
- streaming overlay
- UI composition

Never mutates core.

------------------------------------------------------------
2.7 WORLDS (Tier 2 Input Domains)
------------------------------------------------------------

worlds/
  life/
  business/
  streaming/
  game/
  governance/
  social/
  learning/

Worlds generate WORLD_EVENT only.
No direct core updates.

============================================================# ============================================================
# 03 ERP SYSTEM STRUCTURE
# ============================================================

3. ERP SYSTEM STRUCTURE (Enterprise Scope)
============================================================

erp-system/
  core/
  domains/
  integration/
  management/

------------------------------------------------------------
3.1 ERP CORE (Tier 0)
------------------------------------------------------------
- tenant model
- auth
- workflow
- audit
- permission

------------------------------------------------------------
3.2 ERP DOMAINS (Tier 1)
------------------------------------------------------------

domains/
  sales/
  purchase/
  inventory/
  accounting/
  finance/
  hr/
  manufacturing/
  crm/
  approval/
  planning/
  strategy/
  project/
  asset/
  quality/
  legal/

Domains produce DOMAIN_EVENT.

------------------------------------------------------------
3.3 ERP INTEGRATION (Tier 1)
------------------------------------------------------------
- event-bridge
- interface-event-generator
- signature attach

------------------------------------------------------------
3.4 ERP MANAGEMENT (Tier 2)
------------------------------------------------------------
- reporting
- dashboard
- analytics
- read-only projections

Management cannot execute commands.

============================================================# ============================================================
# 04 INTERFACE RULES
# ============================================================

4. ERP ↔ PERSONA INTERFACE RULES
============================================================

- Only INTERFACE_EVENT crosses systems.
- Signature required.
- schema_hash required.
- event_version required.
- Fail-closed validation.
- No direct cross-system state mutation.

============================================================# ============================================================
# 05 CHANGE CONTROL
# ============================================================

5. CHANGE CONTROL
============================================================

Tier 0:
- New version file required (v+1). No overwrite.

Tier 1:
- Compatibility documentation required.

Tier 2:
- Local change allowed but cannot violate dependency graph.

============================================================
END OF MASTER STRUCTURE v2
============================================================# DEPENDENCY GRAPH - FULL CANONICAL

## Global Structure

ERP-System  →  Integration  →  Persona-System

Direct calls between ERP and Persona are permanently prohibited.
Only INTERFACE_EVENT may cross the boundary.

---

## Persona Internal Flow

worlds → integration → civilization → core → snapshot → expression

Rules:
- worlds never mutate core directly
- expression never mutates core
- dispatcher is the only apply path

---

## ERP Internal Flow

core → domains → management (read-only)
domains → integration (boundary)

Management cannot execute domain commands.
# CANONICAL CONSISTENCY MATRIX

| Canonical File | Role |
|---------------|------|
| 000_FULL_00_96_CANONICAL.md | Constitution |
| 00_CIVILIZATION_SYSTEM_ALL_CANONICAL.md | Structure |
| EVENT_STANDARD_V2 | Event Rules |
| DEPENDENCY_GRAPH | Dependency Control |
| FREEZE_POLICY | Change Governance |
| INTEGRATION_SPEC | Boundary Rules |

Higher-level canonical always overrides lower-level documents.
# FREEZE POLICY - STRICT CANONICAL

## Tier 0 (Hard Freeze)
- Structural core components
- Event mandatory fields
- Signature + schema_hash rules

Change requires new version file (v+1). No overwrite.

## Tier 1 (Controlled)
- Registry mappings
- Command logic
- Routing rules

Must document compatibility impact.

## Tier 2 (Flexible)
- Read models
- World domain details

Cannot violate dependency graph.
# ERP ↔ PERSONA INTEGRATION SPEC

## Boundary Principle

ERP → event-bridge → Persona integration → civilization → core

No direct mutation allowed.

## Required INTERFACE_EVENT Fields

event_id
event_type
event_version
occurred_at
payload
schema_hash
source_os
target_os
signature

Signature must include canonical JSON of all above except 'signature'.
# ============================================================
# EVENT STANDARD v2 - CANONICAL
# status: CANONICAL
# owner: Boss
# prepared_by: Zero
# last_updated: 2026-03-01
# reference_constitution: 000_FULL_00_96_CANONICAL.md
# ============================================================

## 0. 目的
- イベントを「壊れない」「境界で安全」「将来拡張可能」に固定する。
- 内部イベント / worldイベント / domainイベント / OS間イベント（interface）を明確分離する。
- version戦略・署名対象・schema_hash を完全に固定する。
- Event Catalog / Compatibility Table の保管規約を固定する。

---

# 1. イベント分類（絶対固定）

| class | scope | signature | version | schema_hash |
|------|-------|-----------|---------|------------|
| INTERNAL_EVENT | 同一OS内部の補助 | NO | OPTIONAL | OPTIONAL |
| WORLD_EVENT | persona worlds 内 | NO | REQUIRED | REQUIRED |
| DOMAIN_EVENT | ERP domains 内 | NO | REQUIRED | REQUIRED |
| INTERFACE_EVENT | OS間（ERP↔Persona等） | YES | REQUIRED | REQUIRED |

**原則**
- “境界を跨ぐ”イベントは必ず INTERFACE_EVENT。
- WORLD_EVENT / DOMAIN_EVENT は outbox に入るものを指す（運用・監査対象）。

---

# 2. 命名規則（絶対固定）

## 2.1 event_type 形式
`<AREA>_<SUBJECT>_<ACTION>`

例：
- LIFE_SLEEP_RECORDED
- SALES_ORDER_CONFIRMED
- STREAMING_SESSION_STARTED
- PERSONA_MOOD_SHIFTED

## 2.2 禁止
- camelCase / kebab-case / snake_case(小文字)
- 空白、記号混在
- ACTIONだけ（UPDATED/CHANGED 等の汎用は禁止）
- AREA無し（衝突・検索不能）

---

# 3. 共通エンベロープ（全イベント共通：固定）

必須フィールド（全 class 共通）:

- event_id: uuid
- event_type: text
- event_version: int (>=1)
- occurred_at: timestamptz (ISO8601)
- payload: json object
- schema_hash: text (sha256 hex lowercase)

**固定ルール**
- payload は必ず JSON object（array/string/number を直置き禁止）
- occurred_at は “発生時刻” であり “処理時刻” ではない
- schema_hash は後述の生成ルールに従い必ず一致すること

---

# 4. INTERFACE_EVENT 追加必須（OS間イベント：固定）

INTERFACE_EVENT は上記に加えて必須:

- source_os: text
- target_os: text
- signature: text

**固定ルール**
- source_os/target_os は “OS識別子” として固定文字列を使う（例: "erp-system", "persona-system"）
- signature は後述の署名対象JSONに対して生成する
- 署名/検証をバイパスする経路は禁止（境界入口は persona/integration のみ）

---

# 5. schema_hash 生成ルール（絶対固定）

## 5.1 何をハッシュするか
**JSON Schema 本体（Draft 2020-12）の canonical JSON** を対象にする。

- 対象: 当該イベントの schema JSON 全文
- 対象外: コメント、ファイル名、改行など（= JSON以外）

## 5.2 canonical JSON（固定）
schema_hash は **次の canonicalization** の後に sha256 を取る。

canonicalization:
1) UTF-8（BOMなし）
2) JSONをパースして “論理値” として保持
3) object の key を辞書順（Unicode codepoint順）で再帰的にソート
4) 数値はJSONとして同値を保つ範囲で表現を正規化（指数表記の揺れ禁止）
5) 余分な空白・改行なしで最小JSONとしてシリアライズ

hash:
- sha256(canonical_json_bytes_utf8)
- hex lowercase（64文字）

※ 生成関数の実装は言語に依存するが、上記手順は不変。

---

# 6. Version戦略（絶対固定）

## 6.1 互換あり（MINOR扱い）
- optional field の追加
- enum の追加（既存値を壊さない）
- descriptionの変更

→ event_version は据え置き（=同じ schema_hash は変わる可能性があるが、互換ありの範囲でのみ許容）
→ ただし **schema_hash が変わる場合は Compatibility Table に追記が必須**

## 6.2 互換なし（MAJOR扱い）
以下は **互換破壊**：

- field削除
- 型変更（string→int等）
- required の追加
- 意味変更（同名keyの意味を変える）
- payload構造の再編

→ event_version を +1  
→ 旧versionと共存（最低1世代は受け入れ可能にする）

## 6.3 禁止
- versionを上げずに互換破壊
- “後から required を足す” のに version固定
- schema無し運用（WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT で schema無しは禁止）

---

# 7. Idempotency（絶対固定）

## 7.1 event_id
- event_id は UUID（v4推奨）で一意
- 同一event_id の二重適用は禁止

## 7.2 apply側の原則
- “processed_event_log（または同等の記録）” を持ち、
  event_id が存在する場合は skip（冪等）

**INTERFACE_EVENT は必ず冪等であること（境界で再送が起こり得るため）。**

---

# 8. Event Catalog 保管規約（絶対固定）

## 8.1 ディレクトリ（Persona worlds）
- worlds/<world>/event-catalog/<EVENT_TYPE>/v<version>.schema.json
- worlds/<world>/event-catalog/<EVENT_TYPE>/compatibility.md

例:
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/v1.schema.json
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/v2.schema.json
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/compatibility.md

## 8.2 ディレクトリ（ERP domains）
- domains/<domain>/event-catalog/<EVENT_TYPE>/v<version>.schema.json
- domains/<domain>/event-catalog/<EVENT_TYPE>/compatibility.md

## 8.3 INTERFACE_EVENT の保管
- integration/interface-events/<EVENT_TYPE>/v<version>.schema.json
- integration/interface-events/<EVENT_TYPE>/compatibility.md

---

# 9. Compatibility Table（互換性テーブル：絶対固定）

**目的**
- 受け入れ可能versionの一覧を “正本” として残す
- schema_hash の差分（互換 or 破壊）を追跡する
- “どのversionをいつまで受け入れるか” を明記する

**必須列**
- event_type
- event_version
- schema_hash
- compatibility: COMPATIBLE / BREAKING
- introduced_at (date)
- deprecated_at (date or blank)
- notes

---

# 10. Registry 登録手順（設計手順：固定）

WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT を追加・変更する際の手順：

1) event_type を命名規則で決める
2) v1.schema.json を作る（templates参照）
3) schema_hash を算出し、compatibility table に追記する
4) event-catalog に格納する（規約パス厳守）
5) (Personaの場合) persona-system/core/event-registry に “許可event” として登録する
6) (Interfaceの場合) integration 側で署名対象に含め、検証を強制する
7) 互換破壊なら v+1 を作り、旧も受け入れ可能期間を明記する

---

# 11. Freeze（Event標準の凍結）

Tier 0（Hard Freeze）
- 本書の分類・必須フィールド・命名規則
- schema_hash生成ルール
- INTERFACE_EVENT の署名対象フィールド定義
- Compatibility Table 必須列

Tier 1（Controlled）
- event_registry の route / weight / 受け入れversion範囲

Tier 2（Flexible）
- payloadの詳細追加（互換範囲内）
- world/domain固有の追加仕様（ただし本標準を破らない）

# EVENT STANDARD v2 - CANONICAL

## Classification

INTERNAL_EVENT  - internal only
WORLD_EVENT     - persona world events
DOMAIN_EVENT    - ERP domain events
INTERFACE_EVENT - cross-OS events (signature required)

---

## Required Fields (All Events)

event_id (uuid)
event_type (UPPER_SNAKE_CASE)
event_version (int >=1)
occurred_at (ISO8601)
payload (JSON object)
schema_hash (sha256 hex lowercase)

---

## INTERFACE_EVENT Additional Fields

source_os
target_os
signature

Signature excludes the 'signature' field itself.
# SCHEMA HASH RULES - CANONICAL

schema_hash = sha256(canonical_json(schema))

Canonical JSON rules:
1. UTF-8 without BOM
2. Keys sorted lexicographically
3. No extra whitespace
4. Numbers normalized
5. Minimal JSON serialization

Hash output:
- lowercase hex
- 64 characters
# VERSION POLICY - CANONICAL

Compatible (Minor):
- Optional field added
- Enum extended
- Description changed

Breaking (Major):
- Field removed
- Type changed
- Required added
- Semantic meaning changed

Breaking change requires:
- event_version +1
- compatibility table update
# EVENT CATALOG STRUCTURE - CANONICAL

Persona worlds:
worlds/<world>/event-catalog/<EVENT_TYPE>/v<version>.schema.json

ERP domains:
domains/<domain>/event-catalog/<EVENT_TYPE>/v<version>.schema.json

Interface events:
integration/interface-events/<EVENT_TYPE>/v<version>.schema.json
# COMPATIBILITY TABLE TEMPLATE

| event_type | event_version | schema_hash | compatibility | introduced_at | deprecated_at | notes |
|------------|--------------|-------------|--------------|---------------|--------------|-------|

compatibility values:
COMPATIBLE
BREAKING
# REGISTRY RULES - CANONICAL

Persona event-registry must define:

event_type
accepted_versions
route
weight adjustments

Registry must match compatibility table.
Breaking changes require explicit version handling.
# ============================================================
# CIVILIZATION OS – BEHAVIOR CANONICAL v1.0.0
# Status: CANONICAL
# Phase: Behavior Design Fixed
# Owner: Boss
# ============================================================

This document defines:

- World Responsibility
- Apply Engine Algorithm
- ERP Dependency Matrix
- Runtime Governance Rules
- Determinism & Immutability Principles

Structure Canonical remains superior.
This document fixes runtime behavior only.

============================================================
1. WORLD RESPONSIBILITY CANONICAL
============================================================

1.1 World Nature

Worlds are:
- Stateless
- Deterministic
- Input interpretation layers only

Worlds are NOT:
- State holders
- Core mutators
- Cross-world communicators

Worlds emit WORLD_EVENT only.

------------------------------------------------------------
1.2 Allowed Capabilities
------------------------------------------------------------

World may:
- Interpret external input
- Validate local input format
- Construct event payload
- Suggest weight (optional)

World may NOT:
- Read persona_state directly
- Modify persona_state
- Call another world
- Emit INTERFACE_EVENT
- Persist state

------------------------------------------------------------
1.3 Boundary Rule
------------------------------------------------------------

World Output → Civilization Dispatcher → Core Apply Engine

Meaning interpretation = World
Meaning application = Core

------------------------------------------------------------
1.4 Event Priority
------------------------------------------------------------

No world-level priority override.

Ordering governed by:
1. occurred_at
2. event_id (lexicographic fallback)

============================================================
2. APPLY ENGINE CANONICAL
============================================================

Core is the only state mutator.

Apply Engine MUST be:
- Pure
- Deterministic
- Replay-safe

------------------------------------------------------------
2.1 Apply Pipeline
------------------------------------------------------------

Step 1 – Structural Validation
- schema_hash verification
- version compatibility check
- registry existence check

Step 2 – Signature Validation (INTERFACE_EVENT only)

Step 3 – Routing Resolution

WORLD_EVENT     → Core
INTERFACE_EVENT → Integration → Core
DOMAIN_EVENT    → ERP only (never persona)

Step 4 – Deterministic Apply

new_state = apply(current_state, payload)

Rules:
- No external I/O
- No current time access
- No randomness
- No network
- No global mutable access

Step 5 – Post-Apply
- append audit log
- generate new snapshot
- notify expression-layer

Snapshot is read-only projection.

------------------------------------------------------------
2.2 Immutability
------------------------------------------------------------

persona_state is immutable.

Apply produces:
persona_state_v(n+1)

Previous versions must be reconstructable via event replay.

------------------------------------------------------------
2.3 Replay Guarantee
------------------------------------------------------------

Given identical:
- event sequence
- event ordering
- event payload
- versioned handler

System MUST reproduce identical persona_state.

============================================================
3. ERP DEPENDENCY MATRIX CANONICAL
============================================================

ERP Domains produce DOMAIN_EVENT only.
Cross-domain direct mutation prohibited.

------------------------------------------------------------
3.1 Directional Rules (Examples)
------------------------------------------------------------

Allowed:
sales        → accounting
purchase     → accounting
inventory    → accounting
hr           → finance

Forbidden:
accounting   → sales
finance      → inventory

Accounting is financial truth source.

------------------------------------------------------------
3.2 Domain Isolation
------------------------------------------------------------

Domains cannot:
- Directly mutate another domain
- Access persona
- Emit WORLD_EVENT

------------------------------------------------------------
3.3 Management Layer
------------------------------------------------------------

Management is:
- Read-only
- Projection-only
- Cannot execute commands

============================================================
4. RUNTIME GOVERNANCE
============================================================

------------------------------------------------------------
4.1 Fail-Closed Enforcement
------------------------------------------------------------

Reject on:
- schema mismatch
- version incompatibility
- invalid signature
- unknown event_type

No silent fallback.
No implicit compatibility.

------------------------------------------------------------
4.2 Freeze Protocol
------------------------------------------------------------

Tier 0:
- MAJOR bump required
- New version file
- No overwrite

Tier 1:
- Compatibility documentation required

Tier 2:
- Cannot violate dependency graph

------------------------------------------------------------
4.3 Rollback
------------------------------------------------------------

Rollback via:
- Versioned handler retention
- Compatibility routing

Existing handlers are never overwritten.

============================================================
5. SYSTEM INVARIANTS
============================================================

Must always hold:

- No cross-layer mutation
- No cross-system direct call
- All state changes via event
- Apply engine is pure
- Snapshot is read-only
- Registry matches compatibility table
- Dependency graph respected

Violation = constitutional breach.

============================================================
6. CIVILIZATION BEHAVIOR AXIOMS
============================================================

Structure > Features
Safety > Convenience
Explicit > Implicit
Fail-Closed > Silent Fallback
Determinism > Performance

============================================================
END OF BEHAVIOR CANONICAL v1.0.0
============================================================

# ============================================================
# CIVILIZATION OS – PERSONA MATH CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Persona Core Internal Mathematics
# Owner: Boss
# ============================================================

This document defines:

- Axis Model
- Emotion Vector Model
- Growth Model
- Decay Model
- Weight Application Formula
- Saturation & Normalization Rules

Pure deterministic. Replay-safe.

============================================================
1. AXIS MODEL (Long-term Traits)
============================================================

1.1 Axis Set (Fixed)

Persona Core defines exactly 6 base axes:

1. vitality      (生命力)
2. intellect     (知性)
3. discipline    (規律)
4. social        (社会性)
5. creativity    (創造性)
6. stability     (精神安定)

Fixed size: 6
Adding/removing axes is a MAJOR change.

------------------------------------------------------------
1.2 Axis Range
------------------------------------------------------------

Each axis is continuous float:

0.0 ≤ axis ≤ 100.0

- 0   = absence
- 50  = neutral human baseline
- 100 = theoretical peak

No negative values.
No overflow allowed.

------------------------------------------------------------
1.3 Saturation Rule (Soft Cap)
------------------------------------------------------------

Soft saturation near upper bound:

new_value = old_value + Δ

If new_value > 100:
  new_value = 100 - (100 - old_value) * 0.1

If new_value < 0:
  new_value = 0

============================================================
2. EMOTION VECTOR MODEL (Short-term Reaction)
============================================================

Emotion is not a persistent axis.
It is a decaying vector.

------------------------------------------------------------
2.1 Emotion Dimensions
------------------------------------------------------------

4D vector:

- joy
- anger
- fear
- sadness

Range:
-100.0 ≤ emotion ≤ +100.0

0 = neutral
Positive/negative allowed.

------------------------------------------------------------
2.2 Emotion Apply
------------------------------------------------------------

emotion_new = emotion_old + emotion_delta

Then clamp to [-100, 100].

------------------------------------------------------------
2.3 Emotion Decay
------------------------------------------------------------

Exponential decay per apply cycle:

emotion(t+1) = emotion(t) × 0.90

Decay rate fixed at 10% per cycle.

============================================================
3. GROWTH MODEL (Long-term Progression)
============================================================

Growth accumulates through axis changes.

------------------------------------------------------------
3.1 Growth Score
------------------------------------------------------------

Each axis has a hidden growth_score contribution:

growth_score += abs(delta_axis)

Total growth is:

total_growth_score = sum(growth_score over all axes)

------------------------------------------------------------
3.2 Level Function (Non-linear)
------------------------------------------------------------

Persona Level L:

L = floor( sqrt(total_growth_score) / 5 )

Rationale:
- Fast early progress
- Slower at higher levels
- Stable monotonic growth

============================================================
4. WEIGHT APPLICATION FORMULA
============================================================

All WORLD_EVENT deltas computed as:

Δ = base_value × world_weight × persona_modifier

------------------------------------------------------------
4.1 world_weight
------------------------------------------------------------

Default: 1.0
Range: 0.0 – 2.0
World cannot exceed 2.0.

------------------------------------------------------------
4.2 persona_modifier
------------------------------------------------------------

Derived from stability axis:

persona_modifier = 0.5 + (stability / 100)

Range: 0.5 – 1.5

Higher stability increases controlled adaptation.

============================================================
5. CROSS-AXIS / EMOTION INFLUENCE
============================================================

Fixed influence coefficients:

- vitality   → stability   : 0.20
- intellect  → creativity  : 0.15
- discipline → stability   : 0.25
- social     → joy         : 0.30

Influence applied as secondary delta:

secondary_delta = primary_delta × factor

============================================================
6. ORDER OF APPLY (Strict)
============================================================

For each event:

1. Compute primary axis delta
2. Apply cross-axis influence (secondary deltas)
3. Apply emotion delta
4. Apply saturation/clamp
5. Update growth_score
6. Apply emotion decay

No deviation allowed.

============================================================
7. DETERMINISM GUARANTEE
============================================================

Forbidden:
- Randomness
- Time-based scaling
- External I/O
- Non-deterministic ordering

Floating drift control:
After each step, apply:

round(value, 4)

============================================================
8. SYSTEM INVARIANTS
============================================================

- Axis always within [0, 100]
- Emotion always within [-100, 100]
- Growth monotonically increases
- Level never decreases
- Apply is pure function

Violation = constitutional breach.

============================================================
END OF PERSONA MATH CANONICAL v1.0.0
============================================================

# ============================================================
# CIVILIZATION OS – SIMULATION CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Deterministic Predictive Engine
# Owner: Boss
# ============================================================

Simulation is a non-mutating deterministic projection engine.

It MUST:
- Not mutate real state
- Not alter audit log
- Not emit real events
- Remain replay-safe

============================================================
1. PURPOSE
============================================================

Simulation exists to:

- Predict persona_state evolution
- Evaluate decision branches
- Detect risk before mutation
- Validate deterministic integrity

Simulation is advisory only.
It never commits.

============================================================
2. SHADOW APPLY ENGINE
============================================================

Simulation uses a shadow state:

sim_state_0 = current_real_state

For event sequence E:

sim_state_n = apply_sequence(sim_state_0, E)

Rules:
- Same apply engine
- Same math
- Same ordering
- Same rounding (4 decimals)

No alternative logic allowed.

============================================================
3. BRANCHING MODEL
============================================================

Simulation supports branching tree.

Definition:

Root: current state
Each branch:
- Independent event sequence
- Independent shadow state

Example:

Branch A: [event1, event2]
Branch B: [event1, event3]

Each produces:

sim_state_A
sim_state_B

Branches never interact.

============================================================
4. HORIZON CONTROL
============================================================

Simulation supports:

- Event-count horizon (N events)
- Fixed-sequence horizon
- Conditional horizon (until level X)

No time-based progression.
Only event-based progression.

============================================================
5. RISK EVALUATION MODEL
============================================================

Risk is deterministic function of sim_state.

------------------------------------------------------------
5.1 Collapse Risk
------------------------------------------------------------

If:
stability < 20 AND vitality < 20

Risk = HIGH

------------------------------------------------------------
5.2 Burnout Risk
------------------------------------------------------------

If:
vitality < 15

Risk = CRITICAL

------------------------------------------------------------
5.3 Volatility Risk
------------------------------------------------------------

If:
abs(anger) > 70

Risk = HIGH

------------------------------------------------------------
5.4 Growth Instability
------------------------------------------------------------

If:
growth_delta_last_10_events variance > threshold

Risk = UNSTABLE

Risk output is structured:

{
  "collapse": LOW/MEDIUM/HIGH,
  "burnout": LOW/MEDIUM/HIGH/CRITICAL,
  "volatility": LOW/MEDIUM/HIGH,
  "growth_instability": LOW/MEDIUM/HIGH
}

============================================================
6. ERP INTERFACE SIMULATION
============================================================

ERP → INTERFACE_EVENT can be simulated.

Simulation must:

- Verify signature
- Verify schema_hash
- Apply via shadow integration

ERP simulation NEVER touches real persona.

============================================================
7. DETERMINISM GUARANTEE
============================================================

Simulation must satisfy:

apply_real(E) == commit(simulate(E))

If mismatch occurs:
System defect.

Simulation uses:
- identical math
- identical rounding
- identical ordering

============================================================
8. MEMORY ISOLATION
============================================================

Simulation state exists only in:

- local memory
- ephemeral structure

No persistence.
No snapshot commit.

============================================================
9. PERFORMANCE LIMITS
============================================================

To prevent explosion:

Max branches per simulation call: 50
Max events per branch: 1000

Exceeding limits → reject (fail-closed)

============================================================
10. SYSTEM INVARIANTS
============================================================

Simulation must:

- Not mutate real state
- Not emit real events
- Not alter audit logs
- Not bypass validation
- Respect dependency graph

Violation = constitutional breach.

============================================================
END OF SIMULATION CANONICAL v1.0.0
============================================================

# ============================================================
# CIVILIZATION OS – ERP DEPENDENCY CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Enterprise Domain Dependency Governance
# Owner: Boss
# ============================================================

This document fixes:

- Full domain dependency direction matrix
- Financial priority hierarchy
- Mandatory audit routing
- Event-only boundary enforcement
- DAG (Directed Acyclic Graph) enforcement

ERP is enterprise-grade.
No structural ambiguity allowed.

============================================================
1. DOMAIN LIST (Fixed)
============================================================

sales
purchase
inventory
accounting
finance
hr
manufacturing
crm
approval
planning
strategy
project
asset
quality
legal

Adding/removing domains = MAJOR change.

============================================================
2. DEPENDENCY RULE TYPES
============================================================

ALLOWED      : direct event flow allowed
EVENT_ONLY   : must pass through DOMAIN_EVENT boundary
FORBIDDEN    : no directional influence permitted

Direct state mutation across domains is always prohibited.
All influence via DOMAIN_EVENT only.

============================================================
3. FINANCIAL PRIORITY HIERARCHY
============================================================

Hierarchy (highest authority first):

1. accounting
2. finance
3. approval
4. all operational domains

Accounting is the single financial truth source.
No domain may override accounting outputs.

============================================================
4. CORE DIRECTIONAL MATRIX
============================================================

Allowed directional influence (via DOMAIN_EVENT):

sales        → accounting
purchase     → accounting
inventory    → accounting
manufacturing→ inventory
manufacturing→ accounting
hr           → finance
finance      → accounting
crm          → sales
project      → accounting
asset        → accounting
quality      → manufacturing
legal        → approval
strategy     → planning
planning     → project

------------------------------------------------------------
FORBIDDEN (examples)
------------------------------------------------------------

accounting   → sales
accounting   → purchase
finance      → inventory
sales        → hr
hr           → accounting (direct override)
crm          → accounting
project      → hr
quality      → accounting (direct)

If not explicitly allowed, it is FORBIDDEN.

============================================================
5. EVENT-ONLY ENFORCEMENT
============================================================

All domain influence must:

- Emit DOMAIN_EVENT
- Be schema-validated
- Pass registry validation
- Be auditable

No cross-domain function calls.
No shared mutable state.

============================================================
6. MANDATORY AUDIT ROUTING
============================================================

For financially impacting events:

domain → accounting → audit-log → finalize

Finalization without accounting validation is prohibited.

High-risk events (value > threshold):
Must pass through approval domain before finalize.

============================================================
7. DAG ENFORCEMENT
============================================================

Domain dependency graph must remain acyclic.

No circular dependency allowed.

Violation = structural defect.

============================================================
8. PERSONA BOUNDARY RULE
============================================================

ERP may influence Persona ONLY via:

INTERFACE_EVENT

No DOMAIN_EVENT may cross to Persona directly.

ERP simulation must also respect this rule.

============================================================
9. MANAGEMENT LAYER RESTRICTION
============================================================

Management layer is:

- Read-only
- Projection-only
- Cannot emit DOMAIN_EVENT
- Cannot override accounting

============================================================
10. SYSTEM INVARIANTS
============================================================

- Accounting remains final financial truth
- No domain override of accounting
- All cross-domain influence via DOMAIN_EVENT
- DAG structure preserved
- Persona boundary respected
- Audit routing enforced

Violation = constitutional breach.

============================================================
END OF ERP DEPENDENCY CANONICAL v1.0.0
============================================================

# ============================================================
# CIVILIZATION OS – SNAPSHOT & CRYPTO GOVERNANCE CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Public Representation & Cryptographic Authority
# Owner: Boss
# ============================================================

This document defines:

- Snapshot structure
- Public exposure rules
- Cryptographic signature governance
- Key rotation protocol
- Tamper detection guarantees

============================================================
1. SNAPSHOT PRINCIPLE
============================================================

Snapshot is:

- Read-only
- Deterministic
- Derived from persona_state
- Public-safe projection

Snapshot NEVER mutates core state.

============================================================
2. SNAPSHOT STRUCTURE
============================================================

Snapshot contains:

- persona_id
- level
- axis (public subset)
- emotion (optional subset)
- growth_summary
- version
- snapshot_hash
- signature

Private internal fields MUST NOT be included.

============================================================
3. SNAPSHOT HASH RULE
============================================================

snapshot_hash = sha256(canonical_json(snapshot_without_signature))

Canonical JSON rules:
- UTF-8
- sorted keys
- no whitespace
- deterministic number formatting

============================================================
4. SNAPSHOT SIGNATURE
============================================================

signature = sign(snapshot_hash, private_key)

Signature excludes signature field itself.

Verification:

verify(signature, snapshot_hash, public_key) == true

Invalid signature → reject.

============================================================
5. KEY GOVERNANCE
============================================================

Two key tiers:

Tier A – System Root Key
- Signs integration events
- Signs snapshot keys
- Offline storage recommended

Tier B – Snapshot Signing Key
- Signs snapshot_hash
- Rotatable without system reset

Private keys must never be exposed.

============================================================
6. KEY ROTATION PROTOCOL
============================================================

Rotation requires:

- New key generation
- New public key publication
- Version increment
- Signature of new public key by Root Key

Old snapshots remain verifiable.

No overwrite of historical keys.

============================================================
7. PUBLIC EXPOSURE RULES
============================================================

Snapshot may be exposed via:

- API
- Export file
- NFT-style record
- Streaming overlay

But must:

- Include version
- Include signature
- Include hash

Unsigned snapshot = invalid.

============================================================
8. TAMPER DETECTION GUARANTEE
============================================================

If snapshot content changes:

snapshot_hash changes
signature invalidates

Tampered snapshot must fail verification.

============================================================
9. SYSTEM INVARIANTS
============================================================

- Snapshot is projection only
- Core state cannot be reconstructed from snapshot
- Private keys never logged
- All public artifacts signed
- Signature verification deterministic

Violation = constitutional breach.

============================================================
END OF SNAPSHOT & CRYPTO CANONICAL v1.0.0
============================================================

# ============================================================
# CIVILIZATION OS – MASTER INDEX v1.0.0
# Status: CANONICAL INDEX
# Owner: Boss
# Purpose: Unified Reference of All Canonical Documents
# ============================================================

This document is the authoritative index of Civilization OS Canonical files.
It does not define behavior.
It defines hierarchy and relationships.

============================================================
0. CONSTITUTIONAL AUTHORITY
============================================================

Highest authority:

- 000_FULL_00_96_CANONICAL.md
- CIVILIZATION_FULL_INTEGRATED_CANONICAL_v2.0.0

If any document conflicts, higher-level canonical prevails.

============================================================
1. STRUCTURE LAYER
============================================================

Defines architecture and boundaries.

- CIVILIZATION_MASTER_STRUCTURE_CANONICAL_v2
- DEPENDENCY_GRAPH_FULL_CANONICAL
- FREEZE_POLICY_STRICT_CANONICAL
- ERP_PERSONA_INTEGRATION_SPEC_CANONICAL

Responsibility:
- Component hierarchy
- Boundary enforcement
- Change governance

============================================================
2. EVENT GOVERNANCE LAYER
============================================================

Defines communication contract.

- EVENT_STANDARD_V2
- SCHEMA_HASH_RULES
- VERSION_POLICY
- EVENT_CATALOG_STRUCTURE
- COMPATIBILITY_TABLE_TEMPLATE
- REGISTRY_RULES

Responsibility:
- Event validation
- Version compatibility
- Signature requirements
- Fail-closed enforcement

============================================================
3. BEHAVIOR LAYER
============================================================

Defines runtime behavior.

- BEHAVIOR_CANONICAL_v1.0.0

Responsibility:
- World responsibility
- Apply engine pipeline
- Immutability rules
- Determinism guarantees

============================================================
4. PERSONA INTERNAL PHYSICS
============================================================

Defines mathematical model.

- PERSONA_MATH_CANONICAL_v1.0.0

Responsibility:
- Axis model
- Emotion vector
- Growth curve
- Saturation
- Weight formula

============================================================
5. SIMULATION ENGINE
============================================================

Defines predictive behavior.

- SIMULATION_CANONICAL_v1.0.0

Responsibility:
- Shadow apply engine
- Branching model
- Risk evaluation
- Horizon control

============================================================
6. ERP ENTERPRISE GOVERNANCE
============================================================

Defines enterprise domain control.

- ERP_DEPENDENCY_CANONICAL_v1.0.0

Responsibility:
- Domain dependency matrix
- Financial authority hierarchy
- Audit routing
- DAG enforcement

============================================================
7. PUBLIC REPRESENTATION & CRYPTO
============================================================

Defines public contract and security.

- SNAPSHOT_CRYPTO_CANONICAL_v1.0.0

Responsibility:
- Snapshot projection rules
- Hash rules
- Signature governance
- Key rotation protocol

============================================================
8. SYSTEM INVARIANT SUMMARY
============================================================

The following must always hold:

- Structure > Behavior
- No cross-layer mutation
- All changes via event
- Apply engine pure
- Simulation non-mutating
- ERP DAG preserved
- Snapshot signed
- Fail-Closed enforced

Violation of any invariant = constitutional breach.

============================================================
9. VERSION GOVERNANCE
============================================================

MAJOR:
- Structural change
- Axis count change
- Event contract break
- Domain addition/removal

MINOR:
- Backward compatible extension
- Non-breaking math adjustment

PATCH:
- Documentation fix
- Clarification only

============================================================
10. CIVILIZATION STATE
============================================================

Current Canonical Set:

Structure: Fixed
Behavior: Fixed
Persona Physics: Fixed
Simulation: Fixed
ERP Governance: Fixed
Snapshot & Crypto: Fixed

Civilization OS Status:
STRUCTURALLY SEALED
DETERMINISTIC
REPLAY-SAFE
FAIL-CLOSED
CRYPTO-VERIFIABLE

============================================================
END OF MASTER INDEX v1.0.0
============================================================

