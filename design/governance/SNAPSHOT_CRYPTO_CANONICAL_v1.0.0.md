# ============================================================
# CIVILIZATION OS – SNAPSHOT & CRYPTO GOVERNANCE CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Public Representation & Cryptographic Authority
# Owner: Boss
# ============================================================

This document defines:

- Snapshot structure
- Public exposure rules
- Cryptographic signature governance
- Key rotation protocol
- Tamper detection guarantees

============================================================
1. SNAPSHOT PRINCIPLE
============================================================

Snapshot is:

- Read-only
- Deterministic
- Derived from persona_state
- Public-safe projection

Snapshot NEVER mutates core state.

============================================================
2. SNAPSHOT STRUCTURE
============================================================

Snapshot contains:

- persona_id
- level
- axis (public subset)
- emotion (optional subset)
- growth_summary
- version
- snapshot_hash
- signature

Private internal fields MUST NOT be included.

============================================================
3. SNAPSHOT HASH RULE
============================================================

snapshot_hash = sha256(canonical_json(snapshot_without_signature))

Canonical JSON rules:
- UTF-8
- sorted keys
- no whitespace
- deterministic number formatting

============================================================
4. SNAPSHOT SIGNATURE
============================================================

signature = sign(snapshot_hash, private_key)

Signature excludes signature field itself.

Verification:

verify(signature, snapshot_hash, public_key) == true

Invalid signature → reject.

============================================================
5. KEY GOVERNANCE
============================================================

Two key tiers:

Tier A – System Root Key
- Signs integration events
- Signs snapshot keys
- Offline storage recommended

Tier B – Snapshot Signing Key
- Signs snapshot_hash
- Rotatable without system reset

Private keys must never be exposed.

============================================================
6. KEY ROTATION PROTOCOL
============================================================

Rotation requires:

- New key generation
- New public key publication
- Version increment
- Signature of new public key by Root Key

Old snapshots remain verifiable.

No overwrite of historical keys.

============================================================
7. PUBLIC EXPOSURE RULES
============================================================

Snapshot may be exposed via:

- API
- Export file
- NFT-style record
- Streaming overlay

But must:

- Include version
- Include signature
- Include hash

Unsigned snapshot = invalid.

============================================================
8. TAMPER DETECTION GUARANTEE
============================================================

If snapshot content changes:

snapshot_hash changes
signature invalidates

Tampered snapshot must fail verification.

============================================================
9. SYSTEM INVARIANTS
============================================================

- Snapshot is projection only
- Core state cannot be reconstructed from snapshot
- Private keys never logged
- All public artifacts signed
- Signature verification deterministic

Violation = constitutional breach.

============================================================
END OF SNAPSHOT & CRYPTO CANONICAL v1.0.0
============================================================

