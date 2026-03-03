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

