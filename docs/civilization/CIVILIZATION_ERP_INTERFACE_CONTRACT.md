# ============================================================
# CIVILIZATION ↔ ERP INTERFACE CONTRACT
# Interface events, validation, and invariants
# ============================================================
status: canonical
scope: civilization.erp.interface.contract
owner: Boss
prepared_by: Zero
version: 1.0

Principle:
ERP influences Civilization only through INTERFACE_EVENT.

Required fields (minimum):
- event_id, occurred_at
- event_type, event_version
- payload, schema_hash
- source_os="ERP", target_os="CIVILIZATION"
- signature (required for interface events)
- causality fields (root/cause/depth)

Validation:
- signature verify before accept
- schema_hash must match canonical schema
- unknown version/hash => QUARANTINE

Outputs to ERP:
- acknowledgements (optional)
- derived signals are also events (never direct calls)

