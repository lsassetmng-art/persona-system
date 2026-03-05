# ============================================================
# CIVILIZATION MONITORING MODEL
# ============================================================
status: canonical
scope: civilization.operations.monitoring
owner: Boss
prepared_by: Zero
version: 1.0

## 0. What to Monitor
- event throughput and queue depth
- retry/dead/quarantine counts
- checkpoint success/failure
- replay integrity checks
- loop guard triggers (dedupe/depth exceeded)

## 1. Alerts (examples)
- queue depth > threshold for > N minutes => SEV2
- checkpoint failure burst => SEV1
- replay mismatch => SEV1
- quarantine spike => SEV2

## 2. Logs
structured JSON required across dispatcher/apply/tick.
