# Civilization Event System
status: canonical
scope: civilization.event_system
owner: Boss
prepared_by: Zero

## Purpose
Defines how events are created, validated, ordered, applied, and audited.

## Event Lifecycle
1) Create (system/admin)
2) Validate (schema + policy + gates)
3) Queue (pending)
4) Claim for tick (deterministic ordering)
5) Apply via reducer (idempotent)
6) Record application (tick_id, event_id)
7) Emit derived events + metrics + summaries

## Ordering
Stable sort key:
(occurred_at, priority, event_type, event_id)

## Policy / Safety
- Violence-related content is abstract categorical outcomes only.
- No real-world operational guidance is stored in event payloads.

## Compatibility
- event_version for each event_type
- reducers must handle backward-compatible payloads

## Audit
- Every tick produces:
  - apply_run_log
  - tick_summary
  - conflict_report (optional)
