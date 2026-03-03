# 75 EXTERNAL_HTTP Delivery Specification（ERP向け）
status: FROZEN_CANONICAL

---

## 対象

- erpos（別Project）

---

## 処理

1. PENDING行取得
2. target_hint から ERP endpoint を解決
3. HTTP POST
4. 200系 → DONE
5. 4xx → DEAD
6. 5xx → retry

---

## 重要

ERP側も Fail-Closed で
signature / event_version / idempotency を再検証する。

Integrationは「配送」だけ。
