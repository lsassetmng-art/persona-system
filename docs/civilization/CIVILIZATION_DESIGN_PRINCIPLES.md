# ============================================================
# CIVILIZATION DESIGN PRINCIPLES
# CIVILIZATION OS / World Simulation - Design Philosophy
# ============================================================
status: canonical
scope: civilization.design.principles
owner: Boss
prepared_by: Zero
version: 1.0

# ============================================================
# 0. PURPOSE
# ============================================================

This document explains "why" Civilization is designed this way.
It is a non-executable canonical justification layer that keeps:
- architecture decisions stable
- future changes consistent
- implementation discussions grounded

# ============================================================
# 1. CORE AXIOMS (Immutable)
# ============================================================

A1. Fail-Closed by default
- If validation is uncertain, stop or reject.
- Silent fallback is forbidden.

A2. Explicit boundaries only
- Cross-layer mutation is forbidden.
- Integration happens ONLY through versioned events.

A3. Additive evolution
- Deletion is avoided.
- Change is expressed by versioning and new artifacts.

A4. Deterministic world state
- Same inputs produce the same outputs.
- Randomness must be seed-scoped and reproducible.

A5. Narrative is a first-class system artifact
- Myth / history / incidents exist as design assets.
- They are part of world coherence and explainability.

# ============================================================
# 2. LAYER PHILOSOPHY
# ============================================================

Civilization is split into two orthogonal bibles:

(1) OS Layer (Governance / Contracts / Runtime)
- constitution
- architecture
- event standard
- freeze policy
- operations (hardening/recovery/failure-matrix)

(2) World Layer (Simulation / Nations / Economy / War / Myth)
- world model
- nations/civilizations
- economy/companies/currency
- diplomacy/war
- history/mythology
- initial state & generation engine

This prevents:
- world rules leaking into OS governance
- OS contracts changing due to story edits

# ============================================================
# 3. EVENT-FIRST INTEGRATION
# ============================================================

Civilization does not rely on direct calls across domains.
All cross-domain effects are expressed as events:
- WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT
- versioned schema
- deterministic schema_hash
- (when required) signature verification

Reason:
- auditability
- replayability
- idempotency
- safety gates

# ============================================================
# 4. SIMULATION PRINCIPLES
# ============================================================

S1. Stocks are bounded (0..100)
- Every engine state is normalized.
- Display values (population, GDP, etc.) are derived.

S2. Stable boot, dynamic evolution
- boot state avoids immediate collapse.
- crises emerge by thresholds & dynamics, not by arbitrary starts.

S3. Multi-civilization is default
- each civilization is sovereign (currency, population, economy).
- relations change via trade/war/sanctions.

S4. Human/admin is the outer frame
- "optimal population" is admin-tunable.
- hard constraints exist, but knobs remain.

# ============================================================
# 5. STORY INTEGRATION (Myth & Incidents)
# ============================================================

Myth and history are not decoration:
- they define public explanations inside civilization
- they justify institutions, taboos, and legitimacy
- they guide narrative-consistent event generation

Three-incident doctrine:
- major incidents shape early political memory
- each incident is modeled at abstract level (no reproduction of tactics)

# ============================================================
# 6. CHANGE GOVERNANCE
# ============================================================

- Constitutional layer changes are rare and require strict review.
- Event schema changes follow version policy (MAJOR when breaking).
- Freeze windows apply to architecture-contract modifications.
- Operations documents must always provide fail-closed recovery paths.

# ============================================================
# 7. DEFINITION OF "DONE" (Design)
# ============================================================

Design is complete when:
- OS bible is stable (contracts/governance/ops)
- World bible is stable (simulation, nations, economy, war, myth, history)
- Boot artifacts exist (world_initial_state, world_generation_engine)
- Complete bible can be rebuilt deterministically from repo files

