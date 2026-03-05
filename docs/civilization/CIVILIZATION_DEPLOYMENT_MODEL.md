# ============================================================
# CIVILIZATION DEPLOYMENT MODEL
# ============================================================
status: canonical
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS の配置（DB / Edge / Scheduler / Observability）を明確化する。
※実装は別チャットで行う前提。ここでは設計のみ。

------------------------------------------------------------
DEPLOYMENT UNITS
------------------------------------------------------------

A) PostgreSQL (Supabase)
- event store (outbox)
- checkpoint store
- registry tables (event_registry, gate tables)
- audit logs / apply run logs
- RLS + policies

B) Edge Functions (Supabase Edge / Deno)
- dispatcher
- apply engine (world apply)
- persona interface emitters (civilization -> personaos events)
- ERP interface ingest/normalize (optional)
- admin operations endpoints (gated)

C) Scheduler / Trigger
- cron trigger (Supabase scheduled)
- calls dispatcher/tick endpoints
- never mutates state directly

D) Observability
- structured logs (JSON)
- metrics extraction (counts/latency)
- dashboards (queue depth, retries, dead/quarantine, checkpoints)
- incident hooks (notify)

------------------------------------------------------------
REFERENCE DEPLOYMENT (LOGICAL)
------------------------------------------------------------

[ Cron / Scheduler ]
        |
        v
[ Edge: Tick Engine ] --> emits WORLD_EVENT --> [ DB: event_store ]
        |
        v
[ Edge: Dispatcher ] ---- claim/verify -----> [ DB: event_store ]
        |
        v
[ Edge: Apply Engine ] --- mutate state -----> [ DB: world_state + checkpoint ]
        |
        v
[ Snapshot Issuer ] -------------------------> [ DB: snapshot store / signature ]

Observability reads:
- Edge logs
- DB counters (views)
- checkpoint results

------------------------------------------------------------
SECURITY & GATES
------------------------------------------------------------

- runtime_enabled gate (global)
- per-world enabled gate
- admin-only operations require internal token + approval record
- signature verification before apply (mandatory)
- schema_hash mismatch => DEAD (no retry)
- unknown event => QUARANTINE (review)

------------------------------------------------------------
FAILURE MODES (DEPLOYMENT VIEW)
------------------------------------------------------------

1) Edge crash:
- stateless => restart safe
- unprocessed events remain in DB

2) DB partial failure:
- stop runtime (SAFE_STOP)
- preserve evidence
- recover via checkpoints + replay

3) Scheduler duplication:
- coordinator lock prevents double-apply
- idempotent apply ensures safety

------------------------------------------------------------
END
------------------------------------------------------------
