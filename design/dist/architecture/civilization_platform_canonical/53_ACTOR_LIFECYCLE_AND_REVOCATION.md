# 53 Actor Lifecycle and Revocation（Actorライフサイクル/失効 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
actorの生成〜停止〜失効を文明共通で統一する。

---

# 1. 状態遷移（必須）
- PROVISIONED（発行前準備）
- ACTIVE（稼働）
- SUSPENDED（一時停止）
- REVOKED（永久失効）

policy も同様に ACTIVE/SUSPENDED/REVOKED。

---

# 2. 失効の粒度（強い順）
1) maintenance_mode（OS全停止）
2) os_enabled（OS停止）
3) admission policy revoke（policy単位停止）
4) actor_status=SUSPENDED/REVOKED（主体停止）
5) key revoke（署名不能化）
6) whitelist disable（行為停止）

Fail-Closed:
- 判定不能 → 停止

---

# 3. 期限（必須）
- policy は必ず expires_at を持つ（無期限禁止）
- 延長は「更新」ではなく「再発行」を推奨（証跡）

