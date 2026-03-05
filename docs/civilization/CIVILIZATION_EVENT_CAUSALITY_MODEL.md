# ============================================================
# CIVILIZATION EVENT CAUSALITY MODEL
# root_event_id / cause_event_id / depth (required)
# ============================================================
status: canonical
scope: civilization.event.causality
owner: Boss
prepared_by: Zero
version: 1.0

Required fields:
- root_event_id (uuid)
- cause_event_id (uuid|null)
- causality_depth (int)

Rules:
External ingress:
- root_event_id = event_id
- cause_event_id = null
- causality_depth = 0

Derived event:
- root_event_id = parent.root_event_id
- cause_event_id = parent.event_id
- causality_depth = parent.causality_depth + 1

Hard limit:
- MAX_CAUSALITY_DEPTH = 10
- depth exceeded => DEAD (no retry)

Missing/invalid causality fields => QUARANTINE

