# ============================================================
# Civilization OS
# Security Architecture Overview
# Status: CANONICAL INDEX
# ============================================================

This directory defines the cryptographic trust boundary
for Civilization OS.

All event integrity, authenticity, and trust guarantees
are rooted here.

------------------------------------------------------------
# 1. Security Model
------------------------------------------------------------

Trust Authority:
  WORLD

Signing Authority:
  WORLD ACTIVE KEY

Verification Authority:
  civ-dispatcher

Integrity Priority:
  Integrity > Availability

REVOKED keys invalidate all signatures (past included).

------------------------------------------------------------
# 2. Documents in This Chapter
------------------------------------------------------------

1) signing-and-rotation-spec-v1.0.md
   - Canonical envelope definition
   - Key lifecycle model
   - Rotation rules
   - DB constraints
   - Cache behavior

2) dispatcher-verification-spec-v1.0.md
   - Verification pipeline
   - Key resolution contract
   - Failure modes
   - Observability requirements

3) key-rotation-runbook-v1.0.md
   - Operational procedure
   - GO/STOP flow
   - Emergency revoke
   - Rollback plan

------------------------------------------------------------
# 3. Trust Boundary Diagram
------------------------------------------------------------

User
  ↓
World Event Creation
  ↓
sign-event Edge (Ed25519 sign)
  ↓
event_outbox
  ↓
civ-dispatcher
  ↓
Ed25519 verify
  ↓
Persona Apply

------------------------------------------------------------
# 4. Key Principles
------------------------------------------------------------

✔ Public keys immutable
✔ Exactly one ACTIVE per world
✔ RETIRED keys verifiable (≥ 90 days)
✔ REVOKED keys rejected
✔ Canonical JSON deterministic
✔ ISO8601 (.000Z) normalization mandatory
✔ Cache is performance only (DB is truth)

------------------------------------------------------------
# 5. Threat Model Summary
------------------------------------------------------------

Compromise scenario:
  - Private key leak
  - Immediate REVOKE
  - Rotate
  - Integrity preserved

Tampering scenario:
  - Canonical mismatch
  - Verification fails
  - Event marked DEAD

System bias:
  Fail-closed.

------------------------------------------------------------
# 6. Change Policy
------------------------------------------------------------

Any change to:

- Envelope format
- Key lifecycle rules
- Verification acceptance rules
- Canonicalization algorithm

REQUIRES:
  - Spec version bump
  - Dispatcher version bump
  - sign-event version bump

Security documents are frozen per version.

------------------------------------------------------------
# END
------------------------------------------------------------
