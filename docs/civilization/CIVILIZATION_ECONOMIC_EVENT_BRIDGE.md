# ============================================================
# CIVILIZATION ECONOMIC EVENT BRIDGE
# ============================================================
status: canonical
scope: civilization.erp.economic.event.bridge
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
ERP events を civilization 経済イベントへ正規化する。

## 1. Normalization
- currency_code per nation
- amounts normalized to index deltas (0..100 scale)
- avoid leaking proprietary detail; use abstract indicators

## 2. Output
- EconomyInputEvent (to dispatcher)
- optional AuditEvent for governance
