# 55 Streaming/Game/Life Special Rules（非現実OS特則 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
Streaming/Game/Life は ERP と違い「現実確定」ではない。
よってリスク/承認/許可の設計を最適化する。

---

# 1. StreamingOS（配信）
- 人間承認は「配信開始/終了など高影響」だけでよい（運用裁量）
- 金銭連動（投げ銭等）に繋がる操作は risk を上げる（>=2）扱い
- channel_id を scope として必須化

---

# 2. GameOS（ゲーム）
- 現実確定なし（ただし課金/外部連携がある場合は例外でリスク上げ）
- world_id / character_slot を scope として必須化
- NPC生成は draft/reserve を推奨（rollback容易）

---

# 3. LifeOS（生活）
- 個人領域を強く隔離（user_id scope 必須）
- “実行”は提案/申請まで（max 2）
- 健康/金銭に触れる場合は常に human gate 推奨

