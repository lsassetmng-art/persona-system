# 77 Delivery Worker Implementation（実装方針 正本）
status: APPLY_READY
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

## 0. 結論（安全な実装）
Integration は “配送” の責務のみ。
各OSの event_outbox は列差分があるため、Integration から直INSERTしない。

代わりに：
- Integration: actor_route_queue を claim → target_schema の ingest RPC を呼ぶ
- OS側: ingest RPC が “自OSの outbox へ安全に投入” する（列差分吸収）

---

## 1. workerがやること
- integration.dispatch_enabled / integration.os_enabled / maintenance を確認（Fail-Closed）
- PENDING を FOR UPDATE SKIP LOCKED 相当で claim（INFLIGHTへ）
- target_schema の ingest RPC を呼ぶ
- 成功 → DONE
- 失敗 → attempts+1, next_retry_at を backoff で設定、閾値超過は DEAD

---

## 2. workerが “やらない” こと
- 業務ロジック
- 暗号学的verify（signature_verified を信頼、Gateで担保）
- OS側 outbox の列差分吸収（OS側RPCに委譲）
