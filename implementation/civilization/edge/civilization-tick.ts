// ==========================================================
// Civilization Tick v1.0
// - governance.civilization_tick() を service_role で実行するだけ
// - cron想定（Supabase Scheduled Functions / 外部cron）
// ==========================================================
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

Deno.serve(async (req) => {
  try {
    const INTERNAL_TOKEN   = Deno.env.get("INTERNAL_DISPATCH_TOKEN");
    const SUPABASE_URL     = Deno.env.get("PERSONA_SUPABASE_URL");
    const SERVICE_ROLE_KEY = Deno.env.get("PERSONA_SERVICE_ROLE_KEY");

    if (!INTERNAL_TOKEN || !SUPABASE_URL || !SERVICE_ROLE_KEY) {
      return new Response("Missing env", { status: 500 });
    }
    if (req.headers.get("x-internal-token") !== INTERNAL_TOKEN) {
      return new Response("forbidden", { status: 403 });
    }

    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, { auth: { persistSession: false } });

    const { data, error } = await supabase.rpc("civilization_tick", {});
    if (error) {
      return new Response(JSON.stringify({ ok:false, stage:"rpc", error:error.message }), { status: 500 });
    }
    return new Response(JSON.stringify({ ok:true, data }), { status: 200 });
  } catch (err: any) {
    return new Response(JSON.stringify({ ok:false, stage:"outer", message: err?.message ?? null }), { status: 500 });
  }
});
