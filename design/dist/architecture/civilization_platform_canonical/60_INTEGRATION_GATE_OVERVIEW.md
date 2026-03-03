# 60 Integration Gate Overview（文明の門番 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 目的
Integration を「文明の関所」として固定する。
全OS（ERP/Business/Streaming/Game/Life/Governance/System）への越境要求は
必ず Integration Gate を通過しなければならない。

---

## 1. Gate が強制するもの（Fail-Closed）
- system_control: integration.os_enabled=1 & maintenance_mode=0
- policy: 有効・期限内・actor_id一致・os_key一致・risk上限OK
- whitelist: action_key / target_schema / target_rpc が許可されている
- signature: “検証済み”フラグ + trusted_keys + revoked_keys で信頼鎖が成立
  - Ed25519の暗号学的verify自体は Edge/外部で実施し、DBは fail-closed で状態確認する
- idempotency: action_id（UUID）で重複拒否

---

## 2. Gate の出力
Gate を通過した要求のみが “target OS の event_outbox” に投入される。
投入は「Integration からの発行」であることを示す:
- source_os='integration'
- event_version を維持
- correlation_id/event_id を維持

---

## 3. 禁止
- Integration を経由しない越境（直叩き）
- policy/whitelist/signature のいずれか欠落で通すこと
- allowlist を持たないRPC実行
