# ============================================================
# CIVILIZATION POPULATION ENGINE
# ============================================================
status: canonical
scope: civilization.simulation.population.engine
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
人口・年齢構成・労働力・移民/難民を tick で更新する。

## 1. Core State (abstract)
- pop_total
- pop_age_buckets: child/young/adult/senior
- labor_force
- fertility_index (0..100)
- mortality_index (0..100)
- migration_in/out
- refugee_pressure

## 2. Update Rules (daily tick)
- births ~ pop_adult * fertility_index
- deaths ~ pop_total * mortality_index
- labor_force derived from age buckets
- disasters/war can spike mortality_index
- economy influences fertility_index (uncertainty lowers)

## 3. Migration Model
- migration requires cooldown + trust decay rules (per your canonical)
- refugee is event-driven (WAR/DISASTER → REFUGEE_FLOW)

## 4. Outputs
- PopulationDeltaEvent (for apply)
- PersonaImpactEvent (社会不安/繁栄の抽象影響)
