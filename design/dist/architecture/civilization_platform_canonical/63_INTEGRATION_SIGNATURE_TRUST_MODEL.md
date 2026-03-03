# 63 Integration Signature & Trust Model（署名/信頼鎖 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 方針
暗号学的な Ed25519 verify は Edge/外部で行う（実装自由）。
DBは “検証済みの状態” と “鍵の信頼鎖” を fail-closed で確認する。

---

## 1. 参照テーブル（既存想定）
- integration.trusted_keys
- integration.revoked_keys
- integration.external_event(signature_verified, key_id, sig_ver, signature, event_version)

---

## 2. Gateでの必須条件
- signature_verified=true
- key_id が trusted_keys に存在
- key_id が revoked_keys に存在しない（または期限/状態で無効）
- sig_ver が policy/actor と矛盾しない（将来拡張）

Fail-Closed:
- 参照不能/不整合 → reject
