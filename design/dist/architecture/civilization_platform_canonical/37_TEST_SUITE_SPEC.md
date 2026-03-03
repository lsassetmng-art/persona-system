# 37 Test Suite Spec（T1–T5 自動テスト仕様 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
文明プラットフォーム（Persona Project + ERP Project）に対して、
T1〜T5 の合格基準を“自動化可能な仕様”として固定する。

- 停止できる（Stop）
- 冪等（Idempotency）
- 署名（Signature）
- リトライ/DEAD（Retry/Dead）
- version境界（Version）

---

# 1. 実行環境
- Termux
- DB接続:
  - PERSONA_DATABASE_URL（Persona Project）
  - DATABASE_URL（ERP Project only）

---

# 2. 共通ルール
- すべて fail-closed を期待
- テストは必ず「戻し込み（rollback）」仕様を含む
- 本仕様は「テストの設計」であり、実装スクリプトは別フェーズで生成する

---

# 3. T1 Stop Test（停止）
## 3.1 Persona Project 停止（必須）
対象:
- personaos.system_control (apply_enabled, os_enabled, maintenance_mode)
- civilization.system_control (dispatch_enabled, os_enabled, maintenance_mode)

手順（仕様）:
1) personaos.apply_enabled=0
2) apply API / apply相当処理が 503（halted）または DB例外になる
3) rollback: personaos.apply_enabled=1

4) civilization.dispatch_enabled=0
5) dispatcher が claimed=0 / halted を返す（または処理しない）
6) rollback: civilization.dispatch_enabled=1

合格:
- 停止時に mutate が進まない
- rollbackで復旧する

---

## 3.2 ERP Project 停止（必須）
対象:
- sales.system_control.os_enabled（最低1ドメインでOK）

手順（仕様）:
1) sales.os_enabled=0
2) sales.request_order_approval_safe を呼ぶと例外で止まる
3) rollback: sales.os_enabled=1

合格:
- DBレベルで停止（fail-closed）
- Java/Edge経由でも止まること

---

# 4. T2 Idempotency Test（冪等）
対象:
- personaos.growth_events(event_id, is_processed, processed_at)

手順（仕様）:
1) event_id=E を apply で処理 → is_processed=true
2) 同じ event_id=E を再送 → 409 duplicate（成功扱い）
3) event_id=F を「未処理状態 is_processed=false」で存在させる（または失敗させる）
4) event_id=F を再送 → retryとして処理継続可

合格:
- processed=true は 409
- processed=false は再実行可

---

# 5. T3 Signature Test（署名/信頼鎖）
対象:
- integration.external_event(signature_verified, key_id 等)
- trusted_keys / revoked_keys

手順（仕様）:
1) signature_verified=false の外部イベントを投入
2) ingest/translate は拒否し、routeしない（outboxに流さない）
3) signature_verified=true で投入した場合は採用される（正常系）

合格:
- 未検証は必ず拒否（無害化）
- 検証済みは正常に流れる

---

# 6. T4 Retry / Dead Test（復旧）
対象:
- <world>.event_outbox(dispatch_status, dispatch_attempts, next_retry_at, last_dispatch_error)
- shared.dispatcher_dead_letter（推奨）

手順（仕様）:
1) dispatcher で apply を意図的に失敗させる（HTTP 500 等）
2) mark_retry により PENDING に戻る（INFLIGHT放置禁止）
3) attempt増加と backoff が反映される
4) MAX_RETRY超過で DEAD に落ちる
5) DEAD は DLQ に集約される（推奨）

合格:
- INFLIGHTが残らない
- retry→dead の遷移が追える
- last_dispatch_error が記録される

---

# 7. T5 Version Boundary Test（version）
対象:
- event_version（external_event / event_outbox）
- event_type taxonomy（version共存）

手順（仕様）:
1) event_version を持つイベントが境界を越えても保持される
2) v1/v2 が共存して処理できる（少なくとも拒否せず記録できる）

合格:
- event_version passthrough
- version共存に対して安全側の挙動（拒否 or route）を定義どおり行う

---

# 8. 成功判定（共通）
- 期待ステータス（409/503）や例外が一致する
- DBの状態遷移が設計どおり
- 追跡（event_id/correlation_id）で再構成できる

---

# 9. 次フェーズで生成するもの（実装ではないが仕様として宣言）
- 38_TEST_RUNNER_TERMUX.sh（Termuxワンブロック化）
- 39_TEST_DATA_SEEDS.sql（テスト用種）
- 40_TEST_REPORT_TEMPLATE.md（結果記録テンプレ）

