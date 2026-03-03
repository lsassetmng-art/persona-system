# 19 Event Unified Model（イベント統一モデル）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
全OSが同一形式（Envelope）でイベントを扱えるようにする。

- Outbox/External/Apply/Approval/Execution の語彙を統一
- 署名対象を固定（Canonical JSON）
- event_version による共存・段階移行を可能にする

---

# 1. Event Envelope v1.0（共通形式）

## 1.1 必須フィールド（全イベント共通）
- event_id: uuid
- event_type: text
- event_version: integer (>=1)
- source_os: text
- target_os: text?（単一配送の場合）
- occurred_at: timestamptz
- payload: jsonb

## 1.2 任意フィールド（追跡/監査）
- user_id: uuid?
- company_id: uuid?（Reality系のみ）
- correlation_id: text?（E2E追跡）
- idempotency_key: text?（発生源が持つ場合）
- origin_table: text?
- origin_pk: uuid?
- priority: integer?（0=default）
- tags: jsonb?（検索用）

## 1.3 配送フィールド（Outbox管理用）
- dispatch_status: {PENDING, INFLIGHT, DONE, RETRY, DEAD}
- dispatch_attempts: integer
- next_retry_at: timestamptz?
- dispatched_at: timestamptz?
- last_dispatch_error: text?

---

# 2. Canonical JSON（署名対象）

## 2.1 署名対象の固定（順序も固定）
署名対象は以下のみ（余計なメタは含めない）：

canonical_event = {
  "event_id": event_id,
  "event_type": event_type,
  "event_version": event_version,
  "source_os": source_os,
  "target_os": target_os (null可),
  "occurred_at": occurred_at (ISO8601),
  "payload": payload
}

## 2.2 署名アルゴリズム
- Ed25519（base64）
- signature_alg = "ed25519"
- signature_base64 を付与

## 2.3 署名検証
Integration が検証し、
external_event.signature_verified=true のみを採用する。

---

# 3. Event Class（意味分類）

Kind = { FACT_EVENT, POLICY_EVENT, SUGGESTION, APPROVAL, EXECUTION }

## 3.1 原則
- FACT_EVENT: Reality由来、署名必須
- POLICY_EVENT: Governance由来、署名必須
- SUGGESTION: Persona由来、署名必須（AI社員出力）
- APPROVAL: Business/ERPの承認結果、署名必須
- EXECUTION: Reality確定、署名必須

---

# 4. event_version 互換ポリシー

## 4.1 原則
- 互換破壊を伴う変更は version++ する
- 同一 event_type は version 共存できる
- 古い version を受けるかは target_os の policy に従う

## 4.2 互換性タイプ
- Backward Compatible: payload に optional を追加
- Forward Compatible: unknown fields を無視
- Breaking: field rename/remove/type-change → version++

---

# 5. Integration の役割（唯一窓口）

Integration は以下を行う：

1) VerifySignature（canonical）
2) Translate event_type（registryに従う）
3) Weight / Clamp（必要な場合）
4) Route target_os / world_schema
5) Emit to target outbox

Integration は domain state を持たない。

---

# 6. Outbox 標準（実装ガイド）

各OSの event_outbox は Envelope v1.0 を保持し、
配送フィールドを持つ。

既存の origin_table/idempotency_key は拡張として残す。

---

# 7. Apply 側の最低要件

Apply は最低限以下を満たす：

- system_control.apply_enabled を参照
- event_id 冪等（duplicate=409）
- event_version をログ・監査へ残す
- payload を canonical として扱う（改変禁止）

---

# 8. 禁止事項

- canonical 以外を署名対象にしない（環境依存で壊れるため）
- event_version 無しで境界を越えない
- source_os を偽装しない
- Integration をバイパスしない

---

# 9. 凍結宣言
本モデルをもって、
Civilization Platform のイベント形式は統一された。

以後、全OSのイベントは本 Envelope に従う。

