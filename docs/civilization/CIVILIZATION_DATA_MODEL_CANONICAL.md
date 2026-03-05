# ============================================================
# CIVILIZATION DATA MODEL (CANONICAL)
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization の主要データ構造を定義する。

------------------------------------------------------------
WORLD MODEL
------------------------------------------------------------

world

fields:

world_id
world_name
created_at
simulation_tick
world_state

Rules:

world state mutated only by Apply Engine.

------------------------------------------------------------
NATION MODEL
------------------------------------------------------------

nation

fields:

nation_id
nation_name
civilization_id
currency_code
population
stability_index

Each nation has its own currency.

------------------------------------------------------------
ORGANIZATION MODEL
------------------------------------------------------------

organization

types:

government
corporation
school
club
team

fields:

organization_id
nation_id
type
influence_index
members

------------------------------------------------------------
PERSONA AFFILIATION
------------------------------------------------------------

persona_affiliation

fields:

persona_id
nation_id
organization_id
role
status

Source of truth remains PersonaOS snapshot.

Civilization holds read projection.

------------------------------------------------------------
POPULATION STATE
------------------------------------------------------------

population_state

fields:

population_total
age_distribution
labor_force
migration_index

Updated by Population Engine.

------------------------------------------------------------
ECONOMY STATE
------------------------------------------------------------

economy_state

fields:

gdp_index
inflation_index
employment_index
trade_volume

Updated by Economic Engine.

------------------------------------------------------------
WAR STATE
------------------------------------------------------------

war_state

fields:

conflict_id
nation_a
nation_b
phase
tension_index

Managed by War Escalation Model.

------------------------------------------------------------
EVENT STORE
------------------------------------------------------------

event_store

fields:

event_id
event_type
event_version
payload
schema_hash
occurred_at

Rules:

events are immutable.

------------------------------------------------------------
CHECKPOINT
------------------------------------------------------------

checkpoint

fields:

checkpoint_id
world_id
simulation_tick
state_hash
created_at

Used for replay and recovery.

------------------------------------------------------------
END
------------------------------------------------------------
