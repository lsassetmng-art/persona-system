# ============================================================
# Civilization OS
# Failure Matrix
# ============================================================

| Failure Type                 | Expected Behavior | Retry | DEAD | Notes |
|-----------------------------|------------------|-------|------|-------|
| invalid_fields              | DEAD             | No    | Yes  | Immediate |
| unknown_or_invalid_key      | DEAD             | No    | Yes  | Verify failure |
| invalid_signature           | DEAD             | No    | Yes  | Verify failure |
| apply_500                   | RETRY            | Yes   | After MAX | Backoff |
| apply_timeout               | RETRY            | Yes   | After MAX | Network |
| mark_retry_fail             | Fallback update  | Yes   | After MAX | Must not loop |
| duplicate_event (409)       | SUCCESS          | No    | No   | Idempotent |
| internal_token_invalid      | RETRY or DEAD*   | TBD   | TBD  | Decision needed |
| dispatcher_crash_mid_batch  | Resume safe      | Yes   | No   | No data loss |

* To be finalized during hardening.

------------------------------------------------------------
# Rules

- DEAD must be terminal
- RETRY must increment attempt
- MAX_RETRY must transition to DEAD
- No silent failure allowed

------------------------------------------------------------
# END
------------------------------------------------------------
