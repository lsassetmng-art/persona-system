# 22 System Control Canonical（制御層 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
全OS/全プロジェクトで system_control の意味と運用を統一する。
「止められる」「保守モードにできる」「誤動作を fail-closed で止める」を保証する。

---

# 1. system_control テーブル仕様（共通）
## 1.1 Schema-local table
各OSスキーマに以下を持つ：

- <os_schema>.system_control(
  - control_key text primary key
  - control_value text not null
  - updated_at timestamptz not null default now()
)

## 1.2 初期キー（固定）
- os_enabled: '1'|'0'（OS全体の有効/停止）
- dispatch_enabled: '1'|'0'（outbox dispatch 系の有効/停止）
- apply_enabled: '1'|'0'（apply / engine / state mutate の有効/停止）
- ingest_enabled: '1'|'0'（外部/境界入力の受け入れ）
- maintenance_mode: '1'|'0'（保守：原則“書き込み禁止”）

> すべて文字列で持つ（DB/Edge/多言語での一貫性優先）。

---

# 2. セマンティクス（優先順位）
優先順位（強い順）：

1) maintenance_mode='1' → 原則書き込み禁止（例外は「停止解除」「監査ログ」等）
2) os_enabled='0' → 全停止（読み取り以外）
3) ingest_enabled='0' → 境界入力停止（external_event/ingest）
4) dispatch_enabled='0' → dispatch停止（claim/mark_done/retry）
5) apply_enabled='0' → apply停止（state mutate）

---

# 3. Fail-Closed 原則
- キーが存在しない / 読めない / 値が不正 → **停止扱い（0）**
- 例外：READ ONLY の参照は許可（ただし運用で“止める”時はAPI側も止める）

---

# 4. プロジェクト分離（確定）
## 4.1 Persona Project（PERSONA_DATABASE_URL）
- civilization / personaos / integration / life / game / streaming / business(軽量業務) …
→ 文明側OSはここに集約

## 4.2 ERP Project（DATABASE_URL）
- sales / purchase / accounting / inventory / approval / workflow / finance / hr …
→ ERPはドメイン分割スキーマ群

---

# 5. 運用ルール
- 値変更は監査対象（誰が/いつ/なぜ）
- “止める”はまず maintenance_mode → os_enabled の順で判断（原則）
- 解除は逆順
- 実装は必ず guard を通す（DB関数/Edgeの両方）

---

# 6. 禁止事項
- system_control を持たないOS追加（禁止）
- control_key の勝手追加（追加は設計フェーズで正本更新）
- 0/1 以外の値運用（禁止）
