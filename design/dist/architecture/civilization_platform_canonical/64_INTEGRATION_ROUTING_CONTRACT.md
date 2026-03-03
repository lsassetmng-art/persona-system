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
