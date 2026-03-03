// ==========================================================
// Civilization Event Dispatcher v3.1
// - business / life / governance 3world
// - occurred_at対応
// - dispatch_status: PENDING -> INFLIGHT -> DONE/DEAD
// ==========================================================
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

type WorldDef = {
  name: string;
  schema: string;
  claimRpc: string;
  table: string;
};

const WORLDS: WorldDef[] = [
  { name: "business",   schema: "business",   claimRpc: "business_claim_event_outbox",   table: "event_outbox" },
  { name: "life",       schema: "life",       claimRpc: "life_claim_event_outbox",       table: "life_event_outbox" },
  { name: "governance", schema: "governance", claimRpc: "governance_claim_event_outbox", table: "governance_event_outbox" },
];

const MAX_RETRY = 5;

Deno.serve(async (req) => {
  try {
    const INTERNAL_TOKEN   = Deno.env.get("INTERNAL_DISPATCH_TOKEN");
    const SUPABASE_URL     = Deno.env.get("PERSONA_SUPABASE_URL");
    const SERVICE_ROLE_KEY = Deno.env.get("PERSONA_SERVICE_ROLE_KEY");
    const PERSONA_APPLY_URL= Deno.env.get("PERSONA_APPLY_URL");

    if (!INTERNAL_TOKEN || !SUPABASE_URL || !SERVICE_ROLE_KEY || !PERSONA_APPLY_URL) {
      return new Response("Missing env", { status: 500 });
    }
    if (req.headers.get("x-internal-token") !== INTERNAL_TOKEN) {
      return new Response("forbidden", { status: 403 });
    }

    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, { auth: { persistSession: false } });

    let claimed = 0, processed = 0, failed = 0;

    for (const w of WORLDS) {
      const { data: rows, error } = await supabase.rpc(w.claimRpc, { p_batch: 25 });
      if (error) {
        console.error("claim error", w.name, error);
        continue;
      }
      claimed += rows?.length ?? 0;

      for (const r of rows ?? []) {
        try {
          const resp = await fetch(PERSONA_APPLY_URL, {
            method: "POST",
            headers: { "content-type": "application/json", "x-internal-token": INTERNAL_TOKEN },
            body: JSON.stringify({
              world: w.name,
              event_id: r.event_id,
              event_type: r.event_type,
              user_id: r.user_id,
              payload: r.payload ?? {},
              occurred_at: r.occurred_at ?? new Date().toISOString(),
            }),
          });

          const text = await resp.text();

          if (resp.ok || resp.status === 409) {
            await supabase.schema(w.schema).from(w.table).update({
              dispatch_status: "DONE",
              dispatched_at: new Date().toISOString(),
              last_dispatch_error: null,
            }).eq("event_id", r.event_id);
            processed++;
          } else {
            throw new Error(`persona_apply failed: ${resp.status} ${text}`);
          }
        } catch (e: any) {
          const attempts = Number(r.dispatch_attempts ?? 0);

          if (attempts >= MAX_RETRY) {
            await supabase.schema(w.schema).from(w.table).update({
              dispatch_status: "DEAD",
              last_dispatch_error: e?.message ?? "unknown",
            }).eq("event_id", r.event_id);
          } else {
            await supabase.schema(w.schema).from(w.table).update({
              dispatch_status: "PENDING",
              last_dispatch_error: e?.message ?? "unknown",
            }).eq("event_id", r.event_id);
          }
          failed++;
        }
      }
    }

    return new Response(JSON.stringify({ ok: true, claimed, processed, failed }), { status: 200 });
  } catch (err: any) {
    return new Response(JSON.stringify({ stage: "outer", message: err?.message ?? null }), { status: 500 });
  }
});
