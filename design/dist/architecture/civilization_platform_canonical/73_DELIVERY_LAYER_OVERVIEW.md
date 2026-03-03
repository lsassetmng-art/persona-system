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
