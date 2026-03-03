# 30 Trace / Correlation / Logging Spec（追跡ログ 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
event_id を軸に、OS/プロジェクトをまたいで追跡できるようにする。

---

# 1. 追跡キー（固定）
- event_id（必須）
- correlation_id（推奨、E2E追跡）
- source_os / target_os（推奨）
- occurred_at（必須）
- event_version（必須）

---

# 2. ログ出力（Edge）
重要ログは JSON（検索性のため）
最低フィールド:
- level, stage, event_id, event_type, source_os, target_os, correlation_id, elapsed_ms

トークン等の秘匿情報は出さない。

---

# 3. DBログ（推奨）
- personaos.apply_run_log（apply）
- shared.dispatcher_run_log（dispatcher）
- business.decision_log / approval log（承認）
- DLQ: shared.dispatcher_dead_letter（dead）

---

# 4. 合格条件
- event_id だけで「何が起きたか」を再構成できる
- duplicate(409) / retry / dead の経路が追える
