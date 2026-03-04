# ============================================================
# CIVILIZATION WORLD GENERATION ENGINE
# Boot & Generation Procedure
# ============================================================

status: canonical
scope: civilization.world.generation_engine
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines:
- how a world is generated (deterministic)
- how initial state is validated
- how the simulation starts producing events
- how worlds are cloned for multiverse experiments

Inputs:
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_ARCHETYPES.md
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_WORLD_INITIAL_STATE.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Outputs:
- world_state snapshot (t0)
- world_seed
- adjacency graph
- initial economy/war/trade contexts

# ============================================================
# 1. GENERATION MODES
# ============================================================

Mode A: Fixed Canonical Boot
- use CIVILIZATION_WORLD_INITIAL_STATE.md as-is

Mode B: Seeded Variation Boot
- start from canonical boot, apply bounded perturbations (±5) to selected stocks
- preserve archetype bias
- ensure validation invariants

Mode C: Procedural Boot (future)
- generate populations/resources from map distributions
- not required for current phase

# ============================================================
# 2. DETERMINISTIC RNG
# ============================================================

RNG requirements:
- deterministic for same (world_seed, tick, civ_id, subsystem)

Recommended:
- hash-based PRNG:
  r = hash(world_seed || tick || civ_id || subsystem || salt) mod 10000 / 10000.0

No floating randomness without seed.

# ============================================================
# 3. INITIALIZATION PIPELINE
# ============================================================

Step 1: Load World Map
- continents, sea lanes, chokepoints
- derive adjacency list (land + sea)

Step 2: Load Resource Map
- assign resource bonuses to civs:
  +FOOD, +ENRG, +MATL based on geography specialization

Step 3: Load Archetypes
- apply archetype modifiers as delta multipliers (see core rules)

Step 4: Load Diplomacy Matrix
- initialize relation values and tag constraints:
  - "friend" if >= 70
  - "neutral" if 40..69
  - "hostile" if <= 39

Step 5: Load Initial State
- set all stocks at t0
- set POP_ABS display values
- set company density

Step 6: Validate
- invariants: no famine start, no state failure start, etc.
- if invalid:
  - Mode A: fail-closed (stop)
  - Mode B: retry perturbation within max_attempts

Step 7: Emit Boot Events
- emit non-destructive boot markers:
  - WORLD_BOOTED
  - DIPLOMACY_INITIALIZED
  - RESOURCE_MAP_APPLIED
  - ADJACENCY_GRAPH_READY

# ============================================================
# 4. EVENT GENERATION (POST-BOOT)
# ============================================================

After tick starts, event generator runs each tick:

4.1 Exogenous Generator (rare)
- disaster probability (admin-tunable)
- pandemic probability (admin-tunable)

4.2 Endogenous Detector (from core rules)
Generate events if thresholds hit:
- FAMINE
- RECESSION
- UPRISING
- COUP
- REVOLUTION
- MIGRATION_WAVE
- SEEK_PEACE
- DECLARE_WAR

4.3 Diplomatic Dynamics
- TRADE increases relations slowly (+1 per 3 ticks if high trade)
- sanctions decrease relations (-5 to -15)
- war sets relations to hostile floor (<= 10)

# ============================================================
# 5. MULTIVERSE CLONING
# ============================================================

To create a new world in multiverse:
- clone canonical t0
- apply Mode B perturbations with a new seed
- keep narrative history separate

World identity:
- world_id = world_main_001, world_main_002, ...
- world_seed changes per world

Cross-world interaction (optional, later):
- trade portals
- war portals
- migration portals
All must be explicit events (no hidden coupling).

# ============================================================
# 6. OUTPUT ARTIFACTS
# ============================================================

Artifacts to produce at boot:
- adjacency_graph.json (optional)
- initial_state_snapshot.json (optional)
- boot_log.md (optional)

Design rule:
- artifacts are additive (never delete historical snapshots)

# ============================================================
# 7. FAIL-CLOSED POLICY
# ============================================================

If any of the following occurs at boot:
- missing required doc
- invalid values out of range
- missing adjacency nodes
- diplomatic matrix incomplete

Then:
- stop boot
- output error event: WORLD_BOOT_FAILED
- do not start ticking

# ============================================================
# END
# ============================================================
