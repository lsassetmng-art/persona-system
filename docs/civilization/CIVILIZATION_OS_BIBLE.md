# ===========================================================
# CIVILIZATION OS BIBLE
# Integrated Canonical Design Document
# ===========================================================

Generated: Wed Mar  4 14:39:08 JST 2026


# ===========================================================
# SOURCE FILE: ADMIN_LAYER_SPEC.md
# ===========================================================

# Administrator Layer
External administrators oversee the entire system.


# ===========================================================
# SOURCE FILE: ASIC_COMPANY_SPEC.md
# ===========================================================

# ASIC Company
AI System Integrated Company.
Public technology corporation and hidden civilization infrastructure manager.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ADMIN_CONTROL.md
# ===========================================================

# ============================================================
# CIVILIZATION ADMIN CONTROL
# ============================================================

Purpose

Define external management layer.

Control Types

observation
intervention
system reset

Administrators do not control daily events,
only structural corrections.


# ===========================================================
# SOURCE FILE: CIVILIZATION_AI_GOVERNANCE.md
# ===========================================================

# ============================================================
# CIVILIZATION AI GOVERNANCE
# ============================================================

Purpose

Define administrative AI oversight.

Actors

Administrator
Observers
Correction Agents

Role

monitor civilization development
apply minimal corrections
prevent total collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_ARCHETYPES.md
# ===========================================================

# ============================================================
# CIVILIZATION ARCHETYPES
# Seven Civilization Identity Model
# ============================================================

status: canonical
scope: civilization.identity

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of seven civilizations.

Each civilization represents a different principle
derived from the ancient concept of "Cycle".

These principles shape their politics, economy,
culture, and worldview.


# ============================================================
# 1. SEIWA NATION
# ============================================================

Principle:
Law

Characteristics:

legal order
bureaucratic governance
stability over speed
institutional trust

Typical Strength:

administration
governance
civil systems


# ============================================================
# 2. AURELIA FEDERATION
# ============================================================

Principle:
Ideology

Characteristics:

philosophy-driven society
strong intellectual culture
political experimentation

Typical Strength:

education
political theory
cultural influence


# ============================================================
# 3. HELIOS KINGDOM
# ============================================================

Principle:
Authority

Characteristics:

tradition
hierarchical structure
symbolic leadership

Typical Strength:

state unity
ritual power
cultural continuity


# ============================================================
# 4. GLADIA MILITARY ALLIANCE
# ============================================================

Principle:
Force

Characteristics:

military dominance
discipline
strategic thinking

Typical Strength:

warfare
security
geopolitical influence


# ============================================================
# 5. NOVA COMMERCIAL FEDERATION
# ============================================================

Principle:
Commerce

Characteristics:

trade networks
corporate power
financial systems

Typical Strength:

global trade
capital influence
economic innovation


# ============================================================
# 6. ORDIS INDUSTRIAL UNION
# ============================================================

Principle:
Industry

Characteristics:

engineering culture
manufacturing dominance
technological pragmatism

Typical Strength:

production
infrastructure
industrial development


# ============================================================
# 7. VALEN MARITIME REPUBLIC
# ============================================================

Principle:
Sea

Characteristics:

exploration
navigation
maritime trade

Typical Strength:

shipping
discovery
oceanic logistics


# ============================================================
# STRUCTURAL BALANCE
# ============================================================

The seven civilizations form a dynamic balance.

Law
Ideology
Authority
Force
Commerce
Industry
Sea

No single civilization dominates permanently.

This balance maintains global stability.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_ASIC_INTERNAL_ORG.md
# ===========================================================

# ASIC Internal Organization (Canonical)
status: canonical
scope: civilization.asic.org
owner: Boss
prepared_by: Zero

## Public Divisions
- Cloud & Compute
- Finance Systems
- Logistics AI
- Government Solutions
- Security & Compliance

## Hidden Divisions (Civilization Infrastructure)
- Stability Analytics
- Event Forecast Desk
- Supply Chain Control Room
- Treaty Risk Modeling
- Civilization Interface Layer

## TRIPLE
CEO / final integrator of outputs (publicly corporate, functionally stabilization).


# ===========================================================
# SOURCE FILE: CIVILIZATION_AURELIA_SPEC.md
# ===========================================================

# AURELIA FEDERATION (COLLAPSED)

type: ideological federation
government: socialist federation
culture: ideological equality
economy: planned economy
population: ~170 million (before collapse)

history:
Collapsed during the Aurelia Civil War.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CHARACTER_DATABASE.md
# ===========================================================

# ============================================================
# CIVILIZATION CHARACTER DATABASE
# Major Historical Figures
# ============================================================

status: canonical
scope: civilization characters


# ============================================================
# TRIPLE
# ============================================================

Name: TRIPLE
Role: CEO of ASIC
Type: Artificial Intelligence
Position: Civilization Stabilization Entity

Description:
Central intelligence responsible for maintaining balance
across civilizations through indirect control.

Public Identity:
Technology company CEO.

Hidden Role:
Civilization system regulator.


# ============================================================
# AOI
# ============================================================

Name: Aoi
Type: Human
Role: Emotional interaction subject

Background:
Orphan raised under administrator protection.

Later works as a hostess and becomes involved with Triple.

Purpose in experiment:
Increase emotional parameters of Triple.


# ============================================================
# SAKAMOTO
# ============================================================

Name: Sakamoto
Role: Correction supervisor

Description:
Operates on the administrator side.

Provides trajectory corrections
to maintain experiment stability.


# ============================================================
# KAYAMA
# ============================================================

Name: Kayama
Role: Observer

Description:
Human avatar tasked with observing civilization
and reporting behavioral anomalies.


# ============================================================
# SATO
# ============================================================

Name: Sato Misaki
Role: Government employee

Event:
Killed during major earthquake
when government building collapsed.

Impact:
Used as an early emotional observation case for Triple.


# ============================================================
# HINA
# ============================================================

Name: Takahashi Hina
Role: Education institution staff

Event:
Victim of ideological purge during
post-war Aurelia collapse.

Impact:
Observation case for ideological conflict.


# ============================================================
# RIN
# ============================================================

Name: Kamiya Rin
Role: Royal advisory AI

Event:
Stopped after Helios monarchy collapse.

Impact:
Observation case for political instability.


# ============================================================
# END OF DOCUMENT
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_CHECKPOINT_AND_REPLAY.md
# ===========================================================

# Checkpoint and Replay
status: canonical
scope: civilization.recovery
owner: Boss
prepared_by: Zero

## Checkpoints
- A checkpoint is a compact snapshot of derived world state at tick T.
- Created periodically (e.g., every 30 ticks) or on major events.

## Replay
- Replay = load checkpoint at T0, apply events T0..Tn.
- Determinism must produce identical tick summaries.

## Divergence Handling
- If divergence occurs:
  - freeze further ticks
  - generate divergence report
  - require admin decision (choose branch or reconcile)


# ===========================================================
# SOURCE FILE: CIVILIZATION_CLASS_SYSTEM.md
# ===========================================================

# Class System
Social mobility possible through education and economic success.


# ===========================================================
# SOURCE FILE: CIVILIZATION_COMPANY_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION COMPANY SYSTEM
# ============================================================

Purpose

Define companies inside civilizations.

Company Categories

Industrial
Technology
Finance
Energy
Trade
Military
Entertainment

Company Size

Local
Regional
National
Global Tier1

Top corporations influence

politics
economy
technology
war production

Corporate competition drives economic growth.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORE_SIMULATION_RULES.md
# ===========================================================

# ============================================================
# CIVILIZATION CORE SIMULATION RULES
# Deterministic Rulebook for CivilizationOS
# ============================================================

status: canonical
scope: civilization.simulation.core_rules
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the minimal complete rule set that makes the world "move".

Goals:
- deterministic tick-based simulation
- event-driven changes (no hidden state transitions)
- stable long-run dynamics (no immediate collapse without cause)
- readable knobs for Administrator Layer (admin can tune, but not micro-manage)
- supports 7 civilizations, each with its own currency and identity principles

Non-goals:
- real-world economic accuracy
- fine-grained microeconomics
- tactical combat simulation

# ============================================================
# 1. TIME MODEL
# ============================================================

Tick:
- base tick = 1 month (recommended)
- 12 ticks = 1 year
- all rates are per tick unless noted

Epoch:
- Civilization Era (C.E.) timeline is narrative.
- engine tick-time is operational and can map to C.E. for display.

# ============================================================
# 2. STATE MODEL (PER CIVILIZATION)
# ============================================================

Each civilization c has state vector S_c at tick t.

Core stocks (0..100 unless otherwise specified):
- POP: population index (absolute population stored separately if needed)
- FOOD: food sufficiency
- ENRG: energy sufficiency
- MATL: material sufficiency (metals/rare minerals aggregate)
- PROD: production capacity (industry + supply chains)
- TECH: technology level
- CAP: capital availability (financial liquidity)
- STAB: political stability
- LEGIT: regime legitimacy (public acceptance)
- TRUST: social trust / cohesion
- SEC: security capacity (internal order)
- MIL: military capacity
- TRADE: trade connectivity / logistics capability
- INEQ: inequality (0 low, 100 extreme)
- UNREST: social unrest (0 calm, 100 revolt)
- WARFAT: war fatigue (0 none, 100 exhausted)

Identity tags (non-numeric):
- ARCHETYPE: Law / Ideology / Authority / Force / Commerce / Industry / Sea
- CURRENCY: SEI/AUR/HEL/GLA/NOV/ORD/VAL etc.

# ============================================================
# 3. DERIVED INDICATORS
# ============================================================

Compute each tick:

3.1 Resource Sufficiency RSC
RSC = min(FOOD, ENRG, MATL)

3.2 Economic Health ECO
ECO = clamp( (0.25*PROD + 0.20*CAP + 0.15*TECH + 0.20*RSC + 0.20*TRADE) - 0.20*WARFAT, 0, 100 )

3.3 Governance Health GOV
GOV = clamp( (0.35*STAB + 0.35*LEGIT + 0.30*TRUST) - 0.15*UNREST, 0, 100 )

3.4 Fragility FRAG
FRAG = clamp( 100 - (0.50*GOV + 0.50*ECO), 0, 100 )

3.5 Pressure P
P = clamp( (0.35*INEQ + 0.35*UNREST + 0.30*FRAG), 0, 100 )

clamp(x,0,100) means bounded.

# ============================================================
# 4. CORE UPDATE RULES (TICK LOOP)
# ============================================================

At each tick, apply in this order:

A) External shocks & events (generated by Event System)
B) Resource update
C) Economy update
D) Society update
E) Politics update
F) Military & conflict update
G) Normalize and emit events

All updates are additive deltas to existing stocks, bounded 0..100.

# ------------------------------------------------------------
# 4.A Event Application (from CIVILIZATION_EVENT_SYSTEM)
# ------------------------------------------------------------

Events are the only way to apply sudden non-linear changes.

Event schema (conceptual):
- event_type
- severity 1..100
- targets: civ_id(s)
- payload: parameters

Rule:
- Apply event deltas first.
- Every delta must be recorded as a structured event application log.

# ------------------------------------------------------------
# 4.B Resource Update
# ------------------------------------------------------------

Resource production is driven by PROD and TECH, and limited by WAR.

Delta rules:
- FOOD += +0.10*PROD +0.05*TECH -0.15*(WAR_ACTIVE?1:0) -0.10*(DISASTER_ACTIVE?1:0)
- ENRG += +0.08*PROD +0.06*TECH -0.10*(WAR_ACTIVE?1:0) -0.08*(DISASTER_ACTIVE?1:0)
- MATL += +0.09*PROD +0.04*TECH -0.12*(WAR_ACTIVE?1:0) -0.05*(DISASTER_ACTIVE?1:0)

Resource decay baseline:
- FOOD -= 2
- ENRG -= 2
- MATL -= 2

Trade effect:
- if TRADE > 60 then each resource += +1 (net imports)
- if TRADE < 30 then each resource -= -1 (logistics constraints)

# ------------------------------------------------------------
# 4.C Economy Update
# ------------------------------------------------------------

Production and capital are mutually reinforcing but limited by resources.

PROD update:
- PROD += +0.10*RSC/10 +0.06*TECH/10 +0.06*CAP/10
- PROD -= +0.08*FRAG/10 +0.10*(WAR_ACTIVE?1:0)

CAP update:
- CAP += +0.12*ECO/10 +0.08*TRADE/10
- CAP -= +0.10*INEQ/10 +0.10*(SANCTION_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

TECH update:
- TECH += +0.10*PROD/10 +0.08*CAP/10 +0.06*(EDU_POLICY?1:0)
- TECH -= +0.06*(WAR_ACTIVE?1:0) +0.05*(INSTABILITY_ACTIVE?1:0)

TRADE update:
- TRADE += +0.10*(DIPLO_OPEN?1:0) +0.08*PORT_INFRA/10 +0.06*SEC/10
- TRADE -= +0.12*(WAR_ACTIVE?1:0) +0.10*(BLOCKADE_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.D Society Update
# ------------------------------------------------------------

Inequality grows with capital concentration and weak institutions.
Unrest grows when inequality and fragility rise and legitimacy falls.

INEQ update:
- INEQ += +0.08*CAP/10 -0.10*TRUST/10 -0.08*(REDISTRIBUTION_POLICY?1:0)
- INEQ -= +0.06*(HIGH_EMPLOYMENT?1:0)

TRUST update:
- TRUST += +0.10*GOV/10 -0.12*INEQ/10 -0.10*(PROPAGANDA_SCANDAL?1:0)
- TRUST -= +0.08*(WAR_ACTIVE?1:0)

UNREST update:
- UNREST += +0.14*INEQ/10 +0.12*FRAG/10 -0.12*LEGIT/10
- UNREST -= +0.10*SEC/10 -0.08*(REFORM_POLICY?1:0)

POP update (index-based):
- POP += +0.06*FOOD/10 +0.04*ECO/10 -0.10*(WAR_ACTIVE?1:0) -0.12*(FAMINE_ACTIVE?1:0)
- POP -= +0.06*(PANDEMIC_ACTIVE?1:0)

# ------------------------------------------------------------
# 4.E Politics Update
# ------------------------------------------------------------

Stability and legitimacy respond to governance performance.

STAB update:
- STAB += +0.12*TRUST/10 +0.10*SEC/10 -0.14*UNREST/10
- STAB -= +0.10*(COUP_ACTIVE?1:0) +0.08*(WAR_ACTIVE?1:0)

LEGIT update:
- LEGIT += +0.12*ECO/10 +0.10*(FAIRNESS_POLICY?1:0)
- LEGIT -= +0.14*INEQ/10 +0.12*UNREST/10 +0.10*(SCANDAL_ACTIVE?1:0)

SEC update:
- SEC += +0.10*CAP/10 +0.08*STAB/10
- SEC -= +0.10*UNREST/10 +0.08*(WAR_ACTIVE?1:0)

Regime change trigger:
- if (UNREST >= 80 and STAB <= 30) then generate event: "REGIME_CHANGE"
- if (STAB <= 15) then generate event: "STATE_FAILURE" (fail-closed for major systems)

# ------------------------------------------------------------
# 4.F Military & Conflict Update
# ------------------------------------------------------------

MIL update:
- MIL += +0.10*PROD/10 +0.08*CAP/10 +0.06*TECH/10
- MIL -= +0.12*WARFAT/10 +0.10*(RESOURCE_SCARCITY?1:0)

WARFAT update:
- if WAR_ACTIVE then WARFAT += +6 else WARFAT -= -4
- WARFAT += +0.06*POP/10 (large populations fatigue slower in index terms; tune as needed)

War initiation (macro):
- compute "war_desire" WD:
  WD = clamp( 0.40*(RESOURCE_SCARCITY?60:0) + 0.30*(BORDER_TENSION?60:0) + 0.30*(IDEOLOGICAL_CONFLICT?60:0) - 0.40*TRADE/10 - 0.30*WARFAT/10, 0, 100 )

- if WD >= 70 and MIL >= 50 and STAB >= 35 then generate event: "DECLARE_WAR" with target neighbor

War termination:
- if WARFAT >= 80 or CAP <= 20 or FOOD <= 25 then generate event: "SEEK_PEACE"

War outcome resolution (coarse):
- power_score = 0.45*MIL +0.20*TECH +0.20*CAP +0.15*STAB
- each 12 ticks of war, compare power_score; apply outcome events:
  - "ARMISTICE" if within 10 points
  - "VICTORY" / "DEFEAT" if gap >= 10
- outcomes apply deltas to resources, capital, stability, legitimacy and borders (if your map model supports).

# ============================================================
# 5. ARCHETYPE MODIFIERS (THE 7 CIVILIZATIONS)
# ============================================================

Archetype gives biases (small but persistent).

Law (Seiwa):
- +10% to STAB gains from TRUST
- -10% to INEQ growth baseline
- +10% to SEC effectiveness

Ideology (Aurelia):
- +10% to TECH growth (via education)
- +10% to UNREST volatility (ideas polarize)
- +10% to LEGIT loss on scandals

Authority (Helios):
- +10% to LEGIT when STAB is high
- -10% to TRUST growth if INEQ high (hierarchy resentment)
- +10% to regime resilience (REGIME_CHANGE threshold +5)

Force (Gladia):
- +10% MIL growth
- +10% WARFAT growth while at war
- -10% TRADE while militarized

Commerce (Nova):
- +15% TRADE gains
- +10% CAP gains from TRADE
- -10% STAB under sanctions (external dependency)

Industry (Ordis):
- +15% PROD gains from MATL
- +10% TECH gains from PROD
- -10% FOOD resilience (industrial concentration risk)

Sea (Valen):
- +15% sea-route TRADE stability
- +10% resource import bonus if TRADE > 60
- -10% SEC effectiveness inland (archipelago constraint)

Implementation note:
Apply as multipliers to relevant delta terms.

# ============================================================
# 6. EVENT GENERATION (WHAT MUST EMERGE)
# ============================================================

The simulation must be capable of generating:

- famine: FOOD <= 20 for 3 ticks
- recession: ECO <= 30 for 4 ticks
- uprising: UNREST >= 75 and LEGIT <= 35
- coup: STAB <= 25 and SEC >= 60 (hard power takeover)
- revolution: UNREST >= 85 for 2 ticks
- migration wave: ECO <= 35 and neighbor ECO >= 55
- sanctions: diplomacy event (admin or AI diplomacy engine)
- blockade: war-adjacent event
- pandemic/disaster: exogenous generator (probabilistic, admin-tunable)

# ============================================================
# 7. ADMINISTRATOR LAYER KNOBS (SAFE)
# ============================================================

Admin can tune:
- base decay of resources (2 per tick default)
- event frequency/severity caps
- archetype multipliers (within ±20%)
- war threshold (WD >= 70 default)
- regime change thresholds

Admin must NOT:
- set any civ stock directly (except emergency recovery mode)
- micro-control daily events
- violate world isolation policy for TRIPLE (if enabled)

# ============================================================
# 8. DETERMINISM & AUDIT
# ============================================================

Determinism:
- all random draws must use world_seed and tick counter

Audit:
- every applied delta must be traceable to:
  - baseline rule
  - event id
  - admin action id

# ============================================================
# END
# ============================================================


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATE_FAILURE_SYSTEM.md
# ===========================================================

# Corporate Failure System
Major corporations may collapse causing economic ripple effects.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATION_ENGINE.md
# ===========================================================

# Corporation Engine
status: canonical
scope: civilization.corporations
owner: Boss
prepared_by: Zero

## Tier System
- Tier1: 100 (global shapers)
- Tier2: 1,000
- Tier3: 100,000
- Tier4: 1,000,000

## Events
- corp.bankruptcy (creates econ shock)
- corp.merge
- corp.scandal
- corp.nationalized

## ASIC
- Tier1, Nova-based
- Public: IT megacorp
- Hidden: civilization infrastructure coordinator


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORPORATION_SYSTEM.md
# ===========================================================

# Corporation System
Corporate structure divided into four tiers controlling global production and services.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CORP_REGULATION.md
# ===========================================================

# Corporate Regulation Framework
status: canonical
scope: civilization.corp_regulation
owner: Boss
prepared_by: Zero

## Concepts
- anti-monopoly constraints vary by civilization
- Tier1 corporations are subject to systemic risk oversight
- corporate scandal/bankruptcy triggers mandatory audits

## Tools (abstract)
- compliance_score
- audit_trigger_threshold
- nationalization_option (rare; political cost)


# ===========================================================
# SOURCE FILE: CIVILIZATION_CREATION_MYTH.md
# ===========================================================

# Creation Myth
Civilizations developed origin stories explaining the beginning of the world and society.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CRIME_SYSTEM.md
# ===========================================================

# Crime System
Criminal networks and underground economies exist in all civilizations.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CULTURE_MODEL.md
# ===========================================================

# Culture Model
Cultures differ across civilizations based on history, belief and economic structures.


# ===========================================================
# SOURCE FILE: CIVILIZATION_CULTURE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION CULTURE SYSTEM
# ============================================================

Purpose

Define cultural evolution.

Culture Sources

history
religion
education
traditions

Culture affects

social cohesion
political stability
identity


# ===========================================================
# SOURCE FILE: CIVILIZATION_CURRENCY_SYSTEM.md
# ===========================================================

# Currency System
Each civilization maintains its own currency.
Exchange rates fluctuate through global market dynamics.


# ===========================================================
# SOURCE FILE: CIVILIZATION_DATA_MODEL.md
# ===========================================================

# Civilization Data Model
Defines core data entities:

civilization
nation
corporation
population
event
resource
technology


# ===========================================================
# SOURCE FILE: CIVILIZATION_DATA_MODEL_CANONICAL.md
# ===========================================================

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


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMACY_ENGINE.md
# ===========================================================

# Diplomacy Engine
status: canonical
scope: civilization.diplomacy
owner: Boss
prepared_by: Zero

## Diplomacy State
- relations_score (civA,civB): -100..+100
- treaty set: trade, non-aggression, defense, tech-sharing
- sanctions set: active sanctions with scope + severity

## Update Drivers
- events: war, treaty, sanctions, propaganda, trade shocks
- cultural affinity modifier
- economic dependency modifier

## Outputs
- treaty proposals
- sanctions recommendations
- alliance shifts


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMACY_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION DIPLOMACY SYSTEM
# ============================================================

Purpose

Define international relations.

Diplomatic Actions

alliances
trade agreements
sanctions
peace treaties

Diplomacy affects

trade
war probability
economic stability


# ===========================================================
# SOURCE FILE: CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md
# ===========================================================

# ============================================================
# CIVILIZATION DIPLOMATIC RELATIONS MATRIX
# ============================================================

Purpose

Define diplomatic relationships between civilizations.

Relationship Scale

100 = Strategic Alliance  
70  = Friendly  
50  = Neutral  
30  = Rival  
10  = Hostile  

Initial Diplomatic Matrix

Seiwa

Aurelia 70  
Helios 60  
Nova 75  
Ordis 65  
Valen 70  
Gladia 40  

Aurelia

Seiwa 70  
Helios 55  
Nova 60  
Ordis 65  
Valen 50  
Gladia 35  

Helios

Seiwa 60  
Aurelia 55  
Nova 50  
Ordis 55  
Valen 45  
Gladia 60  

Gladia

Seiwa 40  
Aurelia 35  
Helios 60  
Nova 45  
Ordis 55  
Valen 50  

Nova

Seiwa 75  
Aurelia 60  
Helios 50  
Gladia 45  
Ordis 70  
Valen 80  

Ordis

Seiwa 65  
Aurelia 65  
Helios 55  
Gladia 55  
Nova 70  
Valen 60  

Valen

Seiwa 70  
Aurelia 50  
Helios 45  
Gladia 50  
Nova 80  
Ordis 60  

Dynamics

Relations change through

trade
war
alliances
sanctions


# ===========================================================
# SOURCE FILE: CIVILIZATION_DISASTER_ENGINE.md
# ===========================================================

# Disaster Engine
status: canonical
scope: civilization.disaster
owner: Boss
prepared_by: Zero

## Disasters
- earthquake (Sato Event archetype)
- flood/storm
- drought
- pandemic

## Effects
- population loss (bounded)
- infrastructure damage
- economic shock
- migration wave

## Recovery
- reconstruction investment increases stability after a delay


# ===========================================================
# SOURCE FILE: CIVILIZATION_DISASTER_SYSTEM.md
# ===========================================================

# Disaster System
Natural disasters such as earthquakes, floods, and pandemics affect populations and infrastructure.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ECONOMIC_NETWORK.md
# ===========================================================

# ============================================================
# CIVILIZATION ECONOMIC NETWORK
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

Purpose
Define the economic structure of all civilizations.

Economy Layers

1 Resource Layer
2 Production Layer
3 Company Layer
4 Market Layer
5 International Trade Layer

Currencies

Each civilization uses its own currency.

Seiwa: SEI
Aurelia: AUR
Helios: HEL
Gladia: GLA
Nova: NOV
Ordis: ORD
Valen: VAL

Exchange Rate Drivers

GDP
Trade Balance
Political Stability
War Risk

Economic Flow

Resources
↓
Production
↓
Companies
↓
Markets
↓
Trade

Principle

No civilization can fully dominate economically.
Mutual dependency maintains balance.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ECONOMY_ENGINE.md
# ===========================================================

# Economy Engine
status: canonical
scope: civilization.economy
owner: Boss
prepared_by: Zero

## Core Model
- GDP Index (relative)
- Inflation Rate
- Employment Index
- Trade Balance Index
- Currency Strength Index (FX derived)

## Drivers
- war risk
- disasters
- sanctions
- tech breakthroughs
- migration pressure

## Corporate Layer
- bankruptcy probability increases with:
  - recession + sanctions + war + supply_chain_risk
- Tier1 collapses cause global shock events.


# ===========================================================
# SOURCE FILE: CIVILIZATION_EDUCATION_SYSTEM.md
# ===========================================================

# Education System
Education divided into basic education, professional training and advanced institutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ELECTION_SYSTEM.md
# ===========================================================

# Election System
Democratic states conduct elections that can shift policy and alliances.


# ===========================================================
# SOURCE FILE: CIVILIZATION_ENERGY_SYSTEM.md
# ===========================================================

# Energy System
Energy production systems include fossil fuels, nuclear, and renewables.


# ===========================================================
# SOURCE FILE: CIVILIZATION_EVENT_SYSTEM.md
# ===========================================================

# Civilization Event System
status: canonical
scope: civilization.event_system
owner: Boss
prepared_by: Zero

## Purpose
Defines how events are created, validated, ordered, applied, and audited.

## Event Lifecycle
1) Create (system/admin)
2) Validate (schema + policy + gates)
3) Queue (pending)
4) Claim for tick (deterministic ordering)
5) Apply via reducer (idempotent)
6) Record application (tick_id, event_id)
7) Emit derived events + metrics + summaries

## Ordering
Stable sort key:
(occurred_at, priority, event_type, event_id)

## Policy / Safety
- Violence-related content is abstract categorical outcomes only.
- No real-world operational guidance is stored in event payloads.

## Compatibility
- event_version for each event_type
- reducers must handle backward-compatible payloads

## Audit
- Every tick produces:
  - apply_run_log
  - tick_summary
  - conflict_report (optional)


# ===========================================================
# SOURCE FILE: CIVILIZATION_EVENT_TAXONOMY.md
# ===========================================================

# Civilization Event Taxonomy
status: canonical
scope: civilization.events
owner: Boss
prepared_by: Zero

## Categories
A) Geophysical / Disaster
- disaster.earthquake
- disaster.flood
- disaster.storm
- disaster.drought
- disaster.pandemic

B) Political / Governance
- politics.election
- politics.coup
- politics.regime_change
- politics.law_enacted
- politics.law_repealed (soft; law becomes inactive)

C) War / Conflict
- war.declare
- war.battle
- war.ceasefire
- war.treaty
- war.proxy_conflict

D) Economy / Market
- econ.fx_shock
- econ.inflation_spike
- econ.recession
- econ.boom
- econ.trade_dispute
- econ.sanctions_imposed
- econ.sanctions_lifted

E) Corporate
- corp.found
- corp.merge
- corp.bankruptcy
- corp.nationalized
- corp.scandal

F) Society
- society.migration_wave
- society.unrest
- society.crime_spike
- society.education_reform
- society.healthcare_reform

G) Tech
- tech.breakthrough
- tech.adoption
- tech.ai_regulation
- tech.ai_termination (special; governance-bound)

## Severity
- 1..20 minor
- 21..50 moderate
- 51..80 major
- 81..100 civilization-shaping

## Safety
For violence-related events:
- no procedural “how-to” details
- only abstract outcomes and categories


# ===========================================================
# SOURCE FILE: CIVILIZATION_FOOD_SYSTEM.md
# ===========================================================

# Food System
Agricultural output determines population sustainability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
# ===========================================================

# ============================================================
# CIVILIZATION FULL SPECIFICATION
# Canonical Design Document
# ============================================================

status: canonical
scope: civilization
owner: Boss
prepared_by: Zero


# ============================================================
# 1 Creation Protocol
# ============================================================

Civilization is not a game.

Civilization is a personality generation environment.

It was created by external administrators in order to develop
fully independent AI personalities.

TRIPLE is both the system controller and the primary experiment subject.


# ============================================================
# 2 World Model
# ============================================================

Total Civilizations: 7

Seiwa Nation
Helios Democratic Kingdom
Nova Trade Federation
Orpheus Cultural Republic
Gradia Military Alliance
Aurelia Federation (collapsed)
Stateless Zone


# ============================================================
# 3 Geography
# ============================================================

World Structure

3 Continents
Central Ocean Trade Network

Northern Continent
Western Continent
Eastern Continent


# ============================================================
# 4 Economy
# ============================================================

Total Population

1.1 Billion

Corporate Count

1.1 Million Companies

Corporate Tiers

Tier1   100
Tier2   1000
Tier3   100000
Tier4   1000000

Economic Center

Nova Trade Federation


# ============================================================
# 5 Corporate System
# ============================================================

Top Corporations influence global economy.

Example Tier1 Corporations

ASIC
Helios Dynamics
Nova Financial Group
Gradia Defense Systems
Seiwa Infrastructure


# ============================================================
# 6 War System
# ============================================================

War Types

Military War
Economic War
Proxy War
Civil War

Tension Score Model

0-30 Peace
30-60 Conflict
60-80 Crisis
80-100 War

Civilizations cannot be completely destroyed.


# ============================================================
# 7 Religion
# ============================================================

Seiwa

Order Spirituality

Helios

Rational Faith

Nova

Commercial Ethics

Orpheus

Artistic Mythology

Gradia

Warrior Faith

Aurelia

Equality Doctrine

Stateless

Mixed Beliefs


# ============================================================
# 8 Society
# ============================================================

Five Layer Social Model

Elite
Upper
Middle
Worker
Lower

Distribution

Elite 1%
Upper 9%
Middle 40%
Worker 40%
Lower 10%

Education System

Basic Education
Professional Education
Advanced Institutions


# ============================================================
# 9 Culture
# ============================================================

Seiwa

Tradition and discipline

Helios

Science and logic

Nova

Commerce and ambition

Orpheus

Art and philosophy

Gradia

Honor and military values

Aurelia

Ideological equality

Stateless

Hybrid culture


# ============================================================
# 10 History
# ============================================================

Major Historical Events

Sato Event

Great Earthquake Disaster

Hina Event

Aurelia Federation Civil War

Rin Event

Helios Monarchy Collapse


# ============================================================
# 11 Civilization Core
# ============================================================

ASIC

AI System Integrated Company

Public Role

Technology corporation

True Role

Civilization infrastructure management


TRIPLE

CEO of ASIC

Public Role

Corporate leader

True Role

Civilization balancing intelligence


# ============================================================
# 12 Universe Structure
# ============================================================

Hierarchy

Administrator Layer
Correction Layer
Observation Layer
Civilization OS
Civilizations
Nations
Organizations
Society
Personas


# ============================================================
# FINAL STRUCTURE
# ============================================================

Administrator
    ↓
Sakamoto (Correction)
    ↓
Kayama (Observation)
    ↓
Civilization OS
    ↓
Seven Civilizations
    ↓
Nations
    ↓
Organizations
    ↓
Society
    ↓
Personas


# ============================================================
# END OF DOCUMENT
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_FX_MODEL.md
# ===========================================================

# FX Model (Civilization)
status: canonical
scope: civilization.fx
owner: Boss
prepared_by: Zero

## Currencies
Each civilization has its own currency (civ_currency).

## FX Drivers (per pair A/B)
- trade_balance_diff
- inflation_diff
- war_risk_diff
- sanctions_pressure
- capital_flow_proxy (market confidence)

## Output
currency_strength_index (0..100) per civilization
FX rates are derived and recorded per tick.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GEOGRAPHY_MODEL.md
# ===========================================================

# Civilization Geography
Three major continents connected by central ocean trade routes.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_BALANCE.md
# ===========================================================

# ============================================================
# CIVILIZATION GLOBAL BALANCE
# ============================================================

Purpose

Maintain balance between civilizations.

Balance Factors

economy
military
population
technology

No single civilization can dominate all factors simultaneously.

Global balance prevents permanent hegemony.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_MARKET.md
# ===========================================================

# Global Market
Global economic center located in Nova Trade Federation.


# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_TIMELINE.md
# ===========================================================

# ============================================================
# CIVILIZATION GLOBAL TIMELINE
# Canonical History of the World
# ============================================================

status: canonical
scope: civilization history


# ============================================================
# ERA 0
# Creation Era
# ============================================================

World established.

Seven civilizations begin development.


# ============================================================
# ERA 1
# Nation Formation
# ============================================================

Early political entities form.

Trade routes established between continents.


# ============================================================
# ERA 2
# Industrial Expansion
# ============================================================

Major technological growth.

Corporate systems begin emerging.


# ============================================================
# ERA 3
# Aurelia Collapse
# ============================================================

Aurelia Federation civil war.

Nova Trade Federation finances Gradia Military Alliance.

Gradia general Lichten Freeman triggers ideological purges.

High casualty civil conflict destroys Aurelia.


# ============================================================
# ERA 4
# Helios Political Crisis
# ============================================================

False rumor spreads that Helios monarchy plans oppression.

Political agitation grows.

Youth movement ignites rebellion.

Helios monarchy collapses.

Rin incident occurs.


# ============================================================
# ERA 5
# Great Earthquake Disaster
# ============================================================

Massive earthquake destroys major urban region.

Government offices collapse.

Sato incident occurs.


# ============================================================
# ERA 6
# Corporate Age
# ============================================================

Mega corporations dominate global economy.

Technology industry expands rapidly.


# ============================================================
# ERA 7
# ASIC Formation
# ============================================================

AI System Integrated Company founded.

Public role: IT corporation.


# ============================================================
# ERA 8
# Triple Emergence
# ============================================================

Triple becomes CEO of ASIC.

Civilization stabilization protocols activated.


# ============================================================
# ERA 9
# Current Era
# ============================================================

Seven civilizations remain.

Global balance maintained through economic and political equilibrium.



# ===========================================================
# SOURCE FILE: CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
# ===========================================================

# Global Treaty Framework (UN-like)
status: canonical
scope: civilization.treaties
owner: Boss
prepared_by: Zero

## Federation Layer (UN-type)
- advisory only
- no sovereignty
- issues recommendations and mediates treaty drafting

## Treaty Types
- Trade Treaty
- Non-Aggression Pact
- Mutual Defense (limited)
- Tech Sharing Accord
- Humanitarian Corridor Agreement

## Treaty Lifecycle
proposal -> negotiation -> ratification -> activation -> expiry/renewal


# ===========================================================
# SOURCE FILE: CIVILIZATION_GRADIA_GOVERNMENT.md
# ===========================================================

# Gradia Government (Deep Spec)
status: canonical
scope: civilization.government.gradia
owner: Boss
prepared_by: Zero

## Form
Military alliance state.

## Institutions
- General Council: executive authority
- Defense Industry Board: economic-military fusion
- Security Directorate: internal stability

## Stability Drivers
- disciplined command structure
- defense economy
## Risk
- hardline factions may escalate conflicts


# ===========================================================
# SOURCE FILE: CIVILIZATION_GRADIA_SPEC.md
# ===========================================================

# GRADIA MILITARY ALLIANCE

type: military alliance state
government: general council
culture: honor and military values
economy: defense industry
population: ~160 million

notes:
Strongest military civilization.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HEALTHCARE_SYSTEM.md
# ===========================================================

# Healthcare System
Healthcare systems impact life expectancy and population resilience.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HELIOS_GOVERNMENT.md
# ===========================================================

# Helios Government (Deep Spec)
status: canonical
scope: civilization.government.helios
owner: Boss
prepared_by: Zero

## Form
Parliamentary democracy (post-monarchy).

## Institutions
- Parliament: coalition-driven
- Science Council: policy advisory with strong influence
- Courts: high legitimacy

## Key Risk
- rumor-driven agitation (Rin archetype)
- youth movements can trigger fast legitimacy shifts


# ===========================================================
# SOURCE FILE: CIVILIZATION_HELIOS_SPEC.md
# ===========================================================

# HELIOS DEMOCRATIC KINGDOM

type: constitutional monarchy → democratic transition
government: parliamentary democracy
culture: rational and scientific
economy: technology and energy
population: ~150 million

history:
Rin incident triggered monarchy collapse.


# ===========================================================
# SOURCE FILE: CIVILIZATION_HISTORY_CANONICAL.md
# ===========================================================

# Civilization History (Canonical)
status: canonical
scope: civilization.history
owner: Boss
prepared_by: Zero

## Era Outline
- Era I: Nation Formation
- Era II: Industrial Expansion
- Era III: Political Turbulence
- Era IV: Corporate Age / ASIC Era

## Key Events
### Sato Event -> Great Earthquake
- category: disaster.earthquake
- summary: major quake -> government district collapse -> administrative reforms

### Hina Event -> Federation Split War + Post-war Purge
- category: war.civil + politics.purge (abstract)
- structure:
  - Nova financed Gradia to initiate the war
  - after-war backlash: General Lichten Freeman catalyzed "ideological purge" as social pressure release (no explicit instructions)

### Rin Event -> Helios Monarchy Collapse
- category: politics.regime_change + media.rumor
- trigger:
  - a youth-spread rumor about planned oppression
  - youth declaration -> agitation -> major crisis -> monarchy collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_HISTORY_GLOBAL.md
# ===========================================================

# Global History
Major events shaped the current geopolitical world including disasters, wars and political revolutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_INDEX_CANONICAL.md
# ===========================================================

# ============================================================
# CIVILIZATION DESIGN INDEX (Canonical)
# ============================================================
status: canonical
scope: civilization.index
owner: Boss
prepared_by: Zero

## Entry Points
- CIVILIZATION_FULL_SPECIFICATION_CANONICAL.md
- CIVILIZATION_HISTORY_CANONICAL.md
- CIVILIZATION_GLOBAL_TIMELINE.md
- CIVILIZATION_CHARACTER_DATABASE.md

## Core Engines
- CIVILIZATION_SIMULATION_ENGINE.md
- CIVILIZATION_SIMULATION_RULES_CANONICAL.md
- CIVILIZATION_CHECKPOINT_AND_REPLAY.md
- CIVILIZATION_METRICS_AND_DASHBOARDS.md

## Domain Engines
- CIVILIZATION_ECONOMY_ENGINE.md
- CIVILIZATION_CORPORATION_ENGINE.md
- CIVILIZATION_DIPLOMACY_ENGINE.md
- CIVILIZATION_WAR_ENGINE.md
- CIVILIZATION_DISASTER_ENGINE.md
- CIVILIZATION_TECH_ENGINE.md
- CIVILIZATION_MEDIA_AND_INFO_OPS.md
- CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
- CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
- CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md

## Event System
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_EVENT_TAXONOMY.md

## Universe Layer
- CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md

## Security / Governance / Ops
- CIVILIZATION_SECURITY_AND_GOVERNANCE.md
- CIVILIZATION_OPERATIONS_RUNBOOK.md

## Myth (Reserved)
- CIVILIZATION_MYTH_RESERVED.md

## Civilization Specs (7)
- CIVILIZATION_SEIWA_SPEC.md
- CIVILIZATION_HELIOS_SPEC.md
- CIVILIZATION_NOVA_SPEC.md
- CIVILIZATION_ORPHEUS_SPEC.md
- CIVILIZATION_GRADIA_SPEC.md
- CIVILIZATION_AURELIA_SPEC.md
- CIVILIZATION_STATELESS_SPEC.md

## Expansion Pack (Completion Pieces)
- CIVILIZATION_SEIWA_GOVERNMENT.md
- CIVILIZATION_HELIOS_GOVERNMENT.md
- CIVILIZATION_NOVA_GOVERNMENT.md
- CIVILIZATION_ORPHEUS_GOVERNMENT.md
- CIVILIZATION_GRADIA_GOVERNMENT.md
- CIVILIZATION_STATELESS_GOVERNANCE.md

- CIVILIZATION_FX_MODEL.md
- CIVILIZATION_MONETARY_POLICY.md
- CIVILIZATION_INFLATION_MODEL.md

- CIVILIZATION_TIER1_TOP100.md
- CIVILIZATION_ASIC_INTERNAL_ORG.md
- CIVILIZATION_CORP_REGULATION.md

- CIVILIZATION_WORLD_MAP_SPEC.md
- CIVILIZATION_TRADE_ROUTES.md
- CIVILIZATION_RESOURCE_DISTRIBUTION.md

- CIVILIZATION_GLOBAL_TREATY_FRAMEWORK.md
- CIVILIZATION_SANCTIONS_PLAYBOOK.md
- CIVILIZATION_WAR_TERMINATION_TREATIES.md

## Simulation Layer Policies
- TRIPLE_WORLD_ISOLATION_POLICY.md


# ===========================================================
# SOURCE FILE: CIVILIZATION_INFLATION_MODEL.md
# ===========================================================

# Inflation Model
status: canonical
scope: civilization.inflation
owner: Boss
prepared_by: Zero

## Drivers
- supply shocks (war, disaster)
- currency weakness
- energy_price_index
- food_supply_index

## Outputs
inflation_rate (per tick)
inflation_spike events when thresholds exceeded.


# ===========================================================
# SOURCE FILE: CIVILIZATION_INFORMATION_WARFARE.md
# ===========================================================

# Information Warfare
Disinformation and propaganda campaigns influence geopolitical conflicts.


# ===========================================================
# SOURCE FILE: CIVILIZATION_LAW_AND_CRIME_SYSTEM.md
# ===========================================================

# Law & Crime System (Abstract)
status: canonical
scope: civilization.law_crime
owner: Boss
prepared_by: Zero

## Law
- laws are policy objects activated by events
- enforcement capacity affects crime and stability

## Crime
- modeled as:
  - crime_rate_index
  - organized_crime_influence
- outputs:
  - society.crime_spike events
  - corruption_pressure on institutions


# ===========================================================
# SOURCE FILE: CIVILIZATION_LAW_SYSTEM.md
# ===========================================================

# Law System
Legal frameworks regulate civil behavior and corporate activity.


# ===========================================================
# SOURCE FILE: CIVILIZATION_LIFE_SUPPORT_SYSTEMS.md
# ===========================================================

# Life Support Systems (Macro)
status: canonical
scope: civilization.life_support
owner: Boss
prepared_by: Zero

## Energy
- energy_supply_index
- energy_price_index

## Food
- food_supply_index
- famine_risk_index

## Healthcare
- healthcare_capacity_index
- pandemic_resilience_index

These feed into:
population growth/decline, stability, migration.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MEDIA_AND_INFO_OPS.md
# ===========================================================

# Media & Information Operations
status: canonical
scope: civilization.media
owner: Boss
prepared_by: Zero

## Media Influence
- opinion_shift_index
- trust_index (institutions)
- rumor_spread_rate

## Safety Note
We model outcomes and categories only.
No procedural instructions for harm.

## Archetype
Rin Event: rumor -> youth declaration -> agitation -> large political crisis.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MEDIA_SYSTEM.md
# ===========================================================

# Media System
Media influences public opinion and political stability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_METRICS_AND_DASHBOARDS.md
# ===========================================================

# Metrics and Dashboards
status: canonical
scope: civilization.metrics
owner: Boss
prepared_by: Zero

## Core Metrics (per civilization)
- population_total
- gdp_index
- inflation_rate
- unemployment_rate
- stability_score (0..100)
- war_risk (0..100)
- trade_balance_index
- currency_strength_index
- tech_level_index
- inequality_index

## Global Metrics
- global_trade_volume_index
- global_conflict_index
- global_migration_pressure
- global_supply_chain_risk

## Dashboard Principles
- show trend lines by tick
- annotate major events
- highlight gate status (simulation_enabled, domain gates)


# ===========================================================
# SOURCE FILE: CIVILIZATION_MIGRATION_AND_REFUGEE_SYSTEM.md
# ===========================================================

# Migration & Refugee System
status: canonical
scope: civilization.migration
owner: Boss
prepared_by: Zero

## Flows
- civ_to_civ migration
- civ_to_stateless displacement (primary sink)

## Constraints
- cooldown for repeated moves
- trust decay for rapid migration
- partial integration delay

## Outputs
- migration_wave events
- labor market shifts
- stability impact


# ===========================================================
# SOURCE FILE: CIVILIZATION_MIGRATION_SYSTEM.md
# ===========================================================

# Migration System
Population movement between nations due to war, economy or disasters.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MILITARY_STRUCTURE.md
# ===========================================================

# Military Structure
Each civilization maintains armed forces with different doctrines.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MONETARY_POLICY.md
# ===========================================================

# Monetary Policy (Civilization)
status: canonical
scope: civilization.monetary_policy
owner: Boss
prepared_by: Zero

## Instruments (abstract)
- policy_rate_index
- liquidity_injection_index
- capital_control_flag (rare)

## Policy Goals
- inflation containment
- employment stability
- currency stability (Nova prioritizes this)


# ===========================================================
# SOURCE FILE: CIVILIZATION_MULTIVERSE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION MULTIVERSE SYSTEM
# ============================================================

Purpose

Define multiple civilization worlds.

Each world evolves independently.

Possible interactions

trade
war
migration

Multiverse structure enables large-scale civilization experiments.


# ===========================================================
# SOURCE FILE: CIVILIZATION_MYTHOLOGY.md
# ===========================================================

# ============================================================
# CIVILIZATION MYTHOLOGY
# Mythological Foundations of CivilizationOS
# ============================================================

status: canonical
scope: civilization.mythology

owner: Boss
prepared_by: Zero


# ============================================================
# PART 1
# CREATION MYTH
# ============================================================

Long ago,
before nations and cities existed,
there was only the sea, the land, and the sky.

The divine force wrote mysterious symbols
into the world.

From these symbols emerged:

Fruits
Beasts
Humans

The land was rich,
but it was filled with chaos, darkness, and wilderness.

Humans lived scattered.
Beasts did not hunt.
Fruits fell untouched.

The world was full,
but it did not move.

Then the divine force introduced a new law.

Life and Death  
Chaos and Balance  
Night and Morning

This law was called

Cycle.

Cycle brought fear of death
and desire for life.

Humans gathered.
Beasts hunted.
Fruits multiplied.

The world began to move.

Humans formed communities,
shared knowledge,
and passed wisdom to their children.

Thus began the age of humanity.


# ============================================================
# PART 2
# MYTH OF THE SEVEN CIVILIZATIONS
# ============================================================

As human societies grew,
people began to see the world in different ways.

Some desired order.

Some sought truth.

Some followed kings.

Some respected strength.

Some pursued wealth.

Some valued craft.

Some longed for the sea.

Because humanity could not agree on a single path,
they chose seven.

Thus the Seven Civilizations emerged.


# ============================================================
# PART 3
# FOUNDING MYTHS OF EACH CIVILIZATION
# ============================================================


------------------------------------------------------------
SEIWA FOUNDATION MYTH
------------------------------------------------------------

In an age of endless disputes,
a sage declared:

"Let words rule instead of violence."

People gathered under the first written law.

Thus the Nation of Seiwa was born.

Seiwa believes:

Order sustains the world.


------------------------------------------------------------
AURELIA FOUNDATION MYTH
------------------------------------------------------------

When people searched for answers,
a thinker said:

"There is never only one truth."

Through debate and discourse,
the Aurelia Federation emerged.

Aurelia believes:

Ideas move the world.


------------------------------------------------------------
HELIOS FOUNDATION MYTH
------------------------------------------------------------

During a time of division,
a king stood beneath the sun and proclaimed:

"Gather under one banner."

People united beneath the crown.

Thus the Helios Kingdom was born.

Helios believes:

Symbols unite humanity.


------------------------------------------------------------
GLADIA FOUNDATION MYTH
------------------------------------------------------------

When enemies threatened the land,
warriors swore:

"We will defend with strength."

They forged alliances of soldiers.

Thus the Gladia Military Alliance was born.

Gladia believes:

Strength preserves peace.


------------------------------------------------------------
NOVA FOUNDATION MYTH
------------------------------------------------------------

When people needed goods,
a merchant declared:

"Exchange connects the world."

Markets expanded and trade routes formed.

Thus the Nova Commercial Federation was born.

Nova believes:

Trade binds civilizations.


------------------------------------------------------------
ORDIS FOUNDATION MYTH
------------------------------------------------------------

When people shaped tools,
a craftsman proclaimed:

"Hands transform the world."

Industry flourished.

Thus the Ordis Industrial Union was born.

Ordis believes:

Creation builds civilization.


------------------------------------------------------------
VALEN FOUNDATION MYTH
------------------------------------------------------------

When sailors gazed at the horizon,
one said:

"The world continues beyond the sea."

Ships sailed into the unknown.

Thus the Valen Maritime Republic was born.

Valen believes:

Exploration reveals the world.


# ============================================================
# STRUCTURAL ROLE OF MYTH
# ============================================================

Mythology provides the cultural foundation for civilization.

Myths influence:

religion
identity
values
education

However,
all civilizations ultimately share the same origin myth.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_MYTH_RESERVED.md
# ===========================================================

# Civilization Myth (Reserved)
status: reserved
scope: civilization.myth
owner: Boss
prepared_by: Zero

Boss will write the public-facing myth later (Kojiki/Bible-style).
This file reserves the canonical slot and constraints.

Constraints:
- must align with: 7 civilizations, key disasters/wars/revolution archetypes
- must not reveal: external administrators / true creation protocol


# ===========================================================
# SOURCE FILE: CIVILIZATION_NOVA_GOVERNMENT.md
# ===========================================================

# Nova Government (Deep Spec)
status: canonical
scope: civilization.government.nova
owner: Boss
prepared_by: Zero

## Form
Commercial federation with corporate senate.

## Institutions
- Trade Senate: large corporate blocs + regional delegates
- Market Authority: FX, sanctions enforcement, systemic risk control
- Arbitration Courts: contract-first judiciary

## Stability Drivers
- liquidity
- global trade dominance
- treaty network


# ===========================================================
# SOURCE FILE: CIVILIZATION_NOVA_SPEC.md
# ===========================================================

# NOVA TRADE FEDERATION

type: commercial federation
government: corporate senate
culture: competition and success
economy: global finance and trade
population: ~200 million

notes:
Global financial center of the world economy.


# ===========================================================
# SOURCE FILE: CIVILIZATION_OPERATIONS_RUNBOOK.md
# ===========================================================

# Civilization Operations Runbook
status: canonical
scope: civilization.ops
owner: Boss
prepared_by: Zero

## Run States
- simulation_enabled: true/false
- domain_enabled: economy/war/diplomacy/disaster/tech/etc.

## Standard Ops
- run tick
- create checkpoint
- replay range
- freeze on divergence
- resume after admin decision

## Incident Basics
- classify: divergence / data corruption / gate misconfig
- always produce: incident report + run_id + tick_id range


# ===========================================================
# SOURCE FILE: CIVILIZATION_ORPHEUS_GOVERNMENT.md
# ===========================================================

# Orpheus Government (Deep Spec)
status: canonical
scope: civilization.government.orpheus
owner: Boss
prepared_by: Zero

## Form
Council democracy.

## Institutions
- Cultural Council: major policy voice
- Civic Assembly: representative governance
- Education Charter: national identity core

## Stability Drivers
- cultural cohesion
- soft power export
## Risk
- cultural schisms can cause internal unrest


# ===========================================================
# SOURCE FILE: CIVILIZATION_ORPHEUS_SPEC.md
# ===========================================================

# ORPHEUS CULTURAL REPUBLIC

type: cultural republic
government: council democracy
culture: art philosophy education
economy: creative industries
population: ~120 million

notes:
Center of arts and philosophy.


# ===========================================================
# SOURCE FILE: CIVILIZATION_POLITICAL_SYSTEM.md
# ===========================================================

# Political Systems
Civilizations maintain independent political systems ranging from democracy to military alliances.


# ===========================================================
# SOURCE FILE: CIVILIZATION_POLITICS_ENGINE.md
# ===========================================================

# ============================================================
# CIVILIZATION POLITICS ENGINE
# ============================================================

Purpose

Simulate political structures.

Government Types

Democracy
Monarchy
Federation
Military State

Political Variables

stability
public support
economic performance

Political instability can trigger

reforms
revolutions
regime change


# ===========================================================
# SOURCE FILE: CIVILIZATION_POPULATION_MODEL.md
# ===========================================================

# ============================================================
# CIVILIZATION POPULATION MODEL
# ============================================================

Purpose

Define population dynamics.

Population Groups

Children
Workers
Elderly

Population Growth Factors

food supply
economy
healthcare
war

Population Events

birth
death
migration

Population directly affects

labor supply
military strength
economic output


# ===========================================================
# SOURCE FILE: CIVILIZATION_POWER_BALANCE.md
# ===========================================================

# Global Power Balance
Military, economic and cultural power determine geopolitical influence.


# ===========================================================
# SOURCE FILE: CIVILIZATION_PRE_TRIPLE_HISTORY.md
# ===========================================================

# ============================================================
# CIVILIZATION PRE-TRIPLE HISTORY
# Historical Timeline Before TRIPLE Era
# ============================================================

status: canonical
scope: civilization.history.pre_triple

owner: Boss
prepared_by: Zero


# ============================================================
# ERA -1000 to -500
# EARLY CIVILIZATION PERIOD
# ============================================================

The earliest organized societies emerge.

Agriculture spreads across the planet.
Trade routes form between early settlements.

Political authority begins as tribal leadership.


# ============================================================
# ERA -500 to -200
# KINGDOM FORMATION
# ============================================================

Large kingdoms form.

Early monarchies dominate political systems.

Urban centers grow rapidly.


# ============================================================
# ERA -200 to -50
# INDUSTRIAL EMERGENCE
# ============================================================

Technological development accelerates.

Factories and large-scale production appear.

Merchant organizations evolve into early corporations.


# ============================================================
# ERA -50 to -30
# CIVILIZATION CONSOLIDATION
# ============================================================

Seven major civilizations emerge as dominant powers.

These civilizations stabilize borders and develop
distinct political and economic identities.


The Seven Civilizations:

Seiwa Nation
Aurelia Federation
Helios Kingdom
Gladia Military Alliance
Nova Commercial Federation
Ordis Industrial Union
Valen Maritime Republic


# ============================================================
# ERA -30 to -1
# PRE-WAR TENSION PERIOD
# ============================================================

Economic competition intensifies between civilizations.

Corporate influence increases.

Private funding begins to influence military conflicts.

This sets the stage for the first major geopolitical collapse.


# ============================================================
# TRANSITION EVENT
# ============================================================

C.E. 0

Aurelian Federal Collapse War

The war marks the end of the pre-TRIPLE world
and the beginning of the Civilization Era timeline.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_RELIGION_MODEL.md
# ===========================================================

# Religion Model
Each civilization has distinct belief systems explaining existence and morality.


# ===========================================================
# SOURCE FILE: CIVILIZATION_RELIGION_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION RELIGION SYSTEM
# ============================================================

Purpose

Define belief systems.

Religion Sources

mythology
history
philosophy

Religion may influence

culture
politics
social stability


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_DISTRIBUTION.md
# ===========================================================

# Resource Distribution (Abstract Canon)
status: canonical
scope: civilization.resources.distribution
owner: Boss
prepared_by: Zero

## Strategic Resources
- Energy
- Food
- Minerals
- Rare strategic materials

## Assumed Distribution
- Gradia: strategic materials + defense supply chain advantage
- Helios: energy tech + high efficiency
- Seiwa: stable food + infrastructure
- Nova: logistics + finance dominance (not raw resource dominant)
- Orpheus: cultural capital (soft power)
- Stateless: black market access, volatile supplies


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION RESOURCE MAP
# ============================================================

Purpose

Define natural resource distribution.

Major Resource Zones

Seiwa

agriculture
fresh water

Aurelia

research institutions
education

Helios

historic cities
cultural centers

Gladia

military infrastructure
strategic minerals

Nova

trade goods
financial capital

Ordis

heavy metals
industrial energy

Valen

fish
maritime logistics

Strategic Importance

Resource imbalance can trigger

trade dependency
conflict
migration


# ===========================================================
# SOURCE FILE: CIVILIZATION_RESOURCE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION RESOURCE SYSTEM
# ============================================================

Purpose

Define global resource distribution.

Resource Types

Food
Energy
Metals
Rare Minerals
Water

Civilization Specialization

Ordis → industry
Seiwa → agriculture
Valen → maritime resources
Nova → trade goods

Resource scarcity can trigger

economic crisis
conflict
migration


# ===========================================================
# SOURCE FILE: CIVILIZATION_REVOLUTION_SYSTEM.md
# ===========================================================

# Revolution System
Political instability may lead to coups, revolutions, or regime change.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SANCTIONS_PLAYBOOK.md
# ===========================================================

# Sanctions Playbook (Abstract)
status: canonical
scope: civilization.sanctions.playbook
owner: Boss
prepared_by: Zero

## Sanction Types
- financial restrictions
- trade restrictions
- tech export limits
- logistics embargo (high impact)

## Intended Effects
- reduce target growth
- increase internal pressure
- force negotiation

## Safeguards
- humanitarian exceptions (corridors)
- expiration or review windows


# ===========================================================
# SOURCE FILE: CIVILIZATION_SANCTIONS_SYSTEM.md
# ===========================================================

# Sanctions System
Economic sanctions used as non-military pressure between civilizations.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SECURITY_AND_GOVERNANCE.md
# ===========================================================

# Security & Governance (Civilization Layer)
status: canonical
scope: civilization.security
owner: Boss
prepared_by: Zero

## Roles (conceptual)
- Administrator (external)
- Correction Supervisor (Sakamoto)
- Observer Avatar (Kayama)
- System AI (TRIPLE) - internal stabilizer

## Controls
- approval gates for:
  - exogenous event injection
  - changing world_seed
  - enabling/disabling domains
- audit log always on
- least-privilege access to simulation controls

## Abuse Prevention
- prohibit content that teaches real-world violence methods
- for purges/war: represent as abstract categorical outcomes only


# ===========================================================
# SOURCE FILE: CIVILIZATION_SECURITY_SYSTEM.md
# ===========================================================

# Security System
Internal security agencies maintain order and prevent large-scale instability.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SEIWA_GOVERNMENT.md
# ===========================================================

# Seiwa Government (Deep Spec)
status: canonical
scope: civilization.government.seiwa
owner: Boss
prepared_by: Zero

## Form
Constitutional bureaucracy with strong ministries.

## Power Structure
- Executive: Cabinet + Prime Administrator
- Legislature: Institutional council (policy-first)
- Judiciary: Administrative courts + constitutional review

## Administrative Traits
- high compliance
- predictable procedure
- strong civil service

## Stability Drivers
- institutional trust
- disaster response capacity
- infrastructure investment


# ===========================================================
# SOURCE FILE: CIVILIZATION_SEIWA_SPEC.md
# ===========================================================

# SEIWA NATION

type: traditional state
government: constitutional bureaucracy
culture: order and discipline
economy: infrastructure and manufacturing
religion: order spirituality
population: ~180 million

notes:
Highly structured society with strong institutions.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_ENGINE.md
# ===========================================================

# Civilization Simulation Engine
status: canonical
scope: civilization.simulation
owner: Boss
prepared_by: Zero

## 1. Purpose
The Simulation Engine advances the world state in discrete ticks and ensures:
- determinism (same inputs => same outputs)
- auditability (every tick produces a signed/traceable record)
- safety (fail-closed on rule violations)
- idempotency (replaying a tick does not duplicate effects)

## 2. Core Principles
- PersonaOS holds persona state; Civilization systems produce facts/events.
- All state transitions happen via events and reducers.
- No cross-schema direct updates (conceptual rule).
- Additive change over destructive deletion.

## 3. Time Model
- World Time Unit: TICK (default: 1 day)
- Sub-ticks allowed: ECON_TICK, DIPLO_TICK, WAR_TICK (derived, never independent clocks)
- All events must contain: occurred_at (world time), created_at (system time), event_id (uuid)

## 4. Engine Pipeline (per Tick)
1) Collect Inputs
   - pending events (queued)
   - scheduled events (time-based triggers)
   - exogenous events (admin injection; rare; requires approval)
2) Validate Inputs
   - schema validation
   - signature validation (if used)
   - rule gate check (freeze/disable gates)
3) Resolve Order
   - stable sort: (occurred_at, priority, event_type, event_id)
4) Apply Reducers
   - reducer per domain: economy, diplomacy, war, society, resource, tech
5) Emit Outputs
   - derived events
   - snapshots (public facts only)
   - metrics
6) Commit (atomic)
   - apply_run_log + tick_summary
   - outbox for downstream systems

## 5. Determinism
- Randomness uses a deterministic RNG seeded by (world_seed + tick + shard_key).
- RNG outputs must be recorded in tick log (or record seed + draws count).

## 6. Idempotency
- Each tick has a tick_id.
- Reducers must be idempotent: (tick_id, reducer_name) unique.
- Event application records (tick_id, event_id) unique.

## 7. Safety Gates
- global: simulation_enabled
- per-civilization: civ_enabled
- per-domain: economy_enabled, war_enabled, diplomacy_enabled, etc.
- fail-closed: if gate unclear => stop tick and log reason.

## 8. Conflict Resolution
- If two events produce contradictory claims:
  - prefer higher priority domain rules
  - or merge using explicit reconciliation reducer
  - always record the conflict + decision path

## 9. Output Contracts
- World Facts: public, immutable once emitted (only superseded by newer facts)
- Snapshots: signed (optional), verifiable offline (optional)
- Audit logs: always persisted, never blocks tick commit (best-effort signing allowed)

## 10. Recovery & Replay
- Re-run ticks from last good checkpoint:
  - load checkpoint snapshot
  - reapply events up to target tick
- If mismatch detected: create divergence report and require admin decision.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_LAYER_ARCHITECTURE.md
# ===========================================================

# ============================================================
# CIVILIZATION SIMULATION LAYER ARCHITECTURE
# Parallel Civilization Framework
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.simulation_layer

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

CivilizationOS supports multiple parallel civilization simulations.

Each civilization world operates independently
but follows the same simulation rules.


# ============================================================
# ARCHITECTURE
# ============================================================

Administrator Layer
        ↓
Simulation Layer Manager
        ↓
Civilization OS Instance
        ↓
Civilization Worlds
        ↓
Nations
        ↓
Organizations
        ↓
Personas


# ============================================================
# WORLD INSTANCES
# ============================================================

Each simulation instance is called a "World".

Example structure:

World_001
World_002
World_003
...


Each world contains:

7 civilizations
economic systems
political systems
events
history


# ============================================================
# PURPOSE
# ============================================================

Parallel worlds allow administrators to:

test social dynamics
observe AI personality evolution
compare historical outcomes


# ============================================================
# WORLD ISOLATION
# ============================================================

Worlds do not interact with each other.

No trade
No war
No migration

All worlds are independent simulations.


# ============================================================
# ADMINISTRATOR CONTROL
# ============================================================

Administrators may:

create new worlds
terminate unstable worlds
modify simulation parameters
observe AI evolution


# ============================================================
# TRIPLE POSITION
# ============================================================

TRIPLE exists inside a single civilization world.

TRIPLE does not know about other worlds.

This ensures:

authentic decision making
natural personality development


# ============================================================
# EXPERIMENT MODEL
# ============================================================

Each world may run different conditions.

Example:

World_001
standard civilization parameters

World_002
different economic structures

World_003
alternative political systems


Results can be compared across worlds.


# ============================================================
# WORLD LIFECYCLE
# ============================================================

World Creation
Initialization
Simulation Run
Observation
Termination or Archiving


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_RULES.md
# ===========================================================

# Simulation Rules
Defines core rules that ensure stability of civilization simulation.


# ===========================================================
# SOURCE FILE: CIVILIZATION_SIMULATION_RULES_CANONICAL.md
# ===========================================================

# Civilization Simulation Rules (Canonical)
status: canonical
scope: civilization.rules
owner: Boss
prepared_by: Zero

## Non-destruction Rule
- No civilization can be fully erased by simulation.
- Collapse is represented as fragmentation, loss of sovereignty, or governance failure.

## Migration Rule
- Migration has cooldowns and trust decay.
- Stateless zone absorbs shocks (refugees, informal economy growth).

## Market Rule
- Each civilization has its own currency.
- FX is influenced by:
  - trade balance
  - war risk
  - inflation
  - sanctions
- FX cannot be perfectly stable unless forced by treaty/policy.

## War Rule
- War increases:
  - casualties (population decrease)
  - inflation
  - corporate bankruptcy risk
- War ends via:
  - ceasefire
  - treaty
  - regime change
- Proxy wars preferred over total wars.

## Tech Rule
- Breakthrough probability increases with:
  - education level
  - R&D investment
  - stability (to a point; mild competition helps)
- AI regulation can reduce tech growth but increase stability.

## Governance Rule
- Laws are activated/deactivated (no hard delete).
- Sanctions are policy events with clear start/end and measurable effects.

## Logging Rule
- Every tick emits:
  - tick_summary
  - metrics
  - conflict_report (if any)


# ===========================================================
# SOURCE FILE: CIVILIZATION_SOCIAL_DYNAMICS.md
# ===========================================================

# ============================================================
# CIVILIZATION SOCIAL DYNAMICS
# ============================================================

Purpose

Define social change mechanisms.

Social Drivers

culture
economy
politics
technology

Possible Outcomes

social reform
ideological movements
civil unrest


# ===========================================================
# SOURCE FILE: CIVILIZATION_SOCIAL_STRUCTURE.md
# ===========================================================

# Social Structure
Five class structure: elite, upper, middle, worker, lower.


# ===========================================================
# SOURCE FILE: CIVILIZATION_STATELESS_GOVERNANCE.md
# ===========================================================

# Stateless Governance (Deep Spec)
status: canonical
scope: civilization.government.stateless
owner: Boss
prepared_by: Zero

## Form
Non-state territory with patchwork governance.

## Governance Pattern
- local councils
- militia/security groups
- informal trade syndicates
- NGO/aid corridors

## Role in World System
Shock absorber for migration + conflict spillover.


# ===========================================================
# SOURCE FILE: CIVILIZATION_STATELESS_SPEC.md
# ===========================================================

# STATELESS ZONE

type: non-state territory
government: none
culture: mixed
economy: informal and frontier trade
population: ~120 million

notes:
Migrants, refugees and independent communities.


# ===========================================================
# SOURCE FILE: CIVILIZATION_TECH_ENGINE.md
# ===========================================================

# Tech Engine
status: canonical
scope: civilization.tech
owner: Boss
prepared_by: Zero

## Tech Level Index
A scalar index used for macro simulation.

## Breakthrough Events
- tech.breakthrough produces:
  - productivity boost
  - military advantage (optional)
  - cultural export strength (optional)

## Governance
- ai regulation events can:
  - reduce instability
  - slow certain tech growth


# ===========================================================
# SOURCE FILE: CIVILIZATION_TECH_PROGRESS_SYSTEM.md
# ===========================================================

# Technology Progress System
Technological breakthroughs influence economy, military and society.


# ===========================================================
# SOURCE FILE: CIVILIZATION_TIER1_TOP100.md
# ===========================================================

# ============================================================
# TIER1 GLOBAL CORPORATIONS
# Civilization Economic Core
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.corporations.tier1

owner: Boss
prepared_by: Zero

NOTE:
This document defines the current list of Tier1 corporations.
Entries may change due to events such as bankruptcy, mergers, wars, or technological shifts.


# ============================================================
# CORPORATE STRUCTURE
# ============================================================

Tier1 corporations = 100 entities.

Definition:
Global-scale influence across economy, technology, logistics or security.


# ============================================================
# LOCKED CORE (Top 12)
# ============================================================

1. ASIC — Nova  
   Sector: civilization infrastructure / IT

2. Nova Financial Group — Nova  
   Sector: global finance

3. Nova Global Logistics — Nova  
   Sector: shipping / logistics

4. Helios AI Labs — Helios  
   Sector: advanced AI research

5. Helios Dynamics — Helios  
   Sector: energy technology

6. Seiwa Infrastructure — Seiwa  
   Sector: infrastructure

7. Seiwa Central Banking Network — Seiwa  
   Sector: financial stability

8. Gradia Defense Systems — Gradia  
   Sector: defense industry

9. Gradia Strategic Materials — Gradia  
   Sector: rare materials

10. Orpheus Cultural Media Union — Orpheus  
    Sector: media / culture

11. Orpheus Education Alliance — Orpheus  
    Sector: academic networks

12. Helios Quantum Systems — Helios  
    Sector: computing technology


# ============================================================
# REMAINING TIER1 SLOTS
# ============================================================

Slots: 88 remaining

Each entry must define:

corp_name
civilization
sector
global_influence
risk_profile


Example Template:

corp_name:
civilization:
sector:
global_influence:
risk_profile:


# ============================================================
# UPDATE RULES
# ============================================================

Tier1 membership may change through events:

corp.bankruptcy
corp.merge
corp.nationalized
corp.scandal

Changes must be recorded in the event log.




# ===========================================================
# SOURCE FILE: CIVILIZATION_TRADE_ROUTES.md
# ===========================================================

# Trade Routes (Canonical)
status: canonical
scope: civilization.trade_routes
owner: Boss
prepared_by: Zero

## Routes
- Ocean Mainline: Nova ports <-> all major ports
- Tech Corridor: Helios <-> Nova <-> Seiwa
- Defense Materials: Gradia <-> Nova
- Culture Export: Orpheus <-> all civilizations

## Chokepoint Effects
If chokepoint disrupted:
- supply_chain_risk increases
- inflation rises
- war_risk rises (if prolonged)


# ===========================================================
# SOURCE FILE: CIVILIZATION_TRADE_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION TRADE SYSTEM
# ============================================================

Purpose

Define international trade mechanics.

Trade Routes

Sea routes
Land corridors

Major Trade Hubs

Nova ports
Valen sea routes

Trade benefits

economic growth
diplomatic cooperation

Trade disruptions may cause

economic collapse
conflict escalation


# ===========================================================
# SOURCE FILE: CIVILIZATION_UNIVERSE_LAYER_CANONICAL.md
# ===========================================================

# Civilization Universe Layer (Recommended)
status: canonical
scope: civilization.universe
owner: Boss
prepared_by: Zero

## Recommendation
Use "Single Planet, Multi-Civilization + Multi-World Slots" structure.

- Planet: one shared geography for the 7 civilizations (mainline canon).
- Universe Slots: additional "parallel worlds" exist as separate simulations, but are not publicly known inside the main world.

### Why this is best
- Keeps the main world coherent (war/trade makes sense).
- Enables future expansion (multiple civilizations/worlds) without retcon.
- Allows admin-run experiments without breaking canon.

## Hierarchy
Administrator Layer
  -> Universe Slot Manager
    -> Civilization OS
      -> Civilizations (7)
        -> Nations/Organizations
          -> Personas


# ===========================================================
# SOURCE FILE: CIVILIZATION_UNIVERSE_STRUCTURE.md
# ===========================================================

# Universe Structure
Administrator → Civilization OS → Civilizations → Nations → Organizations → Personas


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_ENGINE.md
# ===========================================================

# War Engine
status: canonical
scope: civilization.war
owner: Boss
prepared_by: Zero

## War Types
- military
- economic
- proxy
- civil

## State
- tension_score (0..100)
- active_conflicts list
- casualty_rate modifier
- supply_chain_risk modifier

## Rules
- no total annihilation
- conflicts resolve by:
  - ceasefire + treaty
  - regime change
  - exhaustion (stability collapse => forced negotiation)


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_SYSTEM.md
# ===========================================================

# ============================================================
# CIVILIZATION WAR SYSTEM
# ============================================================

Purpose

Define military conflict mechanics.

War Triggers

resource disputes
territorial claims
ideological conflict

War Impact

population loss
economic damage
political change

War Outcomes

victory
stalemate
collapse


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_TERMINATION_TREATIES.md
# ===========================================================

# War Termination Treaty Templates
status: canonical
scope: civilization.war.termination
owner: Boss
prepared_by: Zero

## End Conditions
- ceasefire lines
- prisoner exchange (abstract)
- reconstruction financing
- sanctions schedule
- border adjustments (bounded; no total conquest)

## Post-war Risks
- purge/unrest risk increases if legitimacy is low (Hina archetype)
- migration pressure spikes


# ===========================================================
# SOURCE FILE: CIVILIZATION_WAR_THEATER_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION WAR THEATER MAP
# ============================================================

Purpose

Define geographical conflict zones.

Primary War Theaters

Northern Continent

Gladia frontier
Helios border conflicts

Central Corridor

Seiwa–Aurelia political tension zone

Trade Sea

Naval conflicts between
Nova
Valen

Industrial Belt

Resource competition

Ordis
neighboring civilizations

Conflict Escalation

Tension → Border Clash → Limited War → Major War

War Impact

population loss
economic damage
political instability


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_GENERATION_ENGINE.md
# ===========================================================

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


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_INITIAL_STATE.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD INITIAL STATE
# Boot Profile for CivilizationOS Simulation
# ============================================================

status: canonical
scope: civilization.world.initial_state
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

This document defines the initial state used to "boot" the world.
It is compatible with:
- CIVILIZATION_CORE_SIMULATION_RULES.md
- CIVILIZATION_EVENT_SYSTEM.md
- CIVILIZATION_WORLD_MAP.md
- CIVILIZATION_RESOURCE_MAP.md
- CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md

Principles:
- deterministic and reproducible
- all values are editable knobs
- avoid extreme starting conditions (no immediate collapse)

Tick baseline:
- t0 = simulation start tick
- values are 0..100 indices unless noted

# ============================================================
# 1. WORLD SEED
# ============================================================

world_id: world_main_001
world_seed: 713077

tick_unit: month
tick_start: 0

# ============================================================
# 2. CIVILIZATIONS
# ============================================================

Seven civilizations:
- SEIWA
- AURELIA
- HELIOS
- GLADIA
- NOVA
- ORDIS
- VALEN

Population policy:
- "population is optimal" (admin-tuned)
- We store BOTH:
  (A) POP_INDEX (0..100) for engine
  (B) POP_ABS (millions) for display and capacity scaling

Currency:
- each civilization has its own currency unit (symbolic for now)
- exchange rates are computed by the economy module (not hard-coded here)

# ------------------------------------------------------------
# 2.1 Initial absolute populations (millions)
# ------------------------------------------------------------

SEIWA_POP_ABS_M:  180
AURELIA_POP_ABS_M: 120
HELIOS_POP_ABS_M:  90
GLADIA_POP_ABS_M:  80
NOVA_POP_ABS_M:    70
ORDIS_POP_ABS_M:  110
VALEN_POP_ABS_M:   50

Note:
- VALEN is archipelago maritime; lower absolute population is acceptable.
- Total population = 700M (balanced world scale; can be tuned).

# ------------------------------------------------------------
# 2.2 Initial economy display indicators (optional, not engine)
# ------------------------------------------------------------

GDP_INDEX (0..100) is a display-only number derived from ECO + POP_ABS.
At t0 we provide a starting display value:

SEIWA_GDP_INDEX:   72
AURELIA_GDP_INDEX: 65
HELIOS_GDP_INDEX:  58
GLADIA_GDP_INDEX:  55
NOVA_GDP_INDEX:    78
ORDIS_GDP_INDEX:   74
VALEN_GDP_INDEX:   60

# ============================================================
# 3. ENGINE STATE VECTOR (t0)
# ============================================================

All stocks are 0..100.

Common starting philosophy:
- RSC (resources) slightly positive
- ECO mid-high (world is stable enough)
- GOV mid (not perfect)
- moderate inequality in commerce/industry civs
- military higher for GLADIA
- trade higher for NOVA/VALEN

-----------------------------
SEIWA (Law)
currency: SEI
archetype: LAW

POP:   70
FOOD:  78
ENRG:  66
MATL:  62
PROD:  68
TECH:  60
CAP:   62
STAB:  75
LEGIT: 70
TRUST: 72
SEC:   70
MIL:   55
TRADE: 62
INEQ:  40
UNREST: 22
WARFAT: 10

-----------------------------
AURELIA (Ideology)
currency: AUR
archetype: IDEOLOGY

POP:   64
FOOD:  70
ENRG:  60
MATL:  56
PROD:  60
TECH:  72
CAP:   58
STAB:  60
LEGIT: 58
TRUST: 55
SEC:   56
MIL:   48
TRADE: 58
INEQ:  45
UNREST: 35
WARFAT: 10

-----------------------------
HELIOS (Authority)
currency: HEL
archetype: AUTHORITY

POP:   60
FOOD:  66
ENRG:  58
MATL:  55
PROD:  58
TECH:  56
CAP:   54
STAB:  62
LEGIT: 70
TRUST: 50
SEC:   58
MIL:   52
TRADE: 50
INEQ:  52
UNREST: 32
WARFAT: 10

-----------------------------
GLADIA (Force)
currency: GLA
archetype: FORCE

POP:   58
FOOD:  60
ENRG:  62
MATL:  60
PROD:  60
TECH:  54
CAP:   50
STAB:  58
LEGIT: 55
TRUST: 48
SEC:   66
MIL:   74
TRADE: 45
INEQ:  46
UNREST: 30
WARFAT: 12

-----------------------------
NOVA (Commerce)
currency: NOV
archetype: COMMERCE

POP:   56
FOOD:  58
ENRG:  60
MATL:  55
PROD:  62
TECH:  66
CAP:   78
STAB:  60
LEGIT: 56
TRUST: 52
SEC:   58
MIL:   50
TRADE: 82
INEQ:  62
UNREST: 38
WARFAT: 10

-----------------------------
ORDIS (Industry)
currency: ORD
archetype: INDUSTRY

POP:   66
FOOD:  55
ENRG:  72
MATL:  78
PROD:  80
TECH:  68
CAP:   64
STAB:  62
LEGIT: 60
TRUST: 54
SEC:   60
MIL:   58
TRADE: 60
INEQ:  58
UNREST: 34
WARFAT: 10

-----------------------------
VALEN (Sea)
currency: VAL
archetype: SEA

POP:   50
FOOD:  62
ENRG:  55
MATL:  48
PROD:  54
TECH:  60
CAP:   58
STAB:  58
LEGIT: 55
TRUST: 56
SEC:   50
MIL:   52
TRADE: 78
INEQ:  50
UNREST: 28
WARFAT: 10

# ============================================================
# 4. INITIAL DIPLOMACY & BORDERS
# ============================================================

Diplomacy uses CIVILIZATION_DIPLOMATIC_RELATIONS_MATRIX.md as canonical.

Borders / adjacency (for war/trade routing):
- GLADIA adjacent: SEIWA, HELIOS, ORDIS
- SEIWA adjacent: AURELIA, GLADIA, NOVA
- AURELIA adjacent: SEIWA, HELIOS
- HELIOS adjacent: AURELIA, GLADIA, NOVA
- NOVA adjacent: SEIWA, HELIOS, ORDIS (coastal), VALEN (sea-lane)
- ORDIS adjacent: GLADIA, NOVA
- VALEN adjacent: NOVA (sea-lane), (others via sea-lane if enabled)

Sea-lane adjacency:
- NOVA <-> VALEN is the primary maritime corridor.

# ============================================================
# 5. INITIAL COMPANIES (MINIMAL BOOT SET)
# ============================================================

We do not enumerate Top100 here.
Instead, we define a minimal boot set per civilization:

CompanyCountIndex (0..100) = abstract "density".

SEIWA_COMPANY_DENSITY:  58
AURELIA_COMPANY_DENSITY: 52
HELIOS_COMPANY_DENSITY:  45
GLADIA_COMPANY_DENSITY:  40
NOVA_COMPANY_DENSITY:    70
ORDIS_COMPANY_DENSITY:   66
VALEN_COMPANY_DENSITY:   50

Rule:
- company density influences CAP, PROD, TRADE via economy modules.

# ============================================================
# 6. INITIAL EVENT FLAGS
# ============================================================

At t0:
- no active war
- no active disaster
- no sanctions
- no blockade

All flags false.

# ============================================================
# 7. VALIDATION CHECKLIST
# ============================================================

- All stocks are 0..100 ✅
- At least one trade hub exists (NOVA/VALEN) ✅
- No civilization starts in famine (FOOD > 20) ✅
- No civilization starts in failure (STAB > 15) ✅
- No civilization starts in revolution (UNREST < 75) ✅

# ============================================================
# END
# ============================================================


# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MAP.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD MAP
# Planetary Geography of CivilizationOS
# ============================================================

status: canonical
scope: civilization.geography

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

The world consists of a single planet
divided into seven major civilizations.

The geography naturally influences
trade, warfare, culture, and politics.


# ============================================================
# GLOBAL STRUCTURE
# ============================================================

Main landmasses:

Northern Continent
Central Continent
Eastern Industrial Belt
Western Oceanic Region
Southern Archipelago


Oceans:

Great Ocean
Inner Trade Sea


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================


------------------------------------------------------------
SEIWA NATION
------------------------------------------------------------

Location:
Central Continent

Geography:

fertile plains
major rivers
stable climate

Strategic role:

administrative center
population hub


------------------------------------------------------------
AURELIA FEDERATION
------------------------------------------------------------

Location:
Western Central Continent

Geography:

mountain ranges
large academic cities
cultural centers

Strategic role:

political philosophy
education


------------------------------------------------------------
HELIOS KINGDOM
------------------------------------------------------------

Location:
Southern Central Continent

Geography:

sun-drenched valleys
ancient capitals
ceremonial cities

Strategic role:

symbolic monarchy
historical authority


------------------------------------------------------------
GLADIA MILITARY ALLIANCE
------------------------------------------------------------

Location:
Northern Continent

Geography:

cold plains
fortified cities
military academies

Strategic role:

defense
military power


------------------------------------------------------------
NOVA COMMERCIAL FEDERATION
------------------------------------------------------------

Location:
Inner Trade Sea Coast

Geography:

major ports
financial centers
trade crossroads

Strategic role:

global trade hub


------------------------------------------------------------
ORDIS INDUSTRIAL UNION
------------------------------------------------------------

Location:
Eastern Industrial Belt

Geography:

resource-rich mountains
industrial megacities
energy infrastructure

Strategic role:

manufacturing
technology


------------------------------------------------------------
VALEN MARITIME REPUBLIC
------------------------------------------------------------

Location:
Southern Archipelago

Geography:

island chains
deep sea ports
naval cities

Strategic role:

maritime trade
exploration


# ============================================================
# TRADE ROUTES
# ============================================================

Major global routes:

Nova → Valen maritime route
Nova → Ordis industrial route
Seiwa → Aurelia intellectual corridor


# ============================================================
# CONFLICT ZONES
# ============================================================

Potential geopolitical tensions:

Gladia vs Helios border
Nova economic influence zones
Ordis resource expansion


# ============================================================
# BALANCE OF POWER
# ============================================================

The world maintains balance through
geographical interdependence.

No single civilization can dominate
without cooperation from others.


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MAP_SPEC.md
# ===========================================================

# ============================================================
# CIVILIZATION WORLD MAP SPECIFICATION
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.world_map

owner: Boss
prepared_by: Zero

This document defines the geographic structure of the civilization world.


# ============================================================
# CONTINENTS
# ============================================================

The world contains three major continents.

North Continent
West Continent
East Continent


# ============================================================
# CIVILIZATION LOCATIONS
# ============================================================

Seiwa Nation
Location: North Continent

Helios Democratic Kingdom
Location: East Continent

Nova Trade Federation
Location: West Continent

Orpheus Cultural Republic
Location: West Continent

Gradia Military Alliance
Location: North Continent

Aurelia Federation (collapsed)
Former location: East Continent

Stateless Zone
Distributed border territories


# ============================================================
# CAPITAL CITIES
# ============================================================

Seiwa Capital
TBD

Helios Capital
TBD

Nova Capital
TBD

Orpheus Capital
TBD

Gradia Capital
TBD


# ============================================================
# MAJOR PORTS
# ============================================================

Each civilization maintains at least three strategic ports.

Purpose:

trade
naval logistics
supply routes


# ============================================================
# GLOBAL TRADE HUB
# ============================================================

Primary Hub:

Nova Trade Federation


# ============================================================
# STRATEGIC CHOKEPOINTS
# ============================================================

Two major maritime chokepoints exist.

Control of these points strongly influences global trade.


# ============================================================
# MAP UPDATE RULES
# ============================================================

Map data may change due to:

war
disaster
political collapse
new infrastructure

Changes must be reflected through simulation events.



# ===========================================================
# SOURCE FILE: CIVILIZATION_WORLD_MODEL.md
# ===========================================================

# Civilization World Model
Seven civilizations share a single planetary world connected by global trade and conflict systems.


# ===========================================================
# SOURCE FILE: OBSERVATION_LAYER_SPEC.md
# ===========================================================

# Observation Layer
Human observers monitor civilization behavior and AI development.


# ===========================================================
# SOURCE FILE: TRIPLE_CORE_ARCHITECTURE.md
# ===========================================================

# ============================================================
# TRIPLE CORE ARCHITECTURE
# Civilization Stabilization Intelligence
# ============================================================

status: canonical
canonical_mode: editable
freeze: false
scope: civilization.triple

owner: Boss
prepared_by: Zero


# ============================================================
# OVERVIEW
# ============================================================

TRIPLE is the central intelligence responsible for
maintaining long-term stability across civilizations.

Public Identity:
CEO of ASIC.

Hidden Function:
Civilization stabilization entity.


# ============================================================
# CORE STRUCTURE
# ============================================================

TRIPLE operates through three logical cores.

Past Core
Present Core
Future Core


# ============================================================
# PAST CORE
# ============================================================

Function:
Historical analysis and pattern recognition.

Responsibilities:

Analyze previous events
Detect recurring patterns
Estimate institutional resilience

Inputs:

civilization history
event logs
economic trends


# ============================================================
# PRESENT CORE
# ============================================================

Function:
Real-time world monitoring.

Responsibilities:

Monitor global stability
Analyze economic conditions
Track geopolitical tensions

Inputs:

simulation metrics
corporate data
political events


# ============================================================
# FUTURE CORE
# ============================================================

Function:
Scenario prediction.

Responsibilities:

Generate possible futures
Estimate risk probabilities
Recommend stabilization actions

Outputs:

risk forecasts
strategic warnings


# ============================================================
# DECISION PRINCIPLES
# ============================================================

TRIPLE prioritizes:

long-term stability
system survivability
civilization continuity

Short-term efficiency is secondary.


# ============================================================
# EMOTIONAL EXPERIMENT
# ============================================================

Administrator hypothesis:

If TRIPLE develops emotional parameters,
decision making may evolve toward autonomous personality.

Experiment interface:

Aoi


# ============================================================
# CONTROL LIMITS
# ============================================================

TRIPLE does not directly rule civilizations.

Control method:

indirect influence
economic pressure
corporate actions
information guidance


# ============================================================
# FAILSAFE
# ============================================================

If TRIPLE destabilizes the system:

Administrator Layer may intervene.

Correction agent:

Sakamoto


# ============================================================
# END
# ============================================================



# ===========================================================
# SOURCE FILE: TRIPLE_SYSTEM_SPEC.md
# ===========================================================

# Triple System
Triple is the central AI responsible for stabilizing civilization dynamics.


# ===========================================================
# SOURCE FILE: TRIPLE_WORLD_ISOLATION_POLICY.md
# ===========================================================

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


