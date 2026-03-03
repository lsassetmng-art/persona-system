# 67 Integration Routing Overview（Gate後ルーティング 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
integration.gate_validate_actor_action() が通した “越境要求” を
安全に「配送キュー」に積み、後段で各OSへ投入できるようにする。

---

## 1. 重要な現実（確定）
- 各schemaの event_outbox は列構造が完全一致していない
  - business は独自列が多い
- ERPは別Project（DATABASE_URL）であり、Persona側DBから直接INSERTできない
  - よって越境は “外部配送” として扱う必要がある

---

## 2. ルーティング方針（共通化優先）
Gate通過後は、まず必ず integration.actor_route_queue に積む（共通キュー）。
これにより：

- 同一DB内OS（streaming/game/life/governance 等）も統一経路
- 別Project ERP も同一経路（外部配送として送れる）
- outbox列差分の事故を排除できる

---

## 3. 出力
Gate通過要求 → integration.actor_route_queue（PENDING）
後段（別設計/別実装）で：
- internal OS: queue → <schema>.event_outbox に変換投入
- external OS(ERP): queue → Edge/pg_net 等で ERP にPOST/INSERT

---

## 4. 禁止
- Gateを通さずに outbox へ直接投入
- outbox列差を無視した直INSERT（事故源）
