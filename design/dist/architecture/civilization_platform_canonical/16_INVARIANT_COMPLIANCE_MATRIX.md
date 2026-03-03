# 16 Invariant Compliance Matrix（不変条件→実装対応表）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 目的
14_CIVILIZATION_FORMAL_MODEL.md の不変条件（I1〜I7）を、
現行DB構造・既存実装（dispatcher/apply/ingest）へマッピングし、
「何が足りないか」を明確にする。

---

# I1: 責任逆転禁止（No Direct Write Across Responsibility）
## 要求
- Cognitive（R2）が Reality（R3）へ直接DB更新しない
## 現状根拠（DB）
- OS分割は schema により成立（business / personaos / integration 等）
## 必要措置（設計）
- 02_OS_CONNECTION_MATRIX により “SUGGESTIONのみ” を固定済み
## ギャップ
- 実装で直接更新が存在しないことをコードレビューで確認（Edge/Worker）
## 検証方法（推奨）
- repo grep: business.*(insert|update|delete) を persona系関数/Edgeが呼んでいないか

---

# I2: 唯一経路（Single Gateway）
## 要求
- OS間イベントは Integration 経由
## 現状根拠（DB）
- integration.external_event / external_world_outbox が存在
## ギャップ
- Reality OS が直接 personaos に書き込む経路が無いこと確認
## 検証方法
- Integration以外のschemaに “external_event相当” が増えていないか定期監査

---

# I3: 署名原則（Signature）
## 要求
- 境界イベントは署名・検証済みのみ採用
## 現状根拠（DB）
- integration.external_event.signature / signature_verified / key_id / sig_ver
- integration.trusted_keys / revoked_keys
## ギャップ
- dispatcher/ingest が signature_verified を強制しているか（実装確認）
## 検証方法
- ingestで signature_verified=false を REJECT するテスト

---

# I4: Version共存（Versioned Interface）
## 要求
- event_version を必須
## 現状根拠（DB）
- integration.event_registry に version がある
## ギャップ（P0）
- external_event / outbox に event_version が無い（監査結果より）
- 09_CONTROL_EVENT_STANDARD で導入設計済み
## 検証方法
- DDL導入後に InterfaceEvent の署名対象へ含める

---

# I5: 停止可能性（Stoppability）
## 要求
- 全OSに system_control
## ギャップ（P0）
- system_control が存在しない（監査結果より）
- 09_CONTROL_EVENT_STANDARD で導入設計済み
## 検証方法
- apply_enabled=0 で apply が動かない
- dispatch_enabled=0 で dispatcher がclaimしない

---

# I6: 監査二重化（Double Audit）
## 要求
- 提案ログと実行ログを分離
## 現状根拠（DB）
- personaos.apply_run_log / growth_events
- shared.dispatcher_run_log / dispatcher_dead_letter
- business.approval_* / decision_log 等
## ギャップ
- SUGGESTION と EXECUTION の相関ID（event_id/request_id）運用を固定する必要
## 検証方法
- event_id で end-to-end trace できるか（ダッシュボード要件）

---

# I7: 冪等（Idempotency）
## 要求
- 同一event_idのapplyは高々一度
## 現状根拠（DB）
- personaos.growth_events: is_processed / processed_at
## ギャップ
- race時の挙動（insert競合）をテストで確認
## 検証方法
- duplicate 409 をE2Eテストに含める

---

# まとめ（P0差分）
- P0-1: system_control 全OS導入（未実装）
- P0-2: event_version outbox/external_eventへ導入（未実装）

これらは実装フェーズの最初に必ず対応する。
（ただし、実装は必ず佐藤（DB担当）レビュー参加で行う）

