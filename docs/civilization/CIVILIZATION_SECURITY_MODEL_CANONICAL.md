# CIVILIZATION SECURITY MODEL

Purpose:
文明OSの信頼境界とセキュリティ基盤を定義する。

------------------------------------------------
Identity Model
------------------------------------------------

All entities identified by:

world_id
system_id
persona_id
service_id

------------------------------------------------
Signature Model
------------------------------------------------

All external events require:

Ed25519 signature

Fields:

event_id
event_type
schema_hash
signature
key_id

------------------------------------------------
Key Lifecycle
------------------------------------------------

Key states:

ACTIVE
ROTATING
REVOKED
EXPIRED

Rotation policy:

90 days recommended

------------------------------------------------
Trust Boundaries
------------------------------------------------

Civilization Core
PersonaOS
ERP Domain
External Apps

Only events cross boundaries.

------------------------------------------------
Tamper Detection
------------------------------------------------

Every event contains:

schema_hash
signature

Invalid events → DEAD queue
