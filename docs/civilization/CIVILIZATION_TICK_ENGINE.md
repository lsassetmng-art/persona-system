# ============================================================
# CIVILIZATION TICK ENGINE
# ============================================================
status: canonical
scope: civilization.simulation.tick.engine
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
World を「日次tick」で確実に進める実行設計。
- wall-clock依存を排除し、tick単位で決定論を維持
- catch-up（遅延回復）と replay の土台
- tickごとに安全なイベント生成 → dispatcher → apply を回す

## 1. Tick Contract
tick は world_id ごとに単調増加。
- world_tick: int64 (>=0)
- tick_unit: "day"（canonical）
- tick_time is logical. wall-clockは起動トリガにのみ使用。

## 2. Run Loop
1) Gate check (runtime/simulation enabled)
2) Load latest checkpoint
3) Determine target_tick:
   - target = max(current_tick, schedule_tick)
4) For t in (current_tick+1 .. target):
   - emit TickEvent(world_id,t)
   - generate internal events (cadence)
   - dispatch/apply until queue drains (bounded)
   - checkpoint policy evaluation
5) persist updated tick

## 3. Cadence
- economy_tick: every 7 days
- diplomacy_tick: every 14 days
- war_tick: daily when active else weekly
- persona_impact_tick: daily (rate-limited by plan)

## 4. Safety
- bounded work per tick (MAX_EVENTS_PER_TICK)
- loop guard required (root/cause/depth + dedupe)
- any unknown/invalid => QUARANTINE fail-closed
