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
