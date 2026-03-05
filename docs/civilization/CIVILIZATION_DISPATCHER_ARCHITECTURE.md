# ============================================================
# CIVILIZATION DISPATCHER ARCHITECTURE
# Claim / Route / Retry / Dead-letter / Concurrency
# ============================================================
status: canonical
scope: civilization.dispatcher.architecture
owner: Boss
prepared_by: Zero
version: 1.0

# 0. Role
Dispatcher moves events from inbox/outbox into the apply pipeline safely.

# 1. Responsibilities
- claim events atomically
- validate prerequisites (schema/version/signature when required)
- route to correct subsystem (economy/war/diplomacy/population/admin)
- execute retry strategy for transient failures
- mark DEAD for permanent failures
- emit structured logs and counters

# 2. Claim Strategy
Claim key: (world_id, event_id)
Rules:
- only one runner may hold a claim at a time
- claim has a lease/timeout to recover from worker crash
- re-claim allowed only after lease expiry

# 3. Concurrency Model
- parallelism across worlds allowed
- within a world, apply is serialized (single-writer)
- validation may be parallel, but apply must not race

# 4. Retry Model
- bounded attempts (MAX_RETRY default 5)
- exponential backoff table
- retryable examples: network timeouts, transient DB errors
- non-retryable examples: invalid signature, unknown schema_hash, missing required fields

# 5. Dead Letter / Quarantine
DEAD: permanently invalid, never retried
QUARANTINE: suspicious/unknown; requires admin review
Unknown failure => QUARANTINE (fail-closed)

# 6. Idempotency
If applied marker exists:
- treat as DONE (no mutation)
- do not re-emit follow-ups

