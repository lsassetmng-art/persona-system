# L4 制御層（Kill Switch / Override / Version / Freeze）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）

## 目的
外部連携と文明適用を「止められる/変えられる/共存できる」状態にする。

## Phase1（制御層）で確定する項目
- system_control（integration_enabled / ingest_enabled / dispatch_enabled / growth_apply_enabled）
- company_weight_override（会社別weight上書き）
- versioning（event_version による共存/拒否）
- growth_freeze（最終防御）

※ 詳細は phase1_control_layer 配下の正本に準拠
