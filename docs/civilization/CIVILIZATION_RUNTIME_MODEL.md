# ============================================================
# CIVILIZATION RUNTIME MODEL
# Canonical Runtime Flow / Control / Retry / Safety
# ============================================================
status: canonical
scope: civilization.runtime.model
owner: Boss
prepared_by: Zero
version: 1.0
compat:
  depends_on:
    - CIVILIZATION_EVENT_SYSTEM.md
    - CIVILIZATION_SIMULATION_ENGINE.md
    - CIVILIZATION_CORE_SIMULATION_RULES.md
    - CIVILIZATION_CHECKPOINT_AND_REPLAY.md
    - CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md
    - CIVILIZATION_WORLD_INITIAL_STATE.md
    - CIVILIZATION_WORLD_GENERATION_ENGINE.md
    - CIVILIZATION_AI_GOVERNANCE.md
    - CIVILIZATION_ADMIN_CONTROL.md
    - TRIPLE_WORLD_ISOLATION_POLICY.md

# ============================================================
# 0. PURPOSE
# ============================================================

Civilization Runtime is the "execution plane" that advances the world safely.
It defines:
- Runtime loop (tick)
- Event routing and application
- Deterministic replay
- Failure behavior (fail-closed)
- Administrative kill-switch and control gates
- Concurrency model and idempotency

Design goals:
- deterministic: same seed + same inputs => same outputs
- safe: uncertain states stop rather than corrupt
- observable: structured logs, checkpoints, replay
- scalable: worlds can run independently (multiverse)

Non-goals:
- implementation code (handled in implementation phase)
- ERP integration details beyond interface event acceptance

# ============================================================
# 1. RUNTIME ENTITIES
# ============================================================

World:
- world_id
- seed
- tick (monotonic integer)
- state_vector (stocks 0..100 + derived metrics)

Runtime Components (logical):
- TickScheduler
- EventInbox
- EventRouter
- Validator
- ApplyPipeline
- RetryController
- CheckpointWriter
- ReplayEngine
- ControlGate (admin/system_control)
- Observability (logs/metrics)

# ============================================================
# 2. CONTROL GATES (FAIL-CLOSED)
# ============================================================

Runtime MUST check gates before processing.

Gates:
- runtime_enabled (global)
- dispatch_enabled (event dispatch)
- apply_enabled (state mutation)
- simulation_enabled (tick evolution)
- replay_enabled (replay execution)

Source of truth:
- CIVILIZATION_ADMIN_CONTROL.md

Rule:
- Any missing/unknown gate value => treated as DISABLED.
- Disabled gate => stop processing (no partial apply).

# ============================================================
# 3. EVENT LIFECYCLE (STATE MACHINE)
# ============================================================

Event statuses (canonical):
- NEW        : received or generated, not validated
- VALID      : validated and ready to route
- CLAIMED    : assigned to a runner (prevents duplicates)
- APPLYING   : in apply pipeline
- DONE       : successfully applied (idempotent)
- RETRY      : failed with retryable condition
- DEAD       : failed with non-retryable condition
- QUARANTINE : suspicious/unknown schema; requires admin review

Rule:
- UNKNOWN failure modes => QUARANTINE (not retry).

Retry policy (high-level):
- bounded attempts
- exponential/backoff table
- DEAD on invalid_signature / schema mismatch / compromised key

This model must match:
- FAILURE-MATRIX.md (ops layer)
- event taxonomy in CIVILIZATION_EVENT_SYSTEM.md

# ============================================================
# 4. RUNTIME LOOP (TICK)
# ============================================================

Tick loop is a deterministic sequence.

Per world_id:
Step 0) Gate Check
- runtime_enabled && simulation_enabled must be true

Step 1) Load World State (t)
- state vector
- last checkpoint reference

Step 2) Ingest External Events (optional)
- WORLD_EVENT, DOMAIN_EVENT, INTERFACE_EVENT
- place into EventInbox with status NEW

Step 3) Generate Internal Events (simulation)
- exogenous generator (rare)
- endogenous detector (threshold-based)
- diplomacy dynamics
- economy dynamics
- war dynamics
All generated events are NEW.

Step 4) Validate + Normalize
- schema validity
- version compatibility
- schema_hash deterministic
- signature checks (when required by event type)
- payload constraints
- sanitize fields (no implicit defaults)
Result:
- VALID or QUARANTINE or DEAD

Step 5) Claim + Route
- claim event (CLAIMED) with runner_id
- route by event_type -> target subsystem:
  - economy
  - war
  - diplomacy
  - population
  - culture/religion
  - admin/control
  - checkpoint/replay markers

Step 6) Apply Pipeline
- apply_enabled must be true
- apply must be idempotent:
  - (world_id, event_id) unique
  - duplicate => DONE (no mutation)
- apply executes deterministic mutation rules only
Result:
- DONE / RETRY / DEAD / QUARANTINE

Step 7) Post-Apply Accounting
- update derived metrics (GDP_INDEX, etc.)
- update relations matrix caches if needed
- write structured log summary

Step 8) Checkpoint (best-effort or required per policy)
- if checkpoint_enabled: write checkpoint at tick t
- if checkpoint write fails:
  - policy decides: (A) fail-closed stop, or (B) continue but mark degraded
Default: fail-closed for canonical mode.

Step 9) Advance Tick
- tick := tick + 1

# ============================================================
# 5. APPLY PIPELINE (DETERMINISTIC + IDEMPOTENT)
# ============================================================

Apply Pipeline stages:
A) Pre-conditions
- gate checks
- event in VALID status
- event claimed by current runner

B) Idempotency Check
- if applied record exists => DONE

C) Execute Mutation
- mutation rules defined in CIVILIZATION_CORE_SIMULATION_RULES.md
- no out-of-range values allowed:
  - all stocks clamp forbidden; must compute within constraints
  - if computed out-of-range => fail => QUARANTINE

D) Write Apply Record
- write applied marker (world_id, event_id)
- write world_state delta record

E) Emit Follow-up Events (optional)
- e.g., WAR_DECLARE emits SANCTION_TRIGGER
- follow-ups are NEW (next cycle), not inline recursion

# ============================================================
# 6. VALIDATION PIPELINE (SECURITY + COMPAT)
# ============================================================

Validation rules (canonical):
- required fields exist
- event_version is supported by compatibility table
- schema_hash matches canonical schema for (event_type, event_version)
- signature required if:
  - INTERFACE_EVENT
  - admin control events
  - any event that alters gates or cross-layer boundaries

Signature verification:
- use CIVILIZATION security policy
- invalid_signature => DEAD (no retry)

Unknown schema_hash / unknown event_version:
- QUARANTINE (admin review), not retry

# ============================================================
# 7. CONCURRENCY MODEL
# ============================================================

World-level isolation:
- Each world_id processes ticks independently.

Within a world:
- Apply is single-writer by default.
- Multiple runners may VALIDATE in parallel,
  but CLAIM + APPLY must serialize per world.

Claim mechanism:
- atomic claim ensures at-most-once apply attempt at a time

Rationale:
- keep deterministic ordering
- avoid race conditions in state mutation

# ============================================================
# 8. CHECKPOINT & REPLAY
# ============================================================

Checkpoint:
- a snapshot of world state at tick t
- must include:
  - world_id, seed, tick
  - full state_vector
  - applied_event cursor (or hash)
  - relations matrix digest

Replay:
- reconstruct world state from checkpoint
- re-apply events deterministically
- used for:
  - audits
  - debugging
  - multiverse branching

Rules:
- Replay must be deterministic and produce same digests.
- Any mismatch => fail-closed and quarantine the divergent segment.

# ============================================================
# 9. OBSERVABILITY
# ============================================================

Logs are structured JSON (recommendation):
- run_id
- world_id
- tick
- stage
- event_id
- event_type
- status_transition
- latency_ms
- summary counters

Metrics:
- events_processed per tick
- retry_rate
- dead_rate
- quarantine_rate
- checkpoint_success_rate

# ============================================================
# 10. FAILURE BEHAVIOR (CANONICAL)
# ============================================================

Canonical rules:
- validation uncertainty => QUARANTINE
- apply failure (retryable) => RETRY with backoff
- apply failure (non-retryable) => DEAD
- checkpoint failure => STOP (fail-closed) unless explicitly configured

Failure classification is governed by:
- FAILURE-MATRIX.md
- RECOVERY-GUIDE.md
- HARDENING-PLAN.md

# ============================================================
# 11. TRIPLE INTERACTION CONSTRAINTS
# ============================================================

TRIPLE constraints:
- Triple is an indirect ruler (no direct mutation without events)
- Any "admin override" must be signed and gated
- Observation tasks are separate from mutation tasks

World isolation:
- cross-world interference is forbidden unless explicitly enabled
  by multiverse bridge events.

Policy source:
- TRIPLE_WORLD_ISOLATION_POLICY.md

# ============================================================
# 12. ACCEPTANCE CRITERIA (DESIGN)
# ============================================================

Runtime model is considered valid when:
- tick loop is fully deterministic
- idempotency is guaranteed
- fail-closed behavior is defined for unknowns
- replay is possible and verifiable
- control gates can stop the system immediately

# ============================================================
# END
# ============================================================
