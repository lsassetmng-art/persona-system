# ERP ↔ PERSONA INTEGRATION SPEC

## Boundary Principle

ERP → event-bridge → Persona integration → civilization → core

No direct mutation allowed.

## Required INTERFACE_EVENT Fields

event_id
event_type
event_version
occurred_at
payload
schema_hash
source_os
target_os
signature

Signature must include canonical JSON of all above except 'signature'.
