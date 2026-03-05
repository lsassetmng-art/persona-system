# ============================================================
# CIVILIZATION DISPATCH COORDINATOR
# ============================================================
status: canonical
scope: civilization.runtime.dispatch.coordinator
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Role
Dispatcher と TickEngine の間を調整し、同時実行事故を防ぐ。

## 1. Responsibilities
- ensure single-writer per world during apply
- coordinate claiming order: VALIDATE -> CLAIM -> APPLY -> MARK
- enforce budgets: max events per world per run

## 2. Ordering Rules
- apply pipeline has priority over generating more events
- never allow recursive inline apply
- follow-up events are queued for next cycle

## 3. Failure Handling
- transient => RETRY with backoff
- unknown => QUARANTINE
- invalid signature / schema => DEAD
