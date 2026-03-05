# ============================================================
# CIVILIZATION RUNTIME STATE MACHINE
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Runtime の状態遷移を固定し、運用事故（多重起動・半停止・無限ループ）を防ぐ。

------------------------------------------------------------
STATES
------------------------------------------------------------

BOOT
READY
RUNNING
DRAINING
STOPPED
SAFE_STOP (error terminal)

------------------------------------------------------------
TRANSITIONS
------------------------------------------------------------

BOOT -> READY
  - config loaded
  - gates evaluated
  - worlds discovered
  - scheduler initialized

READY -> RUNNING
  - scheduler trigger OR manual start
  - lock acquisition ok

RUNNING -> DRAINING
  - operator stop
  - deploy restart
  - safety threshold exceeded (optional policy)

DRAINING -> STOPPED
  - stop new claims
  - finish in-flight apply (bounded)
  - flush checkpoints
  - release locks

ANY -> SAFE_STOP
  - replay mismatch
  - integrity violation (schema/signature policy breach)
  - persistent checkpoint failure
  - loop-guard breach beyond threshold
  - unknown critical exception

SAFE_STOP -> READY
  - only by operator/admin explicit resume
  - requires incident note + approval record (policy)

------------------------------------------------------------
RUNTIME LOOP GUARDS
------------------------------------------------------------

1) Budget Guard
- MAX_EVENTS_PER_RUN
- MAX_TICKS_PER_RUN
- MAX_WORLDS_PER_RUN

2) Loop Guard
- chain depth limit
- duplicate detection (event_id / causality_id)
- repeated retry with same error => QUARANTINE

3) Integrity Guard
- signature verify before apply
- schema_hash required
- event_version allowlist

------------------------------------------------------------
STATE MACHINE DIAGRAM (TEXT)
------------------------------------------------------------

BOOT --> READY --> RUNNING --> DRAINING --> STOPPED
  \                 |
   \                v
    +------------> SAFE_STOP

------------------------------------------------------------
OPERATOR ACTIONS
------------------------------------------------------------

- pause runtime: set runtime_enabled=0 => RUNNING->DRAINING->STOPPED
- resume runtime: runtime_enabled=1 + approval => STOPPED->READY->RUNNING
- quarantine review: approve / reject event chain (never silent)

------------------------------------------------------------
END
------------------------------------------------------------
