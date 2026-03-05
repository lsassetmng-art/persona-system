# ============================================================
# CIVILIZATION COLLAPSE MODEL
# ============================================================
status: canonical
scope: civilization.simulation.collapse.model
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
文明崩壊（国家機能停止・連邦分裂・無政府化）を抽象モデルとして定義。

## 1. Collapse Indicators (0..100)
- legitimacy
- public_trust
- institutional_capacity
- economic_stability
- security_stability

## 2. Trigger Logic
CollapseRisk = f( trust↓, capacity↓, economy↓, war↑, disaster↑ )
Threshold:
- risk >= 85 => CollapseImminentEvent (QUARANTINE by default)
- governance allowlist + admin decision may convert to CollapseEvent

## 3. Outcomes
- FederationSplitEvent
- StatelessTransitionEvent
- MigrationSurgeEvent
- CurrencyResetEvent (nation-credit session rule respected)

## 4. Safety
- Always reversible only by new events (no silent rewrite)
- All collapse outcomes must checkpoint with annotation
