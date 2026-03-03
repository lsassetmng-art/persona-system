# 68 Integration Route Registry（配送先/方式の登録 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
os_key ごとに「internal/external」等の配送方式を固定し、運用で止められるようにする。

---

## 1. integration.route_registry（DBモデル）
- os_key (text) PK
- route_kind (text) … INTERNAL_DB / EXTERNAL_HTTP
- target_schema (text, nullable) … INTERNAL_DB の場合
- target_hint (text, nullable) … EXTERNAL の場合の識別子（URL名/connector名など）
- is_enabled (bool)
- created_at, updated_at

Fail-Closed:
- registry未登録 / is_enabled=false → routing拒否

---

## 2. 初期推奨（設計）
- erpos → EXTERNAL_HTTP（別Projectへ配送）
- streaming/game/life/governance/business → INTERNAL_DB（同一DB内）
