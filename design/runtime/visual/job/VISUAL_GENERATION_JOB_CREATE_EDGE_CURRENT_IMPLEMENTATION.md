# ============================================================
# VISUAL GENERATION JOB CREATE EDGE
# PersonaOS Runtime / Visual Layer
# Current Implementation Snapshot
# ============================================================

Layer:
runtime / visual / job

---

## 1. Purpose

Creates a visual_generation_job record for a Persona.

This Edge:

✔ Requires JWT (Authorization Bearer)
✔ Uses ANON key + RLS
✔ Validates persona ownership
✔ Inserts PENDING job
✔ Returns job_id

This is the render request entrypoint.

---

## 2. Authentication Model

- Authorization: Bearer required
- Uses PERSONA_ANON_KEY
- RLS enforced
- user_id derived from JWT
- Cannot create job for other user's persona

Fail-Closed on invalid token.

---

## 3. Input (POST JSON)

{
  persona_id: string,
  width?: number (default 512),
  height?: number (default 512)
}

Required:
- persona_id

---

## 4. Flow

1️⃣ Method check (POST)
2️⃣ JWT validation
3️⃣ Extract user_id from token
4️⃣ Validate persona exists (RLS protected)
5️⃣ Insert visual_generation_job
6️⃣ Return job metadata

---

## 5. Database Tables

Schema:
personaos

Tables:
- personas
- visual_generation_jobs

---

## 6. Inserted Record Structure

{
  persona_id,
  user_id,
  width,
  height,
  status: "PENDING",
  created_at,
  updated_at
}

Status lifecycle:
PENDING → RESOLVED → (optional) SNAPSHOT

---

## 7. Security Model

✔ No service role
✔ RLS enforced
✔ Cannot insert job for foreign persona
✔ user_id derived from JWT (not body)

---

## 8. Failure Modes

400:
- Missing persona_id

401:
- Missing or invalid JWT

404:
- Persona not found (or not owned by user)

500:
- Job insert failure
- Unexpected exception

---

## 9. Architectural Position

Visual Flow:

Client
→ Visual Job Create (THIS LAYER)
→ visual_generation_jobs
→ Visual Compose
→ Render
→ Optional Snapshot

---

## 10. Guarantees

✔ User isolation
✔ Deterministic job creation
✔ No cross-user leakage
✔ Clean runtime boundary

---

## 11. Non-Responsibilities

Does NOT:
- Resolve layers
- Compose manifest
- Generate assets
- Sign snapshots
- Mutate persona state

Pure job enqueue layer.

---

## 12. Future Hardening

- Rate limiting
- Width/height bounds enforcement
- Job deduplication
- Expiration policy
- Status transition control

---

# END
