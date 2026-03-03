# ============================================================
# CIVILIZATION OS – BEHAVIOR CANONICAL v1.0.0
# Status: CANONICAL
# Phase: Behavior Design Fixed
# Owner: Boss
# ============================================================

This document defines:

- World Responsibility
- Apply Engine Algorithm
- ERP Dependency Matrix
- Runtime Governance Rules
- Determinism & Immutability Principles

Structure Canonical remains superior.
This document fixes runtime behavior only.

============================================================
1. WORLD RESPONSIBILITY CANONICAL
============================================================

1.1 World Nature

Worlds are:
- Stateless
- Deterministic
- Input interpretation layers only

Worlds are NOT:
- State holders
- Core mutators
- Cross-world communicators

Worlds emit WORLD_EVENT only.

------------------------------------------------------------
1.2 Allowed Capabilities
------------------------------------------------------------

World may:
- Interpret external input
- Validate local input format
- Construct event payload
- Suggest weight (optional)

World may NOT:
- Read persona_state directly
- Modify persona_state
- Call another world
- Emit INTERFACE_EVENT
- Persist state

------------------------------------------------------------
1.3 Boundary Rule
------------------------------------------------------------

World Output → Civilization Dispatcher → Core Apply Engine

Meaning interpretation = World
Meaning application = Core

------------------------------------------------------------
1.4 Event Priority
------------------------------------------------------------

No world-level priority override.

Ordering governed by:
1. occurred_at
2. event_id (lexicographic fallback)

============================================================
2. APPLY ENGINE CANONICAL
============================================================

Core is the only state mutator.

Apply Engine MUST be:
- Pure
- Deterministic
- Replay-safe

------------------------------------------------------------
2.1 Apply Pipeline
------------------------------------------------------------

Step 1 – Structural Validation
- schema_hash verification
- version compatibility check
- registry existence check

Step 2 – Signature Validation (INTERFACE_EVENT only)

Step 3 – Routing Resolution

WORLD_EVENT     → Core
INTERFACE_EVENT → Integration → Core
DOMAIN_EVENT    → ERP only (never persona)

Step 4 – Deterministic Apply

new_state = apply(current_state, payload)

Rules:
- No external I/O
- No current time access
- No randomness
- No network
- No global mutable access

Step 5 – Post-Apply
- append audit log
- generate new snapshot
- notify expression-layer

Snapshot is read-only projection.

------------------------------------------------------------
2.2 Immutability
------------------------------------------------------------

persona_state is immutable.

Apply produces:
persona_state_v(n+1)

Previous versions must be reconstructable via event replay.

------------------------------------------------------------
2.3 Replay Guarantee
------------------------------------------------------------

Given identical:
- event sequence
- event ordering
- event payload
- versioned handler

System MUST reproduce identical persona_state.

============================================================
3. ERP DEPENDENCY MATRIX CANONICAL
============================================================

ERP Domains produce DOMAIN_EVENT only.
Cross-domain direct mutation prohibited.

------------------------------------------------------------
3.1 Directional Rules (Examples)
------------------------------------------------------------

Allowed:
sales        → accounting
purchase     → accounting
inventory    → accounting
hr           → finance

Forbidden:
accounting   → sales
finance      → inventory

Accounting is financial truth source.

------------------------------------------------------------
3.2 Domain Isolation
------------------------------------------------------------

Domains cannot:
- Directly mutate another domain
- Access persona
- Emit WORLD_EVENT

------------------------------------------------------------
3.3 Management Layer
------------------------------------------------------------

Management is:
- Read-only
- Projection-only
- Cannot execute commands

============================================================
4. RUNTIME GOVERNANCE
============================================================

------------------------------------------------------------
4.1 Fail-Closed Enforcement
------------------------------------------------------------

Reject on:
- schema mismatch
- version incompatibility
- invalid signature
- unknown event_type

No silent fallback.
No implicit compatibility.

------------------------------------------------------------
4.2 Freeze Protocol
------------------------------------------------------------

Tier 0:
- MAJOR bump required
- New version file
- No overwrite

Tier 1:
- Compatibility documentation required

Tier 2:
- Cannot violate dependency graph

------------------------------------------------------------
4.3 Rollback
------------------------------------------------------------

Rollback via:
- Versioned handler retention
- Compatibility routing

Existing handlers are never overwritten.

============================================================
5. SYSTEM INVARIANTS
============================================================

Must always hold:

- No cross-layer mutation
- No cross-system direct call
- All state changes via event
- Apply engine is pure
- Snapshot is read-only
- Registry matches compatibility table
- Dependency graph respected

Violation = constitutional breach.

============================================================
6. CIVILIZATION BEHAVIOR AXIOMS
============================================================

Structure > Features
Safety > Convenience
Explicit > Implicit
Fail-Closed > Silent Fallback
Determinism > Performance

============================================================
END OF BEHAVIOR CANONICAL v1.0.0
============================================================

