# ============================================================
# PERSONA CHARACTER BUILD MANIFEST EDGE
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Builds a character render manifest based on:

- character_code
- emotion
- view_code

Used by:
- Persona Visual Runtime
- Mobile rendering layer
- Preview tools

Layer:
asset/character

---

## 2. High-Level Flow

1. Accept POST JSON body:
   {
     character_code,
     emotion,
     view_code
   }

2. Call RPC:
   asset.build_character_manifest(
     p_character_code,
     p_emotion,
     p_view_code
   )

3. Return RPC result as JSON.

---

## 3. Database Layer

Schema:
asset

RPC:
build_character_manifest

Expected behavior of RPC:
- Resolve character layers
- Apply emotion overrides
- Apply view layout
- Build final render manifest
- Return JSON structure

---

## 4. Security Model

- Service role used
- No client DB access
- RPC encapsulates business logic

No validation currently enforced at Edge level.

---

## 5. Observability

Logs:
- Request body
- RPC data
- RPC error
- Unexpected errors

Console logging only (no structured JSON yet).

---

## 6. Failure Modes

500:
- RPC error
- No data returned
- Unexpected exception

No 400 validation currently implemented.

---

## 7. Non-Responsibilities

This Edge does NOT:
- Issue signed URLs
- Validate approval
- Manage storage
- Perform rendering
- Handle animation runtime

It only builds manifest data.

---

## 8. Future Hardening Recommendations

- Add input validation
- Add traceId logging
- Structured logs
- Fail-closed behavior
- Approval gate before manifest build
- Version pinning support

---

# END
