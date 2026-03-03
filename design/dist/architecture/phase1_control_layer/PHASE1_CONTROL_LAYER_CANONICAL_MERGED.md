# ==========================================================
# Phase1 Control Layer (Merged Canonical)
# Generated: 2026-03-01 07:50:34
# ==========================================================



============================================================
FILE: 00_INDEX.md
============================================================

# Phase 1 制御層（設計正本）INDEX
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 目的
外部連携（ERP→PersonaOS）を **可変・停止・会社別制御・バージョン共存** できる状態にする。
「動く」から「止められる/制御できる」へ。

## 対象スコープ（この設計セットの範囲）
- PersonaOS Project（ihrukfdlcolygyvccujd）側の制御層
- ERP Project（bkvycodiojbwcomnylqa）とは「外部連携」関係のみ（統合しない）

## 成果物（このフォルダの正本）
1. 01_KILL_SWITCH.md
2. 02_COMPANY_OVERRIDE.md
3. 03_VERSIONING.md
4. 04_GROWTH_FREEZE.md
5. 05_DECISION_MATRIX.md

## 既存基盤（前提）
- external_event_ingest（署名検証→保存→outbox投入）
- integration.external_world_outbox（dispatcherが拾う）
- dispatcher v8.2（integrationループ含む）
- persona_apply v3.4（registry翻訳 + DB weight適用）
- integration.event_registry（翻訳辞書）

## Phase 1 完了の定義
- kill switch により「入口」「dispatcher」「apply」を止められる
- companyごとにイベント影響度（weight）を上書きできる
- event仕様versionを共存/拒否できる
- すべてが監査ログで追える（止めた理由・適用したルール・最終判定）


============================================================
FILE: 01_KILL_SWITCH.md
============================================================

# 01 Kill Switch（即時停止）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## ゴール
外部連携を「即時に止める」手段を確立する。
停止ポイントは3つ：
1) Ingest入口（external_event_ingest）
2) Dispatcher integration loop
3) Apply入口（persona_apply / persona_state_apply）

> 事故時に “どこで止めるか” を段階的に選べるのが本番運用。

---

## 設計：制御テーブル（PersonaOS側）
- schema: integration
- table: system_control

### キー
- `integration_enabled` : "1" / "0"
- `integration_ingest_enabled` : "1" / "0"
- `integration_dispatch_enabled` : "1" / "0"
- `growth_apply_enabled` : "1" / "0"（これは Phase1.4 とも連動）

### 優先順位（強）
1) growth_apply_enabled=0 → apply 全停止（最終防御）
2) integration_enabled=0 → integration 全停止
3) ingest/dispatch 個別フラグ

---

## 挙動仕様

### A) external_event_ingest
- ingress前に `integration_ingest_enabled` / `integration_enabled` を確認
- falseなら **503** で拒否（DB書き込みはしない）
- ただし「監査を残したい」場合は FAILED として external_event に保存するモードも将来拡張可能（v2）

### B) dispatcher integration loop
- ループ開始時に `integration_dispatch_enabled` / `integration_enabled` を確認
- falseなら integration loop をスキップ（他worldは継続）

### C) persona_apply / persona_state_apply
- `growth_apply_enabled` を確認
- falseなら **503**（または 423 Locked）で拒否
- dispatcher 側は retry 対象として戻す（mark_retry）

---

## 監査ログ（必須）
- 停止した場合、理由（どのキーが0だったか）をログ出力
- apply_run_log にも nonfatal で記録可能（「停止により拒否」）

---

## 非目標
- ERP側の停止（ERPは別宇宙。ERP側はERPで止める）


============================================================
FILE: 02_COMPANY_OVERRIDE.md
============================================================

# 02 Company Override（会社別制御）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## ゴール
同じERPイベントでも **会社ごとに影響度（weight）** を変えられる。
文明ポリシーを company_id 単位で調整する。

---

## 設計：会社別上書きテーブル（PersonaOS側）
- schema: integration
- table: company_weight_override

### 主キー（推奨）
- (company_id, source, erp_event_type)

### カラム
- company_id uuid
- source text（例: "ERP"）
- erp_event_type text（例: "ORDER_COMPLETED"）
- weight numeric（推奨レンジ 0.0〜3.0、clamp対象）
- is_active boolean
- reason text（監査用途）
- created_at/updated_at

---

## weight決定ルール（正）
優先順位：

1) company_weight_override（is_active=true の一致がある）
2) integration.event_registry.weight
3) default = 1.0

---

## 適用ポイント
- persona_apply で **integration翻訳後にweightを決定**する
- company_id は integrationイベントの payload から取得（dispatcherでpayloadへ注入済みの設計）

> company_id が無い integrationイベントは “override不可” として event_registry.weight を使う。

---

## 監査ログ（必須）
- apply_run_log か growth_events.context に以下を残す（いずれか）
  - applied_weight
  - weight_source: "company_override" | "registry_default" | "default"
  - override_reason（あれば）

---

## 非目標
- ERP側の会社ポリシー統合（ERPは別宇宙）


============================================================
FILE: 03_VERSIONING.md
============================================================

# 03 Versioning（仕様version共存）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## ゴール
ERPイベント仕様が更新されても文明側が壊れない。
versionを共存させ、受理/拒否を制御する。

---

## 対象
- integration.event_registry の version列
- external_event / outbox が持つ sig_ver と混同しない
  - sig_ver：署名フォーマットのversion
  - registry.version：イベント意味仕様のversion

---

## 設計：リクエスト側の event_version
ERPから送るイベントに以下を追加：

- event_version（integer）
  - 例: 1, 2, 3...

署名対象の canonical JSON にも含める（設計Dの範囲で拡張）。

---

## registryマッチング仕様（正）
integration翻訳時の検索条件：

- source = "ERP"
- erp_event_type = incoming.event_type
- version = incoming.event_version（未指定なら 1）
- is_active = true

一致しない場合：
- 400（event not allowed / version mismatch）
- 監査ログ出力

---

## 移行手順（運用）
1) PersonaOS側で event_registry に version=2 を追加（is_active=true）
2) ERP側で event_version=2 を送信開始
3) 一定期間、v1/v2共存
4) v1 を is_active=false にして停止

---

## 非目標
- 仕様変換（v1 payload を v2 に変換する等）は別フェーズ


============================================================
FILE: 04_GROWTH_FREEZE.md
============================================================

# 04 Growth Freeze（最終防御停止）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## ゴール
人格状態の更新（apply）を “最後の防波堤” として止める。
事故や暴走時に文明の状態破壊を防ぐ。

---

## 制御キー（system_control）
- growth_apply_enabled = "1" / "0"

---

## 適用ポイント
- persona_apply の入口でチェックし、0なら拒否
- dispatcher は失敗扱い（retry）として戻す（mark_retry）

---

## 返却コード（推奨）
- 503 Service Unavailable（運用停止）
または
- 423 Locked（凍結の意味が強い場合）

---

## 監査（必須）
- apply_run_log に「freezeで拒否」を記録
- Edge logs に JSON で出す（検索しやすく）

---

## 非目標
- growth_events 書き込み自体をDBトリガで止める（強すぎるため。まずEdgeで止める）


============================================================
FILE: 05_DECISION_MATRIX.md
============================================================

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
