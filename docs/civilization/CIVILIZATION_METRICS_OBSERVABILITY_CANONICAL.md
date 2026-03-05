# ============================================================
# CIVILIZATION METRICS / OBSERVABILITY (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Goal:
Civilization OS の運用可視化と障害切り分けを可能にする。

------------------------------------------------------------
1. METRICS (REQUIRED)
------------------------------------------------------------
Runtime:
- ticks_run_total
- tick_latency_ms_p50/p95
- events_generated_total
- events_dispatched_total
- apply_success_total
- apply_fail_total
- checkpoint_success_total
- checkpoint_fail_total

Queues:
- pending_count
- retry_count
- dead_count
- quarantine_count

Integrity:
- signature_verify_fail_total
- schema_hash_mismatch_total
- replay_mismatch_total (SEV1)

------------------------------------------------------------
2. LOGGING (STRUCTURED JSON)
------------------------------------------------------------
All edge/runtime logs must include:
- run_id
- world_id
- day_index
- stage
- latency_ms
- counts (generated/dispatched/applied)

Do not log secrets/tokens.

------------------------------------------------------------
3. ALERTS (MINIMUM)
------------------------------------------------------------
SEV1:
- replay mismatch
- mass signature failures
- checkpoint failures sustained
- dispatcher stuck (pending grows)

SEV2:
- retry spikes
- latency regression

------------------------------------------------------------
4. DASHBOARDS
------------------------------------------------------------
- Throughput dashboard
- Queue health dashboard
- Integrity dashboard
- Per-world health dashboard

------------------------------------------------------------
END
------------------------------------------------------------
