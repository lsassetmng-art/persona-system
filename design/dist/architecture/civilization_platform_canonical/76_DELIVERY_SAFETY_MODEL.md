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
