# 45 Audit Evidence and Non-repudiation（監査/否認防止 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI Actorの行為を「誰が/何を/なぜ/どの権限で」行ったか
後から確実に再構成でき、否認できない状態にする。

---

# 1. 最低限の証跡（必須）
- action_id（行動単位）
- event_id/correlation_id
- actor_id/persona_id/user_id
- policy_id
- target_schema/target_rpc
- rpc_args_hash（引数のハッシュ）
- signature_base64（行為署名）
- decision_reason（AI側理由：短文）
- created_at/occurred_at

---

# 2. 証跡保存場所（推奨）
- Persona側：personaos.persona_action_log（提案/決定）
- Integration側：integration.external_event（境界イベント）
- ERP側：audit/decision_log/approval_request（現実側記録）

---

# 3. 禁止
- 署名なしでERPへ到達
- 証跡なしの実行
- 後追いで内容を書き換える（append-only推奨）
