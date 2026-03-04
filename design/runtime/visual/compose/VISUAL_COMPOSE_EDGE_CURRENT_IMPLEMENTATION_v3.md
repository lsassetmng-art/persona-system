# ============================================================
# VISUAL COMPOSE EDGE (PersonaOS)
# Current Implementation Snapshot v3
# ============================================================

Layer:
runtime / visual / compose

---

## 1. Purpose

Generates canonical visual manifest for a Persona.

This layer:

✔ Validates JWT (RLS enforced)
✔ Fetches visual_generation_job
✔ Resolves final layers via DB RPC
✔ Sorts layers by z_index
✔ Builds canonical structure
✔ Generates manifest_sha256
✔ Returns deterministic render contract

This is the visual truth boundary.

---

## 2. Authentication Model

- Authorization: Bearer required
- Uses PERSONA_ANON_KEY
- RLS enforced
- user_id derived from JWT
- Job must belong to authenticated user

Fail-Closed on invalid token.

---

## 3. Input (POST JSON)

{
  job_id
}

Required:
- job_id

---

## 4. Flow

1️⃣ Method check (POST)
2️⃣ JWT validation
3️⃣ Fetch job (RLS)
4️⃣ Resolve layers via RPC:
    resolve_visual_bundle_v3
5️⃣ Normalize numeric fields
6️⃣ Sort layers by z_index
7️⃣ Build canonical object
8️⃣ Compute SHA-256 hex
9️⃣ Return manifest

---

## 5. Canonical Structure (v3)

{
  canonical_version: 3,
  persona_id,
  width,
  height,
  layers: [
    {
      slot_id,
      view_code,
      bucket_name,
      asset_path,
      z_index,
      x,
      y,
      scale,
      rotation,
      alpha,
      blend_mode: "normal"
    }
  ]
}

Layer order:
Ascending by z_index.

---

## 6. Hashing

Algorithm:
SHA-256 (hex lowercase)

Input:
JSON.stringify(canonicalObj)

Output:
manifest_sha256

This hash defines render integrity.

---

## 7. Data Sources

Schema:
personaos

Table:
visual_generation_jobs

RPC:
resolve_visual_bundle_v3

DB is the single source of truth.

---

## 8. Failure Modes

400:
- Missing job_id

401:
- Invalid JWT
- Missing Authorization

404:
- Job not found

500:
- RPC error
- Empty resolution
- Unexpected exception

---

## 9. Security Model

- No service role
- RLS enforced
- Cannot fetch other user's job
- Client cannot inject layers
- All layers resolved from DB

---

## 10. Architectural Position

Visual Flow:

Layer generation
→ visual_generation_jobs
→ resolve_visual_bundle_v3
→ Visual Compose (THIS LAYER)
→ Client render
→ Optional snapshot freeze

This defines visual determinism.

---

## 11. Non-Responsibilities

Does NOT:
- Generate assets
- Sign snapshots
- Issue snapshots
- Revoke snapshots
- Mutate persona state

Pure manifest generation.

---

## 12. Guarantees

✔ Deterministic output
✔ Sorted layer contract
✔ Numeric normalization
✔ Canonical versioning
✔ Hash reproducibility
✔ RLS isolation

---

## 13. Future Hardening

- ETag support
- Optional signed manifest
- Delta-manifest optimization
- Render engine compatibility matrix
- Caching layer

---

# END
