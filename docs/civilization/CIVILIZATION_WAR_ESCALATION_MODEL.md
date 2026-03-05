# ============================================================
# CIVILIZATION WAR ESCALATION MODEL
# ============================================================
status: canonical
scope: civilization.simulation.war.escalation
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
戦争・小競り合い・停戦・終戦を「再現可能な抽象モデル」で扱う。
手口や再現性のある暴力描写は一切しない（抽象タグのみ）。

## 1. State (abstract)
- tension_index (0..100)
- active_conflicts: list(conflict_id, phase)
- sanction_pressure
- war_fatigue

## 2. Escalation
- tension rises by: trade disruption, propaganda pressure, incidents, rival blocs
- when tension_index crosses thresholds:
  - 60: BorderConflictEvent (abstract)
  - 80: WarDeclaredEvent (abstract)
  - 95: TotalWarRiskEvent (abstract) => governance gate required

## 3. De-escalation
- war_fatigue rises with duration + losses (abstract)
- if fatigue high and economy deteriorates:
  - CeasefireProposalEvent
  - TreatyEvent (per treaty framework)

## 4. Outputs
- WarPhaseDeltaEvent
- RefugeeFlowEvent
- EconomyShockEvent
