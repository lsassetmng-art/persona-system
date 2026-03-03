# 74 INTERNAL_DB Delivery Specification
status: FROZEN_CANONICAL

---

## 対象

同一DB内OS:
- streaming
- game
- life
- governance
- business
- system

---

## 処理

1. PENDING行をSELECT FOR UPDATE SKIP LOCKED
2. target_schema.event_outbox に INSERT
3. 成功 → DONE
4. 失敗 → attempts+1, next_retry_at設定

---

## 重要

event_outbox列差があるため、
Deliveryは「最小共通列のみ」を投入する：

- event_id
- event_type (= action_key)
- user_id (= owner_user_id)
- payload
- occurred_at
- source_os='integration'
- event_version

他列は default 任せ。
