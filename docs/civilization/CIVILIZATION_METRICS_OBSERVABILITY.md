# ============================================================
# CIVILIZATION METRICS & OBSERVABILITY
# Logs, Metrics, Dashboards, SLO/SLA
# ============================================================
status: canonical
scope: civilization.metrics.observability
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Objectives
- detect failure early (fail-closed)
- support audit/replay/debug
- quantify health (SLOs)

# 1. Required logs (structured JSON)
Fields:
- run_id, world_id, tick, stage, latency_ms
- event_id, root_event_id, cause_event_id, causality_depth
- event_type, event_version, schema_hash
- status_transition
- error_code (when any)
- loop_guard_decision

# 2. Core metrics
- events_in (per tick)
- events_valid / quarantine / dead
- dispatch_latency_ms p50/p95/p99
- apply_latency_ms p50/p95/p99
- retry_rate, dead_rate, quarantine_rate
- checkpoint_success_rate
- replay_mismatch_count
- loop_guard_dedup_hits, loop_guard_depth_exceeded

# 3. Dashboards
- World Health (per world)
- Dispatcher Health
- Apply Engine Health
- Checkpoint/Replay Integrity
- Event Safety (dedupe/quarantine/dead)

# 4. SLO examples
- p95 dispatch latency < 2s
- checkpoint success > 99.9%
- replay mismatch = 0

