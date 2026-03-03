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
