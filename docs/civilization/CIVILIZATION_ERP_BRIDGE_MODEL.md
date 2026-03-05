# ============================================================
# CIVILIZATION ERP BRIDGE MODEL
# ============================================================
status: canonical
scope: civilization.erp.bridge.model
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
ERP（business）と Civilization（world/economy）を event contract で接続する。

## 1. Direction
ERP -> Civilization: INTERFACE_EVENT (signed)
Civilization -> ERP: MarketSignalEvent (optional, signed)

## 2. Safety
- signature verify before accept
- schema_hash required
- causality required
- unknown => QUARANTINE
