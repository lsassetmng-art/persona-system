# ============================================================
# CIVILIZATION BUSINESS WORLD INTERFACE
# ============================================================
status: canonical
scope: civilization.erp.business.world.interface
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
企業行動が文明経済へ与える影響を「抽象入力」として定義。

## 1. Inputs (examples, abstract)
- production_delta
- logistics_capacity_delta
- employment_delta
- tax_policy_delta
- trade_volume_delta

## 2. Mapping
BusinessEvent -> EconomyDeltaEvent (bounded)
No direct manipulation of world state outside apply engine.
