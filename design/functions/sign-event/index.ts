// ==========================================================
// sign-event Edge (PersonaOS) v1.0
// - ACTIVE key selection from personaos.world_signing_keys
// - private key from SIGNING_PRIVATE_KEYS_JSON[key_id] (PKCS8 b64)
// - canonicalize MUST match civ-dispatcher
// - writes personaos.sign_log (required; fail if cannot write)
// ==========================================================

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { canonicalize } from "./canonical.ts";

function nowIso() { return new Date().toISOString(); }

function jlog(level: "INFO"|"WARN"|"ERROR"|"FATAL", stage: string, data: Record<string, unknown>) {
  console.log(JSON.stringify({ ts: nowIso(), service: "sign-event", level, stage, ...data }));
}

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { "Content-Type": "application/json; charset=utf-8" } });
}

function nonEmptyString(x: unknown): x is string {
  return typeof x === "string" && x.trim().length > 0;
}

function b64ToBytes(b64: string): Uint8Array {
  const bin = atob(b64);
  const bytes = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}

function bytesToB64(bytes: Uint8Array): string {
  let bin = "";
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return btoa(bin);
}

async function sha256Hex(message: string): Promise<string> {
  const buf = new TextEncoder().encode(message);
  const hash = await crypto.subtle.digest("SHA-256", buf);
  const bytes = new Uint8Array(hash);
  let out = "";
  for (const b of bytes) out += b.toString(16).padStart(2, "0");
  return out;
}

async function signEd25519(pkcs8B64: string, message: string): Promise<string> {
  const der = b64ToBytes(pkcs8B64);
  const privateKey = await crypto.subtle.importKey("pkcs8", der, { name: "Ed25519" }, false, ["sign"]);
  const data = new TextEncoder().encode(message);
  const sig = await crypto.subtle.sign({ name: "Ed25519" }, privateKey, data);
  return bytesToB64(new Uint8Array(sig));
}

function buildEnvelope(params: {
  schema_name: string;
  world_key: string;
  event_id: string;
  event_type: string;
  event_version: number;
  schema_hash: string;
  user_id: string;
  occurred_at: unknown;
  payload: unknown;
}) {
  // MUST match dispatcher buildSignedEnvelope + canonicalize behavior
  return {
    schema: params.schema_name,
    world: params.world_key,
    event_id: params.event_id,
    event_type: params.event_type,
    event_version: params.event_version,
    schema_hash: params.schema_hash,
    user_id: params.user_id,
    occurred_at: params.occurred_at,
    payload: params.payload ?? {},
  };
}

Deno.serve(async (req) => {
  const run_id = crypto.randomUUID();
  let stage = "init";

  try {
    stage = "env";

    const INTERNAL_TOKEN = Deno.env.get("INTERNAL_DISPATCH_TOKEN") ?? "";
    const SUPABASE_URL = Deno.env.get("PERSONA_SUPABASE_URL") ?? "";
    const SERVICE_ROLE_KEY = Deno.env.get("PERSONA_SERVICE_ROLE_KEY") ?? "";
    const KEYS_JSON = Deno.env.get("SIGNING_PRIVATE_KEYS_JSON") ?? "";
    const RETURN_CANONICAL = (Deno.env.get("SIGN_EVENT_RETURN_CANONICAL") ?? "1") === "1";

    if (!INTERNAL_TOKEN || !SUPABASE_URL || !SERVICE_ROLE_KEY || !KEYS_JSON) {
      jlog("FATAL", stage, { run_id, reason: "missing_env" });
      return json({ ok: false, reason: "missing_env" }, 500);
    }

    stage = "auth";
    if ((req.headers.get("x-internal-token") ?? "") !== INTERNAL_TOKEN) {
      jlog("WARN", stage, { run_id, reason: "forbidden" });
      return new Response("forbidden", { status: 403 });
    }

    stage = "parse";
    const body = await req.json().catch(() => null);
    if (!body) return json({ ok: false, reason: "invalid_json" }, 400);

    const world = String(body.world ?? "").trim();
    const schema = String(body.schema ?? "").trim();
    const event_id = String(body.event_id ?? "").trim();
    const event_type = String(body.event_type ?? "").trim();
    const event_version = Number(body.event_version ?? 1) || 1;
    const schema_hash = String(body.schema_hash ?? "").trim();
    const user_id = String(body.user_id ?? "").trim();
    const occurred_at = body.occurred_at;
    const payload = body.payload ?? {};

    if (
      !nonEmptyString(world) ||
      !nonEmptyString(schema) ||
      !nonEmptyString(event_id) ||
      !nonEmptyString(event_type) ||
      !nonEmptyString(schema_hash) ||
      !nonEmptyString(user_id)
    ) {
      return json({ ok: false, reason: "missing_required" }, 400);
    }

    stage = "supabase_init";
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, { auth: { persistSession: false } });

    // 1) choose ACTIVE key for world
    stage = "key.select_active";
    const { data: keyRow, error: keyErr } = await supabase
      .schema("personaos")
      .from("world_signing_keys")
      .select("key_id,status")
      .eq("world", world)
      .eq("status", "ACTIVE")
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    if (keyErr) {
      jlog("ERROR", stage, { run_id, world, err: keyErr.message });
      return json({ ok: false, reason: "key_select_error" }, 500);
    }

    const key_id = String(keyRow?.key_id ?? "").trim();
    if (!key_id) {
      return json({ ok: false, reason: "no_active_key_for_world" }, 400);
    }

    // 2) load private key from env map
    stage = "key.load_private";
    let keyMap: Record<string, string> = {};
    try {
      keyMap = JSON.parse(KEYS_JSON);
    } catch {
      return json({ ok: false, reason: "invalid_SIGNING_PRIVATE_KEYS_JSON" }, 500);
    }

    const pkcs8B64 = String(keyMap[key_id] ?? "").trim();
    if (!pkcs8B64) {
      jlog("FATAL", stage, { run_id, world, key_id, reason: "private_key_missing_for_key_id" });
      return json({ ok: false, reason: "private_key_missing_for_key_id" }, 500);
    }

    // 3) canonical
    stage = "canonical";
    const envelope = buildEnvelope({
      schema_name: schema,
      world_key: world,
      event_id,
      event_type,
      event_version,
      schema_hash,
      user_id,
      occurred_at,
      payload,
    });

    const canonical = canonicalize(envelope);
    const canonical_hash = await sha256Hex(canonical);

    // 4) sign
    stage = "sign";
    const signature = await signEd25519(pkcs8B64, canonical);

    // 5) audit log (required)
    stage = "audit.insert";
    const { error: logErr } = await supabase
      .schema("personaos")
      .from("sign_log")
      .insert({
        run_id,
        world,
        event_id,
        key_id,
        canonical_hash,
        created_at: nowIso(),
      });

    if (logErr) {
      jlog("FATAL", stage, { run_id, world, event_id, key_id, err: logErr.message });
      return json({ ok: false, reason: "sign_log_insert_failed" }, 500);
    }

    jlog("INFO", "complete", { run_id, world, event_id, key_id, canonical_hash });

    return json({
      ok: true,
      key_id,
      canonical_hash,
      signature,
      canonical: RETURN_CANONICAL ? canonical : undefined,
    }, 200);

  } catch (e: any) {
    jlog("FATAL", stage, { run_id, error: String(e?.message ?? e) });
    return json({ ok: false, reason: "internal_error", stage }, 500);
  }
});
