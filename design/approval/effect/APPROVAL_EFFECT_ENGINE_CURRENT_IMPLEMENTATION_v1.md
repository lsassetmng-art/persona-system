# ============================================================
# APPROVAL EFFECT ENGINE
# Current Implementation Snapshot
# ============================================================

Layer:
approval / effect

---

## 1. Purpose

Executes side-effects after an approval request is approved.

This layer performs actual state mutation based on:

request.request_type

---

## 2. Supported Request Types (Current)

### PUBLISH_ASSET_LAYER

Action:
asset.layer.is_active = true

Schema:
asset

Table:
layer

Key:
layer_id = request.reference_id

---

### PUBLISH_PERSONA_PROFILE

Action:
personaos.personas.is_public = true

Schema:
personaos

Table:
personas

Key:
persona_id = request.reference_id

---

## 3. Execution Model

Switch-case based routing:

switch(request.request_type)

Each request type:
- Maps to schema
- Maps to table
- Performs update

No dynamic SQL.
Explicit routing only.

---

## 4. Security Model

- Must be called from approval decision layer
- Service Role execution expected
- No public exposure
- No client invocation

---

## 5. Architectural Role

Approval Flow:

Create
→ Review
→ Decide
→ Effect Engine (THIS LAYER)
→ Event Emit (optional future)

This is the boundary where:

"Intent" becomes "State Mutation"

---

## 6. Fail Behavior

Currently:
- No explicit error handling per case
- Assumes update success

Future hardening:
- Check affected row count
- Fail-closed on 0 rows
- Emit audit event
- Wrap in transaction

---

## 7. Non-Responsibilities

This layer does NOT:

- Validate approval status
- Change approval_request table
- Emit persona growth
- Trigger dispatcher

It only performs final mutation.

---

## 8. Future Extensions

Planned request types:

- PUBLISH_BACKGROUND
- PUBLISH_CHARACTER
- DELETE_LAYER
- FREEZE_PERSONA
- GLOBAL_ASSET_PROMOTION
- POLICY_UPDATE

Each must be explicitly added.

No dynamic execution allowed.

---

## 9. Design Philosophy

Explicit routing > dynamic mapping.

Approval effects must be:
- Deterministic
- Traceable
- Limited in scope
- Auditable

---

# END
