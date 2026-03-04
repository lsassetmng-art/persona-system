# Civilization Data Model (Canonical)
status: canonical
scope: civilization.data_model
owner: Boss
prepared_by: Zero

## Entities
- universe
- civilization
- nation (optional: civilization == nation in simple mode)
- organization (company, school, club, military unit)
- market (fx, commodity, labor)
- resource (energy, food, minerals, strategic materials)
- technology (tree + adoption)
- policy (laws, sanctions, treaties)
- event (the only mutation driver)
- tick (time step record)
- metric (aggregated numbers)
- character (key persons; lore + governance actors)

## Identifiers
- uuid for internal entities
- stable string codes for lore-facing identifiers (e.g., civ_code: "NOVA")

## Event Envelope (minimum)
- event_id (uuid)
- event_type (string)
- event_version (int)
- occurred_at (world time)
- created_at (system time)
- source (system/admin)
- severity (1..100)
- payload (json)
- trace (run_id, tick_id)

## Invariants
- Event immutability (append-only)
- Derived facts are reproducible from event log + checkpoints
- No hard delete (tombstone/expired instead)
