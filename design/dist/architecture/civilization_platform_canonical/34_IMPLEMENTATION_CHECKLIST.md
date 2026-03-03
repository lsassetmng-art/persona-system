# 34 Implementation Checklist（実装前チェックリスト 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
設計を完了させた上で、実装でバタつかないための「実装前ゲート」を固定する。

---

# 1. 前提確認（必須）
- [ ] プロジェクト境界が正しい
  - [ ] DATABASE_URL = ERP Project only
  - [ ] PERSONA_DATABASE_URL = Persona Project only
- [ ] OS責務（17）/ AI社員（18）/ Event統一（19）が凍結されている
- [ ] system_control（22）/ guard契約（23）/ maintenance（24）/ guard仕様（25）が凍結されている
- [ ] 実装計画（20）/ テスト計画（21）が凍結されている

---

# 2. DB変更ゲート（必須）
- [ ] Additive Only（既存破壊なし）
- [ ] DDL/関数変更は 佐藤（DB担当）レビュー参加
- [ ] guard関数の ERRCODE/メッセージ契約（23/25）を守る
- [ ] maintenance_mode が最優先で効く設計を崩さない

---

# 3. ランタイム変更ゲート（必須）
- [ ] Dispatcher は civilization + world_schema の二重制御に従う（26）
- [ ] Apply は personaos の制御に従う（26）
- [ ] Ingest は integration の制御 + signature gate（31）に従う
- [ ] 重要ログは JSON（30）

---

# 4. テストゲート（必須）
- [ ] T1 Stop（停止）合格
- [ ] T2 Idempotency（duplicate=409）合格
- [ ] T3 Signature（未検証拒否）合格
- [ ] T4 Retry/Dead（INFLIGHT放置なし）合格
- [ ] T5 Version（passthrough/共存）合格

---

# 5. リリースゲート（推奨）
- [ ] maintenance_mode=1 → 適用 → テスト → maintenance_mode=0
- [ ] 段階的に ingest/dispatch/apply を戻す
- [ ] event_id/correlation_id で trace が可能

---

# 6. 完了条件
- 実装後も「止められる」「追える」「戻る」「壊れにくい」が維持される
