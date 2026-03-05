# ============================================================
# CIVILIZATION INCIDENT RESPONSE
# ============================================================
status: canonical
scope: civilization.operations.incident.response
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Principles
- fail-closed
- preserve evidence (logs, checkpoints)
- prefer pause over corruption

## 1. Playbook
SEV1:
1) set runtime_enabled=0 (stop)
2) snapshot current queues + checkpoints
3) identify root_event_id chains
4) fix cause (config/schema/key) then replay

SEV2:
1) throttle scheduler
2) inspect backlog by world
3) quarantine suspicious chains
4) scale workers (if applicable)

## 2. Postmortem
- timeline, impact, root cause, prevention
- update failure-matrix and hardening plan references
