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


