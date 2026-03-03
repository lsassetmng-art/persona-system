# ==========================================================
# Civilization / Event Signing Design (PersonaOS)
# sign-event Edge 正本
# ==========================================================

status: canonical
scope: PersonaOS (project_ref: ihrukfdlcolygyvccujd)
owner: Boss
prepared_by: Zero

## 0. Goal
イベント連携時の「署名生成」を Edge Function に正規化し、
手動署名（Termux）と完全一致する署名を自動で生成できる状態にする。

## 1. Trust Model
- 署名鍵の **Private Key は Edge 環境変数のみ** に保持（DB禁止）
- DBには Public Key(SPKI base64) と key_id / world / status のみを保持
- Dispatcher は world+key_id で公開鍵を取得して verify（ACTIVE/RETIRED許可、REVOKED拒否）
- sign-event は world の ACTIVE key を選び、その key_id の private key を env から取得して sign

## 2. Canonical Contract (MUST MATCH Dispatcher)
署名対象 canonical は次の envelope を JSON key sort した JSON.stringify 文字列。

envelope:
{
  "schema": <schema_name>,
  "world": <world_key>,
  "event_id": <uuid>,
  "event_type": <text>,
  "event_version": <int>,
  "schema_hash": <text>,
  "user_id": <uuid>,
  "occurred_at": <timestamp/string as provided>,
  "payload": <json>
}

Rules:
- key sort: alphabetic
- payload 内も再帰的に key sort
- occurred_at は文字列一致（Dispatcherの r.occurred_at と同一表現にすること）
- 1文字違いで verify は失敗

## 3. DB Objects
- personaos.world_signing_keys
  - world, key_id, public_key(SPKI b64), status(ACTIVE/RETIRED/REVOKED)
- personaos.sign_log
  - run_id, world, event_id, key_id, canonical_hash, created_at（append-only）
- personaos.get_signing_public_key(p_world,p_key_id) : Dispatcher verify 用
- sign-event は ACTIVE key を world_signing_keys から選ぶ（1件）

## 4. sign-event Edge API
POST /functions/v1/sign-event

Headers:
- x-internal-token: INTERNAL_DISPATCH_TOKEN と一致必須（Fail-Closed）

Body JSON:
{
  "world": "business",
  "schema": "business",
  "event_id": "<uuid>",
  "event_type": "test.dispatch",
  "event_version": 1,
  "schema_hash": "v1",
  "user_id": "<uuid>",
  "occurred_at": "<string>",
  "payload": { ... }
}

Response:
{
  "ok": true,
  "key_id": "<ACTIVE key_id>",
  "canonical_hash": "<sha256 hex>",
  "signature": "<ed25519 signature base64>",
  "canonical": "<canonical string>"
}

## 5. Edge Env
Required:
- INTERNAL_DISPATCH_TOKEN
- PERSONA_SUPABASE_URL
- PERSONA_SERVICE_ROLE_KEY
- SIGNING_PRIVATE_KEYS_JSON   (JSON map: { "<key_id>": "<pkcs8_b64>", ... })

Optional:
- SIGN_EVENT_RETURN_CANONICAL ( "1" to return full canonical ; default "1" )

## 6. Safety
- missing env / auth fail -> 403/500 (Fail-Closed)
- world に ACTIVE key が無い -> 400
- private key が env に無い -> 500
- DB sign_log insert は best-effort ではなく必須（失敗なら 500）
  （監査欠落を許容しない）

## 7. Verification Plan
- Termux 手動署名で生成した canonical を sign-event にも入力し、
  canonical_hash が一致すること
- Dispatcher の verify.trace canonical_hash と一致すること
- signature が Dispatcher verify を通過すること
