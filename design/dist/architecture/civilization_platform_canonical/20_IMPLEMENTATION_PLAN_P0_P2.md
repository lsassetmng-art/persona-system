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

