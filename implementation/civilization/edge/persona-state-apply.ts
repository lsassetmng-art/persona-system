// ==========================================================
// Persona State Apply - Civilization v3.1
// - world統一
// - personaos.event_registry(axis_deltas) → apply_event_engine
// - 冪等: growth_events event_id unique前提（selectで先判定）
// ==========================================================
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

Deno.serve(async (req) => {
  try {
    const INTERNAL_TOKEN   = Deno.env.get("INTERNAL_DISPATCH_TOKEN");
    const SUPABASE_URL     = Deno.env.get("PERSONA_SUPABASE_URL");
    const SERVICE_ROLE_KEY = Deno.env.get("PERSONA_SERVICE_ROLE_KEY");
    const SNAPSHOT_URL     = Deno.env.get("SNAPSHOT_ISSUE_URL");

    if (!INTERNAL_TOKEN || !SUPABASE_URL || !SERVICE_ROLE_KEY || !SNAPSHOT_URL) {
      return new Response("Missing env", { status: 500 });
    }
    if (req.headers.get("x-internal-token") !== INTERNAL_TOKEN) {
      return new Response("forbidden", { status: 403 });
    }

    const body = await req.json().catch(() => ({}));
    const world      = String(body.world ?? "");
    const event_id   = body.event_id;
    const event_type = String(body.event_type ?? "");
    const user_id    = body.user_id;
    const payload    = body.payload ?? {};
    const occurred_at= body.occurred_at ?? new Date().toISOString();

    if (!event_id || !event_type || !user_id) {
      return new Response("invalid payload", { status: 400 });
    }

    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, { auth: { persistSession: false } });

    // 1) 冪等（growth_eventsに既に同event_idがあれば 409）
    const { data: existing, error: existErr } = await supabase
      .schema("personaos")
      .from("growth_events")
      .select("event_id")
      .eq("event_id", event_id)
      .limit(1);

    if (existErr) {
      return new Response(JSON.stringify({ stage: "idempotency_select", error: existErr.message }), { status: 500 });
    }
    if (existing && existing.length > 0) {
      return new Response("duplicate", { status: 409 });
    }

    // 2) event_registry（axis_deltas）
    const { data: rule, error: ruleErr } = await supabase
      .schema("personaos")
      .from("event_registry")
      .select("axis_deltas,is_enabled")
      .eq("event_type", event_type)
      .eq("is_enabled", true)
      .limit(1)
      .single();

    if (ruleErr || !rule) {
      return new Response("event not enabled", { status: 400 });
    }

    // 3) persona取得（ユーザーの最初のpersona）
    const { data: persona, error: personaErr } = await supabase
      .schema("personaos")
      .from("personas")
      .select("persona_id")
      .eq("user_id", user_id)
      .limit(1)
      .single();

    if (personaErr || !persona) {
      return new Response("persona not found", { status: 404 });
    }
    const persona_id = persona.persona_id;

    // 4) growth_events 記録（processed=trueで即反映扱い）
    const { error: insErr } = await supabase
      .schema("personaos")
      .from("growth_events")
      .insert({
        event_id,
        user_id,
        persona_id,
        app_namespace: world || "unknown",
        event_type,
        magnitude: 1,
        context: payload ?? {},
        occurred_at,
        received_at: new Date().toISOString(),
        is_processed: true,
        processed_at: new Date().toISOString(),
      });

    if (insErr) {
      return new Response(JSON.stringify({ stage: "growth_events_insert", error: insErr.message }), { status: 500 });
    }

    // 5) apply_event_engine 実行
    const { error: engineErr } = await supabase
      .schema("personaos")
      .rpc("apply_event_engine", {
        p_user_id: user_id,
        p_persona_id: persona_id,
        p_event_id: event_id,
        p_event_type: event_type,
        p_axis_deltas: rule.axis_deltas ?? {},
        p_occurred_at: occurred_at,
        p_context: payload ?? {},
      });

    if (engineErr) {
      return new Response(JSON.stringify({ stage: "apply_event_engine", error: engineErr.message }), { status: 500 });
    }

    // 6) snapshot再発行（失敗しても文明は止めない）
    try {
      await fetch(SNAPSHOT_URL, {
        method: "POST",
        headers: { "content-type": "application/json", "x-internal-token": INTERNAL_TOKEN },
        body: JSON.stringify({ user_id, persona_id }),
      });
    } catch (_) {}

    // 7) apply_run_log
    await supabase.schema("personaos").from("apply_run_log").insert({
      event_id,
      event_type,
      mode: world || "unknown",
      ok: true,
      http_status: 200,
      created_at: new Date().toISOString(),
    });

    return new Response(JSON.stringify({ ok: true }), { status: 200 });
  } catch (err: any) {
    return new Response(JSON.stringify({ stage: "outer", message: err?.message ?? null }), { status: 500 });
  }
});
