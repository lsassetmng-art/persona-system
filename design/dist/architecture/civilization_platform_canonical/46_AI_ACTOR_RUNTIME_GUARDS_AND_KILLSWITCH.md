# 46 Runtime Guards and Kill-switch（実行ガード/停止 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
AI Actorの暴走・侵害時に即停止できることを保証する。

---

# 1. 停止レベル（強い順）
1) maintenance_mode（OS全停止）
2) os_enabled（OS停止）
3) admission policy revoke（policy_id停止）
4) actor_id suspend/revoke（persona停止）
5) rpc whitelist remove（特定行為停止）
6) route stop（integration ingest/dispatch停止）

Fail-Closed:
- 判定不能 → 停止

---

# 2. 強制ポイント（必須）
- Integration：署名・policy・whitelist を満たさない要求をERPへ流さない
- ERP：*_safe の先頭で guard + policy検証（推奨）
- 監査ログ：停止で弾いた場合も best-effort 記録

---

# 3. 緊急停止手順（設計）
- まず maintenance_mode=1（対象OS）
- actor/policy revoke
- 原因究明後に段階復旧（36/33の手順）
