# ============================================================
# PERSONA AI PART GENERATION EDGE
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

AI-driven generation of character part assets.

Pipeline:

1. Validate scope
2. Resolve persona → character
3. Resolve slot
4. Call AI engine
5. Register asset.layer
6. Write AI audit log
7. Apply private override (if applicable)
8. Create approval request (if GLOBAL_SHARED)
9. Create visual generation job
10. Optional auto compose trigger

Layer:
asset/generation

---

## 2. Input

POST JSON:

{
  persona_id,
  part_type,
  style_id,
  asset_scope = "PERSONA_PRIVATE",
  auto_compose = true
}

Required:
- persona_id
- part_type
- style_id

---

## 3. Scope Model

asset_scope values:

- PERSONA_PRIVATE
- GLOBAL_SHARED

Validated via:
asset.asset_scope_master

If GLOBAL_SHARED and requires_approval = true:
→ approval_request created

---

## 4. Database Interactions

Schemas used:

asset:
- asset_scope_master
- character_slots
- layer

personaos:
- persona_character_map
- ai_generation_log
- persona_part_overrides
- visual_generation_jobs

business:
- approval_request (GLOBAL_SHARED only)

---

## 5. Generation Flow

### Step 1 — Scope validation
Verify asset_scope exists.

### Step 2 — Persona mapping
persona_id → character_id

### Step 3 — Slot lookup
character_id + part_type

### Step 4 — AI call
callAI(style_id, part_type)

Returns generatedImageUrl.

### Step 5 — Register layer
Insert into asset.layer

### Step 6 — Audit log
personaos.ai_generation_log

### Step 7 — Private override
persona_part_overrides (if private)

### Step 8 — Approval (if global shared)
business.approval_request

### Step 9 — Visual job
personaos.visual_generation_jobs

### Step 10 — Auto compose
Internal call to visual-compose

---

## 6. Security Model

- Service role execution
- Scope validation enforced
- Approval required for GLOBAL_SHARED
- AI generation audited

No user-level auth validation currently implemented.

---

## 7. Failure Modes

400:
- Missing required fields

500:
- Invalid scope
- Persona mapping not found
- Slot not defined
- DB errors
- Unexpected error

---

## 8. Observability

Current:
- No structured traceId
- No latency measurement
- Console logging minimal

Recommended:
- Add traceId
- Structured logs
- Fail-closed enforcement
- Approval isolation
- Rate limiting

---

## 9. Architectural Significance

This Edge represents:

Persona AI Generation Orchestrator

It bridges:
AI → Asset Layer → Approval → Visual Pipeline

High-risk, high-impact component.

---

## 10. Future Hardening

- Ownership validation
- Rate limiting
- AI call abstraction
- Separate approval to Civilization layer
- Event emission for generation
- Structured logging

---

# END
