# ============================================================
# CIVILIZATION POPULATION MODEL (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Policy:
人口は「最適に」。
ここでの最適は「文明が持続し、経済が成立し、戦争・貿易が機能する」規模。

------------------------------------------------------------
1. POPULATION VARIABLES
------------------------------------------------------------
- P (total)
- birth_rate
- death_rate
- migration_in/out
- working_ratio
- stability_index (0..1)

------------------------------------------------------------
2. UPDATE (DAILY)
------------------------------------------------------------
P_next = P + births - deaths + net_migration

births = P * birth_rate / 365
deaths = P * death_rate / 365
net_migration = migration_policy + war_refugees + economic_pull

------------------------------------------------------------
3. OPTIMALITY CONSTRAINTS
------------------------------------------------------------
- Each civilization must have enough population to sustain:
  - minimum company count
  - minimum military manpower
  - minimum tax base

- Avoid collapse by:
  - if P < P_min => auto-stabilization policy raises migration_in, reduces death_rate (abstract)
  - if P > P_max => congestion reduces stability and productivity

------------------------------------------------------------
4. WAR / DISASTER IMPACT
------------------------------------------------------------
- war increases deaths and refugee flows
- disasters temporarily decrease stability and productivity

------------------------------------------------------------
5. OUTPUT EVENTS
------------------------------------------------------------
- population.updated
- population.migration_shift
- population.refugee_wave
- population.stability_changed

------------------------------------------------------------
END
------------------------------------------------------------
