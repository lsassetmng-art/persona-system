# ============================================================
# Civilization OS
# Foundation Hardening Plan
# Status: ACTIVE
# ============================================================

## Objective

Stabilize Execution Core before expansion.

No new features allowed during this phase.

------------------------------------------------------------
# 1. Retry Stability Tests (Priority 1)

Tests:

[ ] apply returns 500
[ ] apply timeout
[ ] mark_retry RPC failure
[ ] fallback update path
[ ] MAX_RETRY reached
[ ] next_retry_at progression correct
[ ] DEAD transition correct

Success Criteria:
- No infinite loop
- Attempts increment correctly
- DEAD after MAX_RETRY
- Logs traceable

------------------------------------------------------------
# 2. Claim Stability Tests (Priority 2)

Tests:

[ ] Dual dispatcher execution
[ ] 50+ event batch
[ ] Verify no double claim
[ ] Lock behavior correct

Success Criteria:
- No duplicate processing
- No lost events

------------------------------------------------------------
# 3. Apply Boundary Tests (Priority 3)

Tests:

[ ] 409 idempotent success
[ ] Invalid internal token
[ ] Network failure
[ ] Schema mismatch

Success Criteria:
- Correct retry or DEAD behavior
- No silent failure

------------------------------------------------------------
# 4. Kill-Switch Tests (Priority 4)

Tests:

[ ] global os_enabled=0
[ ] world dispatch_enabled=0
[ ] mid-run disable

Success Criteria:
- Clean halt
- No corruption
- No partial state

------------------------------------------------------------
# Completion Definition

Hardening Phase Complete When:

- All above tests pass
- No unexpected log states
- No manual DB repair needed
- System recovers cleanly after restart

------------------------------------------------------------
# END
------------------------------------------------------------
