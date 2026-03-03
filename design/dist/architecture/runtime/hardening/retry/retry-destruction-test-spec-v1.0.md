# ============================================================
# Civilization OS
# Retry Destruction Test Specification v1.0
# Phase: Foundation Hardening
# ============================================================

Status: ACTIVE
Owner: Boss
Layer: Runtime
Priority: P1

------------------------------------------------------------
## 0. Purpose

Validate that retry mechanism is:
- Deterministic
- Bounded
- Fail-closed
- Crash-safe

No data corruption permitted.

------------------------------------------------------------
## 1. Scope

This document validates:

- apply failure behavior
- mark_retry failure behavior
- fallback update path
- MAX_RETRY enforcement
- DEAD transition correctness
- next_retry_at progression
- restart recovery safety

------------------------------------------------------------
## 2. Test Matrix Alignment

Reference:
- HARDENING-PLAN.md
- FAILURE-MATRIX.md

------------------------------------------------------------
## 3. R1 — Apply 500 Forced Failure

Method:
- Force apply RPC to RAISE EXCEPTION

Expected:
- dispatch_attempts increments
- next_retry_at updated
- last_dispatch_error recorded
- No infinite retry
- DEAD after MAX_RETRY

------------------------------------------------------------
## 4. R2 — Apply Timeout

Method:
- Artificial sleep > dispatcher timeout

Expected:
- RETRY
- attempts increment
- next_retry_at updated

------------------------------------------------------------
## 5. R3 — mark_retry RPC Failure

Method:
- Force mark_retry to fail

Expected:
- Fallback update executed
- attempts increment
- No silent failure
- DEAD after MAX_RETRY

------------------------------------------------------------
## 6. R4 — MAX_RETRY Enforcement

Expected:
- attempts == MAX_RETRY
- dispatch_status → DEAD
- DEAD is terminal
- No resurrection

------------------------------------------------------------
## 7. R5 — next_retry_at Validation

Expected:
- Always > now()
- Backoff progression correct
- Not skipped
- Not past-due immediately

------------------------------------------------------------
## 8. Restart Recovery

Simulate:
- Kill dispatcher mid-batch

Expected:
- Safe resume
- No duplicate apply
- No event loss

------------------------------------------------------------
## 9. Success Criteria

✔ No infinite loop  
✔ No manual DB repair  
✔ Logs fully traceable  
✔ DEAD is terminal  
✔ Retry bounded  

------------------------------------------------------------
END
------------------------------------------------------------
