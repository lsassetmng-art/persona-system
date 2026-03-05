# ============================================================
# CIVILIZATION EVENT DEDUPLICATION POLICY
# Root-scoped dedupe key and idempotency
# ============================================================
status: canonical
scope: civilization.event.deduplication
owner: Boss
prepared_by: Zero
version: 1.0

Goal:
Prevent cascades and duplicate effects without losing auditability.

Canonical dedupe key:
(world_id, root_event_id, event_type, schema_hash, stable_payload_digest)

stable_payload_digest:
- canonical JSON (sorted keys)
- sha256 hash

Rules:
- If applied record exists for (world_id,event_id) => DONE
- If dedupe key already applied in same root chain => DONE (no mutation)
- Dedupe hit MUST be logged (loop_guard_dedup_hits++)

