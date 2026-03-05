# ============================================================
# CIVILIZATION EVENT APPLY ENGINE
# Deterministic Mutation Rules + Versioning + Safety
# ============================================================
status: canonical
scope: civilization.apply.engine
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Purpose
Apply Engine is the only component allowed to mutate world state.

# 1. Inputs / Outputs
Input: VALID event + current world state(t)
Output: new world state(t') + applied marker + optional follow-up events

# 2. Stages
A) Preconditions: gates, claimed-by-runner, event VALID
B) Idempotency: (world_id,event_id) already applied => DONE
C) Compatibility: event_version supported; schema_hash matches canonical
D) Execute mutation: deterministic rules only
E) Persist: write delta + applied marker
F) Emit follow-ups: NEW events for next cycle only

# 3. State constraints
- Stocks are normalized and bounded (0..100)
- If computation produces out-of-range => QUARANTINE (do not clamp silently)
- Derived metrics computed after mutation (GDP_INDEX etc.)

# 4. Versioning
- breaking change => bump major event_version
- schema_hash ties event to canonical schema
- unknown version/hash => QUARANTINE (fail-closed)

