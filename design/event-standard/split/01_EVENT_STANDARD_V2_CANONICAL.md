# EVENT STANDARD v2 - CANONICAL

## Classification

INTERNAL_EVENT  - internal only
WORLD_EVENT     - persona world events
DOMAIN_EVENT    - ERP domain events
INTERFACE_EVENT - cross-OS events (signature required)

---

## Required Fields (All Events)

event_id (uuid)
event_type (UPPER_SNAKE_CASE)
event_version (int >=1)
occurred_at (ISO8601)
payload (JSON object)
schema_hash (sha256 hex lowercase)

---

## INTERFACE_EVENT Additional Fields

source_os
target_os
signature

Signature excludes the 'signature' field itself.
