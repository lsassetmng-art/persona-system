# ============================================================
# CIVILIZATION TIME MODEL
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Goal:
文明シミュレーションの時間概念を固定する（再現性・監査・リプレイのため）。

------------------------------------------------------------
1. TIME UNIT
------------------------------------------------------------
Primary unit: DAY

- 1 tick = 1 day
- all simulation engines MUST be deterministic per (world_id, day_index, seed)

Secondary units (derived):
- week_index = floor(day_index / 7)
- month_index = floor(day_index / 30)  (abstract calendar)
- year_index = floor(day_index / 365)

Note:
現実暦（西暦等）への変換は「表示層」の責務。
内部は抽象 day_index を唯一の正とする。

------------------------------------------------------------
2. TICK SOURCES
------------------------------------------------------------
Tick is triggered by runtime scheduler.

- scheduled tick: cron
- manual tick: admin operation (gated)

Tick MUST be idempotent:
- if day_index already processed => no-op OR return conflict

------------------------------------------------------------
3. ORDER OF EXECUTION (PER DAY)
------------------------------------------------------------
(1) population update
(2) economy update
(3) diplomacy/trade update
(4) war escalation/resolution
(5) disaster events
(6) crime/politics events
(7) generate WORLD_EVENT batch
(8) dispatch/apply/checkpoint

------------------------------------------------------------
4. DETERMINISM CONTRACT
------------------------------------------------------------
Given:
- world_id
- day_index
- seed_version
- base_seed

All outputs MUST be deterministic.

Randomness rule:
rng = HMAC(base_seed, world_id || day_index || subsystem_key)

------------------------------------------------------------
5. CHECKPOINTING
------------------------------------------------------------
Checkpoint granularity:
- daily checkpoint is canonical
- optional weekly checkpoint for faster recovery

Replay correctness:
- replay(day_index N) must reproduce identical derived state hashes
- mismatch => SEV1 integrity event => SAFE_STOP

------------------------------------------------------------
END
------------------------------------------------------------
