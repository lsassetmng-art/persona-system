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
