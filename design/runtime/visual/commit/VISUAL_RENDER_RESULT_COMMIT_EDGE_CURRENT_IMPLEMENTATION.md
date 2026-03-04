# ============================================================
# VISUAL RENDER RESULT COMMIT EDGE
# PersonaOS Runtime / Visual Layer
# Current Implementation Snapshot
# ============================================================

Layer:
runtime / visual / commit

---

## 1. Purpose

Finalizes a visual_generation_job by:

✔ Verifying PNG SHA-256
✔ Uploading PNG to Storage
✔ Upserting visual_assets record
✔ Marking job as DONE

This is the visual render commit boundary.

---

## 2. Authentication Model

- Authorization: Bearer required
- Uses PERSONA_ANON_KEY + RLS
- user_id derived from JWT
- Job must belong to authenticated user

Fail-Closed on invalid token.

---

## 3. Input (POST JSON)

{
  job_id: string,
  png_base64: string,
  manifest_sha256: string
}

Required:
- job_id
- png_base64
- manifest_sha256

---

## 4. Flow

1️⃣ Method check (POST)
2️⃣ JWT validation
3️⃣ Fetch visual_generation_job (RLS protected)
4️⃣ Base64 decode PNG
5️⃣ SHA-256 verify (integrity check)
6️⃣ Upload to Storage (ServiceRole minimal usage)
7️⃣ Upsert visual_assets
8️⃣ Update job status to DONE
9️⃣ Return storage path

---

## 5. Integrity Model

Client sends:
manifest_sha256

Server recalculates:
SHA-256(png_bytes)

Mismatch → reject.

Guarantees:
No forged PNG commit.

---

## 6. Storage

Bucket:
persona-generated

Path:
{persona_id}/{manifest_sha256}.png

Upsert:
true (idempotent)

---

## 7. Database Tables

Schema:
personaos

Tables:
- visual_generation_jobs
- visual_assets

visual_assets upsert conflict:
(persona_id, job_id)

---

## 8. Security Model

✔ JWT required
✔ RLS enforced
✔ Cannot commit foreign job
✔ ServiceRole used ONLY for Storage upload
✔ Hash verification prevents tampering

---

## 9. Status Transition

visual_generation_jobs:

PENDING → DONE

No intermediate states in current version.

---

## 10. Failure Modes

400:
- Missing job_id
- Missing png_base64
- Missing manifest_sha256
- Invalid base64
- SHA-256 mismatch

401:
- Missing or invalid JWT

404:
- Job not found (or not owned)

500:
- Storage upload error
- visual_assets upsert error
- Unexpected exception

---

## 11. Architectural Position

Visual Flow:

Job Create
→ Compose (manifest generation)
→ Client render
→ Render Commit (THIS LAYER)
→ Optional Snapshot Freeze

---

## 12. Guarantees

✔ Deterministic file naming
✔ Integrity verified
✔ User isolation
✔ Idempotent commit
✔ Storage minimal privilege

---

## 13. Non-Responsibilities

Does NOT:
- Resolve layers
- Generate manifest
- Sign snapshots
- Revoke snapshots
- Modify persona state

Pure render commit boundary.

---

## 14. Future Hardening

- Width/height PNG validation
- PNG signature header check
- Job state machine enforcement
- Immutable storage option
- CDN cache control
- Signed URL distribution layer

---

# END
