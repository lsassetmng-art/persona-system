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
