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
