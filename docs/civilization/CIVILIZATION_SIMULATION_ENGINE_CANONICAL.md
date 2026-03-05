# ============================================================
# CIVILIZATION SIMULATION ENGINE (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
文明の内部ダイナミクスを event-driven + deterministic に実行する。

------------------------------------------------------------
1. INPUTS
------------------------------------------------------------
- World Initial State (gen)
- External Interface Events (ERP etc.)  ※署名・schema_hash必須
- Admin Gates / Policies

------------------------------------------------------------
2. OUTPUTS
------------------------------------------------------------
- WORLD_EVENT (immutable)
  - economy signals
  - population shifts
  - war / diplomacy changes
  - disaster impacts
  - persona growth hints (abstract)

No direct mutation outside Apply Engine.

------------------------------------------------------------
3. SUBSYSTEMS (REQUIRED)
------------------------------------------------------------
A) Population Engine
B) Economy Engine
C) Diplomacy/Trade Engine
D) War Engine
E) Disaster Engine
F) Politics/Crime Engine
G) Social Dynamics (optional but recommended)

------------------------------------------------------------
4. LOOP (PER DAY)
------------------------------------------------------------
Input: (world_id, day_index)

Step 1: load checkpoint or base state
Step 2: execute subsystems in fixed order
Step 3: produce WORLD_EVENT batch
Step 4: persist events (event store)
Step 5: dispatcher routes -> apply -> checkpoint
Step 6: emit observability metrics

------------------------------------------------------------
5. INVARIANTS
------------------------------------------------------------
- deterministic per (world_id, day_index, seeds)
- bounded compute per tick (budget guard)
- fail-closed validation for external inputs
- replay must match (hash equivalence)

------------------------------------------------------------
6. SAFETY / BUDGET GUARDS
------------------------------------------------------------
- MAX_EVENTS_PER_TICK
- MAX_SUBSYSTEM_ITER
- MAX_WAR_THEATERS_PER_TICK
- MAX_MIGRATION_EDGES_PER_TICK

Exceeded => QUARANTINE event chain + incident note.

------------------------------------------------------------
END
------------------------------------------------------------
