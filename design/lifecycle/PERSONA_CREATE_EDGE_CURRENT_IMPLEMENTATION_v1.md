# ============================================================
# PERSONA CREATE EDGE
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Creates a new Persona.

Supports multiple creation sources:
- LOCAL_UPLOAD
- PRESET_PARTS
- AI_GENERATED
- EXTERNAL_IMPORT

Layer:
lifecycle

---

## 2. Authentication Model

- JWT required (Authorization: Bearer)
- Uses PERSONA_ANON_KEY
- RLS enforced
- user_id derived from JWT (NOT from body)

Fail-closed if:
- Missing Authorization
- Invalid token

---

## 3. Input

POST JSON:

{
  persona_name,
  source_type,
  visual_type,
  character_id?,
  generator?,
  prompt_digest?,
  license_type?,
  license_note?,
  import_manifest?
}

Required:
- persona_name
- source_type

---

## 4. Source Types

Allowed:

- LOCAL_UPLOAD
- PRESET_PARTS
- AI_GENERATED
- EXTERNAL_IMPORT

Validation rules:

AI_GENERATED:
  requires generator

EXTERNAL_IMPORT:
  requires license_type

PRESET_PARTS:
  optional character_id

---

## 5. Database Interactions

Schema:
personaos

Primary insert:
personas

Conditional inserts:
ai_generation_log
external_import_log
persona_character_map

---

## 6. Flow

1. Validate method (POST)
2. Validate Authorization
3. Resolve user_id from JWT
4. Validate input
5. Insert persona
6. Insert logs depending on source_type
7. Optional character mapping
8. Return persona_id

---

## 7. Security Model

- JWT mandatory
- RLS enforced
- user_id not accepted from client
- No service role usage
- Fail-closed design

---

## 8. Failure Modes

401:
- Missing Authorization
- Invalid token

400:
- Missing persona_name
- Invalid source_type
- Missing required fields per source

500:
- Insert failure
- Log insert failure
- Unexpected exception

---

## 9. Architectural Significance

This is the primary Persona lifecycle entrypoint.

It governs:
- Persona creation
- Source classification
- Audit trail initialization
- Character binding

It does NOT:
- Generate assets
- Approve assets
- Trigger visual jobs
- Sign events

---

## 10. Future Hardening

- Rate limiting
- Idempotency key
- TraceId structured logging
- Event emission after creation
- Approval integration

---

# END
