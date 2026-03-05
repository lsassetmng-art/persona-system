# ============================================================
# CIVILIZATION EVENT LIFECYCLE
# Canonical Status Machine and Transitions
# ============================================================
status: canonical
scope: civilization.event.lifecycle
owner: Boss
prepared_by: Zero
version: 1.0

Statuses:
- NEW
- VALID
- CLAIMED
- APPLYING
- DONE
- RETRY
- DEAD
- QUARANTINE

Allowed transitions:
NEW -> VALID | DEAD | QUARANTINE
VALID -> CLAIMED
CLAIMED -> APPLYING
APPLYING -> DONE | RETRY | DEAD | QUARANTINE
RETRY -> CLAIMED (after backoff) | DEAD (max attempts)
QUARANTINE -> (admin action) VALID | DEAD

Rules:
- unknown errors => QUARANTINE (fail-closed)
- invalid_signature => DEAD
- duplicate applied marker => DONE

