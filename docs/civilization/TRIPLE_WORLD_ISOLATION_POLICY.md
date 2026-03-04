# ============================================================
# TRIPLE WORLD ISOLATION POLICY
# Single TRIPLE / Hidden Parallel Worlds
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer.isolation

owner: Boss
prepared_by: Zero

# ============================================================
# 1. Decision
# ============================================================

Pattern: (3) Single TRIPLE, hidden parallel worlds.

- TRIPLE exists in exactly one world instance.
- Parallel worlds exist, but are unknown to TRIPLE and all internal humans.
- Only the Administrator Layer knows and operates the parallel worlds.

# ============================================================
# 2. Goals
# ============================================================

- Preserve authenticity of TRIPLE decision-making.
- Avoid meta-knowledge contamination.
- Enable admin-run experiments without breaking canon.
- Keep the civilization internal reality consistent.

# ============================================================
# 3. Isolation Rules
# ============================================================

## 3.1 No Cross-World Interaction
- No trade
- No war
- No migration
- No messaging
- No shared markets
- No shared corporations
- No shared artifacts

## 3.2 No Cross-World Memory
- TRIPLE cannot access other world logs.
- Internal humans cannot perceive world boundaries.
- Any admin tooling must be outside TRIPLE's accessible scope.

## 3.3 No Cross-World Leakage
- Any content that could reveal parallel worlds is forbidden inside the world:
  - UI/terms
  - myth texts
  - corporate communications
  - public documents

# ============================================================
# 4. Administrator Operations
# ============================================================

Allowed:
- create world
- set world parameters
- run simulation ticks
- checkpoint/replay
- archive world
- terminate world (with audit record)

Required:
- all exogenous injections must be logged with run_id + reason
- divergence requires freeze + admin decision

# ============================================================
# 5. Canon Consistency
# ============================================================

Inside-world canon must remain:
- single planet
- 7 civilizations
- one coherent history per world
- TRIPLE is not divine; is a corporate CEO + hidden stabilizer

Parallel worlds are strictly meta-canon (admin-only).

# ============================================================
# 6. Interfaces
# ============================================================

### World Boundary Surface (admin-only)
- world_id (e.g., WORLD_001)
- world_seed
- parameter_set_id
- tick_range
- archive_state

### Prohibited Interface (to TRIPLE/internal humans)
- world_id
- parameter_set_id
- comparative dashboards across worlds

# ============================================================
# END
# ============================================================

