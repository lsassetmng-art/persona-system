# 29 Integration Translation and Weight Policy（翻訳/weight 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Integrationが行う「翻訳（event_type変換）」と「weight適用」を設計固定する。

---

# 1. 翻訳レジストリ（integration.event_registry）
- source: text（例: 'erp', 'persona', 'external'）
- erp_event_type: text
- persona_event_type: text
- weight: numeric
- is_active: boolean
- version: integer
- description: text

運用:
- is_active=true のみ採用
- versionは翻訳ルールの世代（イベントversionとは別軸）

---

# 2. weightの意味（固定）
weightは「影響度スカラー」。
- Persona側のgrowth/axis delta等に掛ける係数として使える
- ただし確定ロジックは PersonaOS の apply engine が担う（Integrationは計算しない）

---

# 3. 適用順（推奨）
1) signature_verified gate
2) schema/world route決定
3) event_type翻訳
4) weight添付（payload/metaへ）
5) target outboxへ投入

---

# 4. 禁止
- Integrationがドメイン状態を持つ
- Integrationが現実確定を実行する
