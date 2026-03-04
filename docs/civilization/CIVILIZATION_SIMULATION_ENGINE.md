# Civilization Simulation Engine
status: canonical
scope: civilization.simulation
owner: Boss
prepared_by: Zero

## 1. Purpose
The Simulation Engine advances the world state in discrete ticks and ensures:
- determinism (same inputs => same outputs)
- auditability (every tick produces a signed/traceable record)
- safety (fail-closed on rule violations)
- idempotency (replaying a tick does not duplicate effects)

## 2. Core Principles
- PersonaOS holds persona state; Civilization systems produce facts/events.
- All state transitions happen via events and reducers.
- No cross-schema direct updates (conceptual rule).
- Additive change over destructive deletion.

## 3. Time Model
- World Time Unit: TICK (default: 1 day)
- Sub-ticks allowed: ECON_TICK, DIPLO_TICK, WAR_TICK (derived, never independent clocks)
- All events must contain: occurred_at (world time), created_at (system time), event_id (uuid)

## 4. Engine Pipeline (per Tick)
1) Collect Inputs
   - pending events (queued)
   - scheduled events (time-based triggers)
   - exogenous events (admin injection; rare; requires approval)
2) Validate Inputs
   - schema validation
   - signature validation (if used)
   - rule gate check (freeze/disable gates)
3) Resolve Order
   - stable sort: (occurred_at, priority, event_type, event_id)
4) Apply Reducers
   - reducer per domain: economy, diplomacy, war, society, resource, tech
5) Emit Outputs
   - derived events
   - snapshots (public facts only)
   - metrics
6) Commit (atomic)
   - apply_run_log + tick_summary
   - outbox for downstream systems

## 5. Determinism
- Randomness uses a deterministic RNG seeded by (world_seed + tick + shard_key).
- RNG outputs must be recorded in tick log (or record seed + draws count).

## 6. Idempotency
- Each tick has a tick_id.
- Reducers must be idempotent: (tick_id, reducer_name) unique.
- Event application records (tick_id, event_id) unique.

## 7. Safety Gates
- global: simulation_enabled
- per-civilization: civ_enabled
- per-domain: economy_enabled, war_enabled, diplomacy_enabled, etc.
- fail-closed: if gate unclear => stop tick and log reason.

## 8. Conflict Resolution
- If two events produce contradictory claims:
  - prefer higher priority domain rules
  - or merge using explicit reconciliation reducer
  - always record the conflict + decision path

## 9. Output Contracts
- World Facts: public, immutable once emitted (only superseded by newer facts)
- Snapshots: signed (optional), verifiable offline (optional)
- Audit logs: always persisted, never blocks tick commit (best-effort signing allowed)

## 10. Recovery & Replay
- Re-run ticks from last good checkpoint:
  - load checkpoint snapshot
  - reapply events up to target tick
- If mismatch detected: create divergence report and require admin decision.
