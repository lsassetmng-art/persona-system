# 48 Threat Model and Controls（脅威モデル/対策 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 脅威カテゴリ
T1: 認証/署名偽造（なりすまし）
T2: 権限昇格（whitelist回避）
T3: 連携バイパス（Integrationを回避）
T4: リプレイ（同一要求の悪用）
T5: ログ改ざん（否認）
T6: 暴走（大量要求/DoS）
T7: データ漏えい（ERP機密）

---

# 1. 対策（必須）
C1: 署名必須 + trusted_keys/revoked_keys（Fail-Closed）
C2: policy_id必須 + expires_at必須（無期限禁止）
C3: whitelist必須（deny default）
C4: idempotency_key + event_id（リプレイ耐性）
C5: append-only監査 + rpc_args_hash（否認防止）
C6: rate limit（Integration/Dispatcher）+ kill-switch（即停止）
C7: READ ONLY first（AIは参照中心、実行は承認要求まで）

---

# 2. 検証（テストに追加する項目）
- 署名不正 → 受理されない
- policy期限切れ → 受理されない
- whitelist外 → 受理されない
- 同一idempotency_key → 1回のみ
- stop系control → すべて停止
