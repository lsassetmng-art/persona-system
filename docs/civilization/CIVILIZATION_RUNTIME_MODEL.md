# ============================================================
# CIVILIZATION RUNTIME MODEL
# Canonical Runtime Flow / Control / Retry / Safety
# ============================================================
status: canonical
scope: civilization.runtime.model
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Purpose
Civilization Runtime is the execution plane that advances worlds safely:
- deterministic tick loop
- event validation + routing + apply
- idempotency + retry + dead-letter
- checkpoint + replay
- control gates (kill switch)
- observability (logs/metrics)

Non-goals: implementation code.

# 1. Entities
World: {world_id, seed, tick, state_vector}
Event: {event_id, type, version, occurred_at, payload, schema_hash, (signature), (causality)}
Runner: runtime worker that claims and applies events per world.

# 2. Control Gates (fail-closed)
Gates (missing => disabled):
- runtime_enabled
- dispatch_enabled
- apply_enabled
- simulation_enabled
- replay_enabled

Gate precedence:
STOP(runtime_enabled=0) overrides everything.

# 3. Runtime Loop (per world)
Step0 Gate check
Step1 Load state(t) from latest checkpoint
Step2 Ingest external events -> NEW
Step3 Generate internal events -> NEW
Step4 Validate/Normalize -> VALID | QUARANTINE | DEAD
Step5 Claim+Route -> CLAIMED (serialize apply per world)
Step6 Apply pipeline -> DONE | RETRY | DEAD | QUARANTINE
Step7 Post-apply accounting (derived metrics)
Step8 Checkpoint policy (default fail-closed on checkpoint failure)
Step9 tick := tick + 1

# 4. Apply guarantees
- single-writer per world (apply serialization)
- idempotent by (world_id, event_id)
- no recursion inline; follow-ups are NEW for next cycle

# 5. Replay guarantees
- replay from checkpoint + ordered events
- deterministic digest verification
- mismatch => QUARANTINE segment + stop

# 6. Observability
Structured JSON logs: run_id/world_id/tick/stage/event_id/status/latency
Metrics: throughput, retry rate, dead rate, quarantine rate, checkpoint success.

