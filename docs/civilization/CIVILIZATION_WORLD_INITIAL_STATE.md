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
