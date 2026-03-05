# ============================================================
# CIVILIZATION ECONOMY MODEL (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Scope:
- 7文明
- 通貨は国家ごとに異なる
- 人口に応じて企業数が決まる
- 文明間で貿易・制裁・戦争が起きる

------------------------------------------------------------
1. ENTITIES
------------------------------------------------------------
- Civilization (sovereign macro)
- Nation / State
- Currency (per nation)
- Company (count scales with population)
- Market (global + local)
- Household (aggregate)
- Treasury (nation budget)

------------------------------------------------------------
2. CURRENCY
------------------------------------------------------------
Each nation has:
- currency_code
- inflation_index
- fx_rates (edges to other currencies)

FX model (abstract):
- fx_rate(A->B) is updated daily by:
  - trade balance
  - sanctions
  - war risk
  - inflation differential

------------------------------------------------------------
3. COMPANY COUNT RULE
------------------------------------------------------------
Given population P:

- micro companies:  P / 2,000
- small companies:  P / 20,000
- mid companies:    P / 200,000
- large companies:  P / 2,000,000

(rounded, bounded by min/max per nation)

------------------------------------------------------------
4. GDP / OUTPUT (ABSTRACT)
------------------------------------------------------------
GDP_t = productivity_index * labor_supply * stability_factor

Where:
- labor_supply = working_population_ratio * P
- stability_factor decreases with war, disasters, sanctions

------------------------------------------------------------
5. TRADE
------------------------------------------------------------
Trade routes are weighted edges:
- resource complementarity
- treaty status
- war risk
- transport friction

Trade volume update:
- increases if treaties + stability
- decreases if sanctions + war

------------------------------------------------------------
6. SANCTIONS
------------------------------------------------------------
Sanctions reduce:
- trade volume
- fx stability
- productivity (import constraints)

Sanctions escalation is policy-driven or event-driven.

------------------------------------------------------------
7. OUTPUT EVENTS
------------------------------------------------------------
Economy engine outputs WORLD_EVENT:
- economy.price_index_updated
- economy.fx_updated
- economy.trade_volume_updated
- economy.company_birth_death
- economy.treasury_stress
- economy.market_signal (to ERP optional)

------------------------------------------------------------
END
------------------------------------------------------------
