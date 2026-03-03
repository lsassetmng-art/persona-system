# =========================================================
# CivilizationOS 設計正本 v3.1 (Canonical Architecture)
# =========================================================
status: CANONICAL
phase: v3_core_complete
architecture: EVENT_DRIVEN_PERSONA_CENTERED
author: CivilizationOS
storage_target: Supabase (PostgreSQL + Edge Functions)

# =========================================================
# 0. 文明原則（絶対不変）
# =========================================================

1. 各 world は「事実のみ」を書く
2. 状態を持つのは personaos のみ
3. 金は commerce のみ
4. 表現は asset のみ
5. 横断定義は shared のみ
6. 状態変更は必ずイベント経由
7. snapshot が人格の唯一の公開正本

# =========================================================
# 1. 物理スキーマ構成
# =========================================================

personaos   : 人格状態正本 / 成長エンジン / snapshot
business    : 業務アプリ群
life        : 生活系アプリ群
streaming   : 配信系
gaming      : ゲーム系
commerce    : 課金・権利
asset       : キャラ・テーマ・DLC
identity    : owner / 外部連携
shared      : 横断定義 / event_catalog
governance  : 社会裁定

# =========================================================
# 2. Event Flow（確定）
# =========================================================

world app
  ↓
*_event_outbox（事実）
  ↓
claim_rpc（FOR UPDATE SKIP LOCKED）
  ↓
Civilization Dispatcher（Edge）
  ↓
persona_state_apply（Edge）
  ↓
personaos.apply_event_engine()
  ↓
personaos.growth_core_state 更新
personaos.persona_state 更新
  ↓
snapshot再発行（署名付き）

# =========================================================
# 3. event_outbox 仕様（全world共通）
# =========================================================

必須カラム:

- event_id uuid (PK)
- event_type text
- occurred_at timestamptz
- user_id uuid
- payload jsonb
- dispatch_status text
- dispatch_attempts int
- next_retry_at timestamptz

dispatch_status ENUM:

PENDING
INFLIGHT
DONE
DEAD

原則:
- world は personaos を直接更新しない
- dispatcher のみが persona_apply を呼ぶ

# =========================================================
# 4. Dispatcher仕様
# =========================================================

- world配列ループ処理
- claim_rpc 呼出
- backoff制御あり
- MAX_RETRY = 5
- 409は成功扱い（冪等）
- next_retry_at考慮必須

retry backoff table:
0s
30s
120s
600s
1800s

# =========================================================
# 5. Persona Apply仕様
# =========================================================

処理順:

1. growth_events INSERT（event_id UNIQUE）
2. 23505 → 409返却
3. event_registry から axis_deltas取得
4. apply_event_engine 実行
5. 成功後 is_processed=true
6. snapshot非同期再発行

# =========================================================
# 6. 成長エンジン構成（apply_event_engine）
# =========================================================

入力:
- user_id
- persona_id
- event_type
- axis_deltas
- occurred_at

処理:

1. 日次decay
2. axis clamp(min/max)
3. delta適用
4. relationship_score再計算
5. stage判定
6. burnout制御
7. persona_state同期

補助関数:

- evaluate_stage()
- evaluate_burnout()
- recover_stability()
- decay_memory_state()

# =========================================================
# 7. 現在のgrowth_axis
# =========================================================

trust
discipline
curiosity
stability

# =========================================================
# 8. event_registry 原則
# =========================================================

- event_type ごとに axis_deltas 定義
- is_enabled=true のみ適用
- world/domain 大文字統一

# =========================================================
# 9. 冪等保証
# =========================================================

- growth_events.event_id UNIQUE
- duplicate event は409
- dispatcherは409を成功扱い

# =========================================================
# 10. Snapshot原則
# =========================================================

- persona_state更新後のみ再発行
- 署名はEd25519
- 外部世界は snapshot のみ参照
- personaos が唯一の状態源

# =========================================================
# 11. RLS原則
# =========================================================

world schema:
  user_id = auth.uid()

personaos:
  service_roleのみ更新可

cross-schema:
  直接更新禁止

dispatcher:
  service_role

# =========================================================
# 12. 現在地
# =========================================================

- business連携済
- life連携済
- growth_engine安定
- decay動作
- stage判定動作
- burnout制御動作
- dispatcher安定
- snapshot連携済

CivilizationOS v3 Core 完成

# =========================================================
# END OF CANONICAL DOCUMENT
# =========================================================
