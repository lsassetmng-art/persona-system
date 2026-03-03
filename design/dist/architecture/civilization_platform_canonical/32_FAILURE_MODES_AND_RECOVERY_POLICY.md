# 32 Failure Modes and Recovery Policy（障害/復旧 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
「止まる」「戻る」「死ぬ（DEAD）」「追える」を設計で保証する。

---

# 1. 代表障害と期待挙動

## 1) Apply失敗
- dispatcherは mark_retry を呼び PENDING/DEAD に戻す
- INFLIGHT放置禁止（fallback update）
- last_dispatch_error 記録

## 2) mark_done失敗
- INFLIGHT残留するので必ず retry に落とす（共通ロジック）

## 3) 署名検証失敗
- ingest_status=REJECT
- routeしない（無影響）

## 4) duplicate（冪等）
- 409 は成功扱い（DONEにできる）

## 5) control停止
- 503 halted
- best-effort でログ

---

# 2. DEADポリシー
- MAX_RETRY超過で DEAD
- DLQ（shared.dispatcher_dead_letter）へ集約（推奨）
- 再投入は新event_idで行う（再利用禁止）

---

# 3. 復旧手順（設計）
- maintenance_mode → os_enabled → ingest/dispatch/apply の順に戻す
- 監査ログを残す
