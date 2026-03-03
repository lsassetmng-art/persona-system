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
