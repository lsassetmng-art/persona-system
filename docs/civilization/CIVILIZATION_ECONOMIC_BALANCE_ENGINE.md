# ============================================================
# CIVILIZATION ECONOMIC BALANCE ENGINE
# ============================================================
status: canonical
scope: civilization.simulation.economic.balance.engine
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
経済の「崩壊しない範囲での自然変動」を提供する。
- インフレ、雇用、供給、通貨価値、交易
- 国家別通貨（あなたの確定事項）を前提

## 1. Core Indices (0..100)
- gdp_index
- inflation_index
- employment_index
- supply_stability
- currency_strength (per nation/civ)
- trade_volume

## 2. Weekly Rebalance (economy_tick)
- supply_stability <- resources + logistics + war_penalty
- inflation_index  <- money_supply + supply_stability + shocks
- employment_index <- demand + stability - shocks
- currency_strength <- inflation + trade + trust

## 3. Shock Inputs
- WAR, SANCTION, DISASTER, COUP, PANIC
These arrive as events; engine converts to bounded deltas.

## 4. Outputs
- EconomyDeltaEvent
- MarketSignalEvent (for ERP interface if enabled)
