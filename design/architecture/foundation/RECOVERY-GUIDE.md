# ============================================================
# Civilization OS
# Recovery Guide
# ============================================================

## 1. Dispatcher Crash Recovery

- Restart dispatcher
- Ensure no events stuck in IN_PROGRESS
- Verify retry queue

------------------------------------------------------------
## 2. Retry Storm Control

If dispatch_attempts increasing rapidly:

1) Disable world dispatch_enabled
2) Investigate apply endpoint
3) Fix issue
4) Re-enable world

------------------------------------------------------------
## 3. MAX_RETRY Flood

If many events reach DEAD:

- Inspect last_dispatch_error
- Confirm signature validity
- Confirm apply endpoint health
- Decide manual replay or discard

------------------------------------------------------------
## 4. Database Lock Issue

If claim_rpc stalls:

- Check pg_locks
- Verify transaction isolation
- Restart dispatcher if necessary

------------------------------------------------------------
## 5. Emergency Halt

To stop all processing:

UPDATE civilization.system_control
SET control_value='0'
WHERE control_key='dispatch_enabled';

------------------------------------------------------------
# END
------------------------------------------------------------
