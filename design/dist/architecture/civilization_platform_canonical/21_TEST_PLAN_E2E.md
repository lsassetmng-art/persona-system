# 21 E2E Test Plan（止める・冪等・署名・再試行・version共存）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Civilization Platform の不変条件（I1〜I7）を E2E で保証する。

---

# 1. テストカテゴリ

## T1: Stop（停止可能性 / I5）
### T1-1 Persona Apply Stop
手順：
1) personaos.system_control.apply_enabled='0'
2) apply endpoint を呼ぶ
期待：
- HTTP 503
- personaos.apply_run_log に "apply halted by control"
3) 戻す（apply_enabled='1'）

### T1-2 Dispatcher Stop（Global）
手順：
1) civilization.system_control.dispatch_enabled='0'
2) dispatcher endpoint を呼ぶ
期待：
- claimed=0 or halted=true
- outbox状態が変化しない
3) 戻す（dispatch_enabled='1'）

### T1-3 Dispatcher Stop（World）
手順：
1) 対象 world_schema.system_control.dispatch_enabled='0'
2) dispatcher 実行
期待：
- そのworldだけ処理されない（skipped_by_control増加）
- 他worldは通常処理

---

## T2: Idempotency（冪等 / I7）
### T2-1 Apply Duplicate
手順：
1) 同一 event_id を2回 apply
期待：
- 1回目 200
- 2回目 409 duplicate
- persona_state/growth が二重増幅されない

---

## T3: Signature Gate（署名原則 / I3）
### T3-1 Reject Unverified
手順：
1) signature_verified=false の external_event を投入（または ingestで偽）
期待：
- routeされない
- outboxに出ない
- rejectログが残る

---

## T4: Retry/Dead（ライブネス / L1）
### T4-1 Retry Works
手順：
1) apply が 500 になるよう意図的に失敗を作る
2) dispatcher 実行
期待：
- INFLIGHT → PENDING/RETRY に戻る
- dispatch_attempts increment
- next_retry_at set

### T4-2 Dead Letter
手順：
1) MAX_RETRY を超えるまで失敗
期待：
- dispatch_status=DEAD
- shared.dispatcher_dead_letter に集約（運用実装がある場合）

---

## T5: Version Coexist（I4）
### T5-1 event_version passthrough
手順：
1) outbox row を event_version=2 で作る
2) dispatcher → apply
期待：
- apply が context.__event_version=2 をログに残す
- apply_run_log に event_version が追跡可能（metaログ）

### T5-2 Version Policy（将来）
手順：
- v1 only accept policy を追加した場合の挙動テスト
期待：
- v2は拒否 or fallback（設計ポリシーに従う）

---

# 2. 最低限の証明（合格条件）
- T1/T2/T3/T4/T5 が全て通る
- INFLIGHT stuck が発生しない
- duplicate で状態二重反映がない
- signature_verified=false が文明状態へ影響しない

---

# 3. 付録：復旧手順
- system_control を 1 に戻す
- DEAD を DLQ から再投入する場合は新event_idで行う（再利用禁止）

