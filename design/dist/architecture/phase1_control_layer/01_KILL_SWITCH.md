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
