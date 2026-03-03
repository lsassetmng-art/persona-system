# 05 Decision Matrix（判定順）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## 目的
制御層が増えると「どれが勝つか」で事故る。
判定順（優先順位）を固定する。

---

# A) external_event_ingest（入口）

1. integration_enabled == 1 ?
2. integration_ingest_enabled == 1 ?
3. 署名検証
4. revoked_keys チェック
5. replay窓
6. external_event 保存（RECEIVED→VERIFIED）
7. external_world_outbox 投入
8. external_event DISPATCHED

停止理由はログに残す。

---

# B) dispatcher（integration loop）

1. integration_enabled == 1 ?
2. integration_dispatch_enabled == 1 ?
3. claim_external_events（PENDING→INFLIGHT）
4. persona_apply 呼び出し
5. 成功 → mark_external_event_done
6. 失敗 → retry（PENDING/DEAD）

---

# C) persona_apply（apply入口）

1. growth_apply_enabled == 1 ?（最強）
2. integration world なら翻訳
   - event_registry（source + erp_event_type + version + is_active）
3. company override
4. weight clamp（0.0〜3.0）
5. personaos.event_registry is_enabled=true
6. apply_event_engine
7. growth_events processed
8. snapshot（best-effort）
9. apply_run_log

---

# 失敗時の扱い（正）
- 409 duplicate は成功扱い（冪等）
- freeze は 503/423（運用停止）
- version mismatch は 400（設計不整合）
