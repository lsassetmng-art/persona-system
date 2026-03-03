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

