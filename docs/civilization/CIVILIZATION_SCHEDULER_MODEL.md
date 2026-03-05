# ============================================================
# CIVILIZATION SCHEDULER MODEL
# ============================================================
status: canonical
scope: civilization.runtime.scheduler.model
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
wall-clock から「どのworldをいつtickするか」を決める。
決定論は tick_engine 側で担保し、scheduler は起動トリガのみ。

## 1. Schedule Policy
- default: every N minutes (cron)
- each run computes target_tick by (now - last_run) but only as "how far to catch-up"
- never embeds wall-clock into simulation outputs

## 2. Fairness
- round-robin worlds
- starvation prevention
- per-run budget (max worlds, max ticks)

## 3. Safety
- if backlog huge => QUARANTINE + admin alert
- scheduler disabled if runtime_enabled=0
