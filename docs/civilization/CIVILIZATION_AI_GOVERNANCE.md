# ============================================================
# CIVILIZATION AI GOVERNANCE
# ============================================================
status: canonical
scope: civilization.governance.ai
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
文明内AI/役割（Triple等）を「権限ではなくルール」で統制する設計。

## 1. Authority Model
- ultimate authority: human administrator (outside)
- in-civilization: Triple is indirect ruler (event-based)
- observers execute observation tasks assigned by admin

## 2. Constraints
- governance actions are events (signed)
- no silent overrides
- quarantine review requires admin decision

## 3. Audit
- all governance events logged + checkpoint annotation
