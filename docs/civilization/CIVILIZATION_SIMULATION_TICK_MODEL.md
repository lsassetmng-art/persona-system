# ============================================================
# CIVILIZATION SIMULATION TICK MODEL
# Time, Scheduling, and Deterministic Progress
# ============================================================
status: canonical
scope: civilization.simulation.tick.model
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Goal
Define how time advances in simulation without ambiguity.

# 1. Tick Units
Canonical ticks:
- world_tick     : base simulation step
- economy_tick   : economy recalculation cadence
- diplomacy_tick : treaty/relations cadence
- war_tick       : war progression cadence
- persona_tick   : persona-impact cadence (event emission, not mutation)

Default mapping:
- 1 world_tick = 1 day (configurable)

# 2. Scheduling Rules
- ticks must be monotonic per world
- missed ticks are replayed deterministically (catch-up)
- no wall-clock dependence beyond scheduler triggering runs

# 3. Determinism
- seed-scoped RNG only
- stochastic outputs must be reproducible from (seed, tick, stable inputs)

# 4. Cadence examples
- economy_tick every 7 world_ticks
- diplomacy_tick every 14 world_ticks
- war_tick every 1 world_tick during active war else every 7
- persona_tick every 1 world_tick but rate-limited by plan

