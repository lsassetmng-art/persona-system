# ============================================================
# PERSONA BACKGROUND GET SIGNED URLS EDGE
# Current Implementation Snapshot
# ============================================================

## 1. Purpose

Generates short-lived signed URLs for Persona background assets.

Used by:
- Mobile clients
- Persona visual runtime
- Background rendering system

Layer:
asset/background

---

## 2. High-Level Flow

1. Accept POST body:
   {
     background_code
   }

2. Load manifest from storage:
   bucket: asset-background
   path: <background_code>/manifest.json

3. Parse manifest:
   {
     version,
     files: {
       key: filename
     }
   }

4. For each file:
   - Generate signed URL (5 minutes)
   - Collect into map

5. Return:
   {
     traceId,
     background_code,
     version,
     signed_urls
   }

---

## 3. Storage Model

Bucket:
asset-background

Structure:
<background_code>/
  manifest.json
  file1.png
  file2.png
  ...

Manifest controls:
- file listing
- versioning

---

## 4. Security Model

- Service role used
- Client does NOT receive storage key
- Signed URLs expire in 5 minutes
- Manifest required

No public listing allowed.

---

## 5. Observability

Logs include:
- traceId
- manifest load
- file signing
- success/failure
- unexpected error

---

## 6. Failure Modes

400:
- missing background_code

500:
- manifest download failed
- signed url creation failed
- unexpected error

---

## 7. Non-Responsibilities

This endpoint does NOT:
- Upload backgrounds
- Validate approval state
- Check persona ownership
- Manage CDN caching
- Rotate assets

It only issues signed URLs.

---

## 8. Future Considerations

- Approval gate before issuing URLs
- Version pinning enforcement
- CDN layer
- Cache-control headers
- Access token validation

---

# END
