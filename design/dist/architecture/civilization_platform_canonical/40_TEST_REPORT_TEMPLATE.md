# 40 Test Report Template（結果記録テンプレ）
status: CANONICAL_TEST_REPORT_TEMPLATE
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 実行情報
- 実行日時（JST）:
- 実行者:
- 対象:
  - Persona Project: PERSONA_DATABASE_URL（ref記入）
  - ERP Project: DATABASE_URL（ref記入）
- 変更有無:
  - [ ] なし
  - [ ] あり（内容: ）

---

# 実行結果サマリ
- T1 Stop: PASS / FAIL
- T2 Idempotency: PASS / FAIL
- T3 Signature: PASS / FAIL
- T4 Retry/Dead: PASS / FAIL
- T5 Version: PASS / FAIL

---

# 詳細ログ
## T1 Stop
- Persona Apply stop:
- Civilization Dispatch stop:
- ERP Sales guard:

## T2 Idempotency
- processed=true → duplicate扱い（409期待）
- processed=false → retry可

## T3 Signature
- 未検証拒否（採用されない）
- 検証済み採用

## T4 Retry/Dead
- INFLIGHT放置なし
- backoff/attempts 更新
- MAX_RETRY → DEAD

## T5 Version
- event_version passthrough
- v1/v2 共存方針どおり

---

# 差分/課題
- 課題:
- 再現手順:
- 影響範囲:
- 対応方針（設計変更/実装変更/運用）:

---

# 判定
- [ ] 合格（次フェーズへ）
- [ ] 不合格（修正後に再実行）
