# ============================================================
# Civilization Event Producer 正式設計書
# Status: DESIGN FIXED
# Layer: Civilization Core
# ============================================================

## ■ 目的

event_outbox に入る全イベントを
「署名強制・検証前提」に統一する。

Dispatcherは検証のみ。
Producerが唯一の署名生成者。

---

# ■ 全体フロー

Client
  ↓
World Emit RPC（DB）
  ↓
Edge Producer（署名）
  ↓
world.event_outbox（署名付きPENDING）
  ↓
Dispatcher（verify）
  ↓
StateApply

---

# ■ 責務分離

| 項目 | 担当 |
|------|------|
| schema_hash 計算 | DB |
| event_id 発行 | DB |
| canonical JSON | Edge |
| Ed25519署名 | Edge |
| 検証 | Dispatcher |

---

# ■ Edge Function

Function名:
civilization-event-producer

入力:
{
  world,
  event_type,
  user_id,
  payload,
  occurred_at (optional)
}

---

# ■ Producer内部処理

① civilization.world_registry 取得
   - schema_name
   - emit_rpc_name

② world.emit_event RPC実行
   → event_id
   → event_version
   → schema_hash
   → occurred_at

③ canonical envelope 作成

{
  schema,
  world,
  event_id,
  event_type,
  event_version,
  schema_hash,
  user_id,
  occurred_at,
  payload
}

④ Ed25519署名
   ENV:
   PERSONAOS_KEY_ID
   PERSONAOS_ED25519_PRIVATE_KEY_PKCS8_B64

⑤ world.event_outbox 更新
   signature = ?
   key_id = ?

---

# ■ DB仕様（各 world 共通）

RPC:
emit_event(
  p_user_id uuid,
  p_event_type text,
  p_payload jsonb,
  p_occurred_at timestamptz default now()
)

RETURNS TABLE(
  event_id uuid,
  event_version int,
  schema_hash text,
  occurred_at timestamptz
)

内部処理:
- event_id生成
- schema_hash計算
- dispatch_status = 'PENDING'
- signature NULL
- key_id NULL

---

# ■ セキュリティ

- event_outbox 直接INSERT禁止
- emit_eventは service_role のみ
- Dispatcherは signature IS NOT NULL のみ処理

---

# ■ Dispatcher追加条件

claim時:

AND signature IS NOT NULL

---

# ■ 完成構造

emit_event (DB)
   ↓
Producer署名
   ↓
event_outbox(PENDING + signed)
   ↓
Dispatcher verify
   ↓
StateApply

---

# ■ 得られる保証

✔ 署名強制
✔ 改竄検知
✔ 世界分離
✔ 鍵ローテ可能
✔ 監査整合

---

Status: READY FOR IMPLEMENTATION
