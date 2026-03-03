# 14 Civilization Formal Model（形式モデル）
status: SUPREME_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Civilization Platform を「数学的に検証可能」な形で定義する。
実装は後。ここでは不変条件（Invariants）と遷移（State Machines）を固定する。

---

# 1. 基本集合（Sets）
## 1.1 OS集合
OS = { Business, Life, Game, Streaming, PersonaCore, Civilization, Governance, Integration }
Foundation = { auth, storage, realtime, cron, vault, net, shared, system } ※OSではない

## 1.2 責任レベル
Resp(OS):
- R3: Business（将来 ERP を追加予定）
- R2: PersonaCore, Civilization, Governance
- R1: Life, Game, Streaming
- R0: Foundation

## 1.3 イベント分類
Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

---

# 2. データ型（Types）
## 2.1 InterfaceEvent（境界通過イベント）
E = (
  event_id: uuid,
  source_os: text,
  target_os: text,
  event_type: text,
  event_version: int (>=1),
  occurred_at: timestamptz,
  payload: jsonb,
  signature: text?  -- boundary event only
  signature_verified: bool? -- Integrationで検証結果
)

## 2.2 OutboxState（配送状態）
DispatchStatus = { PENDING, INFLIGHT, DONE, RETRY, DEAD }

OutboxRow = (
  event_id, source_os, event_type, event_version,
  user_id?, payload, occurred_at,
  dispatch_status, dispatch_attempts, next_retry_at?,
  dispatched_at?, last_dispatch_error?, created_at
)

## 2.3 ControlState（OS停止）
ControlKey = { os_enabled, ingest_enabled, dispatch_enabled, apply_enabled, maintenance_mode }
ControlValue = text  -- '0'/'1' を基本とし将来拡張可

Control(OS) : ControlKey -> ControlValue

---

# 3. 状態（State）
全体状態 S は以下の直積で表す：

S = (
  Outbox: OS -> set(OutboxRow),
  ExtIngest: set(E),             -- integration.external_event
  Registry: map(event_type -> rule), -- integration.event_registry 等
  Growth: set(growth_event),     -- personaos.growth_events 等
  Audit: append-only log,
  Control: OS -> Control(OS)
)

---

# 4. 不変条件（Safety Invariants）
## I1: 責任逆転禁止（No Direct Write Across Responsibility）
Resp(source) < Resp(target) で target の「状態変更」を直接行ってはならない。
具体：
- R2（Cognitive） -> R3（Reality）への直接DB更新は禁止
- R1 -> R3 も禁止
許可されるのは SUGGESTION と APPROVAL/EXECUTION 経由のみ

## I2: 唯一経路原則（Single Gateway）
OS間の境界通過イベントは Integration を経由する。
すなわち境界イベントの導出は：
E(source,target) は Integration による verify/route を必ず通る。

## I3: 署名原則（Signature for Boundary）
境界イベント（FACT_EVENT / POLICY_EVENT / EXECUTION 等）は署名必須。
Integration は signature_verified=true のみを “信頼入力” として処理する。

## I4: Version共存（Versioned Interface）
境界イベントは event_version>=1 を必須とする。
互換破壊は event_version を増加させる（同一event_typeで共存可能）。

## I5: 停止可能性（Stoppability）
すべてのOSは Control を持つ。
Control(OS).apply_enabled='0' のとき、そのOSの状態遷移（apply）は発生しない。

## I6: 監査二重化（Double Audit）
SUGGESTION と EXECUTION は別ログとして残る。
片方のログのみで真実確定しない（相関は event_id/request_id で行う）。

## I7: 冪等（Idempotency）
同一 event_id の apply は “高々一度” 成功確定される。
重複は 409/duplicate で終了し、状態を二重に増幅しない。

---

# 5. 遷移系（State Machines）
## 5.1 Ingest（Integration入口）
前提：Control(Integration).ingest_enabled='1' かつ os_enabled='1'

Transition Ingest(E_raw):
1) VerifySignature(E_raw) -> E_verified
2) if not verified: ExtIngest.add(E with ingest_status='REJECTED') + Audit('rejected'); stop
3) else: ExtIngest.add(E with ingest_status='ACCEPTED') + Audit('accepted')
4) Route(E_verified) -> target world outbox に enqueue

安全性：I2, I3, I4, I6

## 5.2 Dispatch（Outbox→処理）
前提：Control(source_os).dispatch_enabled='1' かつ os_enabled='1'

Transition Dispatch(row):
1) if row.dispatch_status in {DONE, DEAD}: no-op
2) Claim(row): PENDING/RETRY -> INFLIGHT
3) CallApply(target_os, event)
4) on success: MarkDone(row): INFLIGHT -> DONE; Audit('done')
5) on failure: MarkRetry(row): INFLIGHT -> RETRY (or DEAD if attempts>=MAX); Audit('retry/dead')

安全性：I5, I6
ライブネス：L1（後述）

## 5.3 Apply（PersonaCore例：状態適用）
前提：Control(PersonaCore).apply_enabled='1' かつ os_enabled='1'

Transition ApplyPersona(E):
1) IdempotencyCheck(event_id):
   - if processed => duplicate(409), Audit('duplicate'), stop
   - else ensure growth_events row exists (is_processed=false)
2) LoadRule(event_type) only if is_active=true
3) Weighting: axis_deltas' = ApplyWeight(rule.weight, axis_deltas) with clamp
4) EngineApply(...)
5) MarkProcessed(event_id): is_processed=true
6) Snapshot(best-effort)
7) Audit('apply_ok') or Audit('apply_fail')

安全性：I1, I5, I7

---

# 6. ライブネス（Liveness Properties）
## L1: Eventually Done or Dead
dispatch_enabled='1' が継続し、外部依存が回復可能であれば、
任意の outbox row は最終的に DONE か DEAD に到達する。

## L2: No INFLIGHT Stuck（運用目標）
INFLIGHT が永続化しないよう、mark_retry が必ず実行される。
（失敗時はフォールバックで直接 update する設計を許可）

---

# 7. 形式的チェック項目（実装検証の観点）
## 7.1 スキーマ検証
- system_control が全OSに存在（I5）
- outbox に event_version と source_os が存在（I4）
- integration.external_event に signature_verified が存在（I3）

## 7.2 ルール検証
- dispatcher が dispatch_enabled を参照（I5）
- apply が apply_enabled を参照（I5）
- apply が冪等（I7）
- Cognitive→Reality 直接更新が存在しない（I1）

---

# 8. 定理（設計上の保証）
## T1（責任逆転回避）
I1 と 5.3 の Apply/5.2 の Dispatch を満たす限り、
Cognitive は Reality の状態を直接書き換えられない。

## T2（境界信頼保証）
I2, I3 を満たす限り、署名なし入力は文明状態へ影響しない。

## T3（互換破壊耐性）
I4 を満たす限り、event_version による共存が可能で、段階移行が可能。

---

# 9. 設計固定宣言
本形式モデルは憲法（11/12/13）を数学化した正本であり、
これに反する実装・拡張は無効とする。
