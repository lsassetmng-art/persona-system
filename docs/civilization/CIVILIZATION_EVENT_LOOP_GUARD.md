# ============================================================
# CIVILIZATION EVENT LOOP GUARD
# Causality / Depth / Dedupe / Cascade Prevention
# ============================================================
status: canonical
scope: civilization.event.loop.guard
owner: Boss
prepared_by: Zero
version: 1.0

# ============================================================
# 0. PURPOSE
# ============================================================

Civilization is an event-driven system (ERP ↔ Civilization ↔ Persona ↔ World).
The primary systemic risk is an "event cascade loop" that amplifies traffic:
event -> event -> event ... causing outbox explosion and runtime instability.

This document defines canonical prevention rules:
- causality identifiers
- depth limits
- deduplication rules
- loop classification and hard stops (fail-closed)

Non-goals:
- implementation details (handled in implementation phase)
- business policy decisions beyond safety constraints

# ============================================================
# 1. REQUIRED CAUSALITY FIELDS
# ============================================================

Every event MUST carry the following causality metadata:

- root_event_id   : uuid
  The original event that started the chain.

- cause_event_id  : uuid
  The direct parent event that emitted this event.

- causality_depth : integer (0..N)
  Depth from root (root is 0).

Rules:
- NEW external events set:
  root_event_id = event_id
  cause_event_id = NULL
  causality_depth = 0

- Derived events set:
  root_event_id = parent's root_event_id
  cause_event_id = parent's event_id
  causality_depth = parent.causality_depth + 1

If any of these are missing/invalid => QUARANTINE (fail-closed).

# ============================================================
# 2. DEPTH LIMIT (HARD STOP)
# ============================================================

MAX_CAUSALITY_DEPTH = 10 (canonical default)

Rule:
- If causality_depth > MAX_CAUSALITY_DEPTH:
  => DEAD (no retry)
  => record reason: "loop_guard:depth_exceeded"

Rationale:
- A valid chain should not require deep recursion.
- Deep recursion is indistinguishable from runaway cascades in production.

# ============================================================
# 3. DEDUPLICATION (ROOT-SCOPED)
# ============================================================

Within one root chain (same root_event_id), the runtime MUST prevent
repeated emission of the same logical effect.

Canonical dedupe key:
- (world_id, root_event_id, event_type, schema_hash, stable_payload_digest)

stable_payload_digest:
- canonical-json serialization (sorted keys)
- hashed (sha256)

Rule:
- If an event with the same dedupe key already exists in applied log:
  => treat new attempt as DONE (no mutation)
  => record reason: "loop_guard:dedup_hit"

# ============================================================
# 4. LOOP CLASSIFICATION
# ============================================================

Loop types (recognized):

L1: Mirror Loop
- A emits B, B emits A with equivalent payloads.

L2: Amplification Loop
- A emits B, B emits A with expanding payload cardinality.

L3: Tick-Feedback Loop
- Tick generates event that changes tick generator thresholds repeatedly.

L4: Cross-Domain Feedback
- ERP -> Persona -> World -> ERP (or any circular domain route)

Policy:
- L1/L2 => DEAD immediately (no retry)
- L3 => QUARANTINE (requires review), unless explicit allowlist exists
- L4 => QUARANTINE by default, allowlist required

# ============================================================
# 5. ALLOWLIST (EXPLICIT EXCEPTIONS)
# ============================================================

Some chains are legitimate and must be explicitly allowed.

Allowlist format (conceptual):
- (root_event_type, allowed_child_event_type, max_depth_override)

Rules:
- Allowlist is evaluated BEFORE dead/quarantine for depth, but:
  - still bounded
  - still deduped

No allowlist entry => default rules apply.

# ============================================================
# 6. FAIL-CLOSED DEFAULTS
# ============================================================

Unknowns are dangerous in event-driven systems.
Therefore:

- unknown schema_hash or event_version => QUARANTINE
- missing causality fields => QUARANTINE
- repeated dedupe key => DONE (idempotent)
- depth exceeded => DEAD

# ============================================================
# 7. OBSERVABILITY REQUIREMENTS
# ============================================================

Every event processing log MUST include:
- event_id
- root_event_id
- cause_event_id
- causality_depth
- dedupe_key_digest
- loop_guard_decision (PASS / DONE / QUARANTINE / DEAD)
- loop_guard_reason

Metrics:
- loop_guard_dedup_hits
- loop_guard_depth_exceeded
- loop_guard_quarantine
- loop_guard_dead

# ============================================================
# 8. ACCEPTANCE CRITERIA (DESIGN)
# ============================================================

This guard is valid when:
- every event has causality fields
- depth hard stop exists
- root-scoped dedupe prevents re-emission
- unknowns fail-closed into quarantine
- logs/metrics enable auditing and debugging

# ============================================================
# END
# ============================================================
