# 09 Control + Event Standard（共通化最終設計）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 1. system_control 共通標準

## 目的
全OSを「同じ方式」で止められるようにする。
Foundationには置かない。各OSに同一構造で持つ。

## 共通DDL（テンプレ）
create table <OS>.system_control (
  control_key text primary key,
  control_value text not null,
  description text,
  updated_at timestamptz not null default now(),
  updated_by text
);

## 初期キー（全OS共通）
- os_enabled = '1'
- ingest_enabled = '1'
- dispatch_enabled = '1'
- apply_enabled = '1'
- maintenance_mode = '0'

## ルール
- apply_enabled=0 が最優先停止
- text型で将来拡張（soft_stop等）可能
- OS単位でのみ参照（他OSを止めない）

---

# 2. Interface Event Version 標準

## 対象
OS間を通過するイベントのみ（内部イベントは任意）

## 必須フィールド（Interface通過時）
- event_id uuid
- source_os text
- target_os text
- event_type text
- event_version integer not null default 1
- occurred_at timestamptz
- payload jsonb
- signature text（境界イベントのみ）

## ルール
- event_version は署名対象JSONに含める
- 互換破壊時は event_version を+1
- 同一event_typeで version共存を許可

---

# 3. event_outbox 共通構造 v1.0

## 目的
全OSで配送構造を統一する。
既存カラムは移行対象（後方互換維持しながら収束）。

## 標準構造

id uuid primary key default gen_random_uuid(),
event_id uuid not null,
source_os text not null,
event_type text not null,
event_version integer not null default 1,
user_id uuid,
payload jsonb not null,
occurred_at timestamptz not null,
dispatch_status text not null default 'PENDING',
dispatch_attempts integer not null default 0,
next_retry_at timestamptz,
dispatched_at timestamptz,
last_dispatch_error text,
created_at timestamptz not null default now()

## 固定dispatch_status
- PENDING
- INFLIGHT
- DONE
- RETRY
- DEAD

## ルール
- retry_count / status など旧カラムは廃止予定（移行フェーズ設計）
- gaming/life 等の origin_table / idempotency_key は拡張カラムとして残してよい
- source_os は dispatcherログ簡略化のため必須

---

# 4. magnitude 型統一（Persona Core）

growth_events.magnitude:
integer → numeric(5,2)

理由:
- integration.weight が numeric
- 精度保持
- 将来A/B調整可能

---

# 5. 移行方針（実装は後）

Phase A:
- 新event_version追加（nullable→not null default 1）
- 新source_os追加

Phase B:
- system_control 各OS追加
- dispatcher/apply 参照追加

Phase C:
- 旧outboxカラム削除（十分検証後）

---

# 6. 絶対禁止

- Foundationにglobal_controlを置かない
- OS間でcontrol共有しない
- 直結UPDATEしない
- version無し署名しない

---

# 7. 設計完了宣言

この文書をもって、
Civilization Platform の Control / Event 構造は
設計上「固定」とする。

実装は必ずこの正本に従う。
