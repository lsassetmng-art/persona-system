# ============================================================
# EVENT STANDARD v2 - CANONICAL
# status: CANONICAL
# owner: Boss
# prepared_by: Zero
# last_updated: 2026-03-01
# reference_constitution: 000_FULL_00_96_CANONICAL.md
# ============================================================

## 0. 目的
- イベントを「壊れない」「境界で安全」「将来拡張可能」に固定する。
- 内部イベント / worldイベント / domainイベント / OS間イベント（interface）を明確分離する。
- version戦略・署名対象・schema_hash を完全に固定する。
- Event Catalog / Compatibility Table の保管規約を固定する。

---

# 1. イベント分類（絶対固定）

| class | scope | signature | version | schema_hash |
|------|-------|-----------|---------|------------|
| INTERNAL_EVENT | 同一OS内部の補助 | NO | OPTIONAL | OPTIONAL |
| WORLD_EVENT | persona worlds 内 | NO | REQUIRED | REQUIRED |
| DOMAIN_EVENT | ERP domains 内 | NO | REQUIRED | REQUIRED |
| INTERFACE_EVENT | OS間（ERP↔Persona等） | YES | REQUIRED | REQUIRED |

**原則**
- “境界を跨ぐ”イベントは必ず INTERFACE_EVENT。
- WORLD_EVENT / DOMAIN_EVENT は outbox に入るものを指す（運用・監査対象）。

---

# 2. 命名規則（絶対固定）

## 2.1 event_type 形式
`<AREA>_<SUBJECT>_<ACTION>`

例：
- LIFE_SLEEP_RECORDED
- SALES_ORDER_CONFIRMED
- STREAMING_SESSION_STARTED
- PERSONA_MOOD_SHIFTED

## 2.2 禁止
- camelCase / kebab-case / snake_case(小文字)
- 空白、記号混在
- ACTIONだけ（UPDATED/CHANGED 等の汎用は禁止）
- AREA無し（衝突・検索不能）

---

# 3. 共通エンベロープ（全イベント共通：固定）

必須フィールド（全 class 共通）:

- event_id: uuid
- event_type: text
- event_version: int (>=1)
- occurred_at: timestamptz (ISO8601)
- payload: json object
- schema_hash: text (sha256 hex lowercase)

**固定ルール**
- payload は必ず JSON object（array/string/number を直置き禁止）
- occurred_at は “発生時刻” であり “処理時刻” ではない
- schema_hash は後述の生成ルールに従い必ず一致すること

---

# 4. INTERFACE_EVENT 追加必須（OS間イベント：固定）

INTERFACE_EVENT は上記に加えて必須:

- source_os: text
- target_os: text
- signature: text

**固定ルール**
- source_os/target_os は “OS識別子” として固定文字列を使う（例: "erp-system", "persona-system"）
- signature は後述の署名対象JSONに対して生成する
- 署名/検証をバイパスする経路は禁止（境界入口は persona/integration のみ）

---

# 5. schema_hash 生成ルール（絶対固定）

## 5.1 何をハッシュするか
**JSON Schema 本体（Draft 2020-12）の canonical JSON** を対象にする。

- 対象: 当該イベントの schema JSON 全文
- 対象外: コメント、ファイル名、改行など（= JSON以外）

## 5.2 canonical JSON（固定）
schema_hash は **次の canonicalization** の後に sha256 を取る。

canonicalization:
1) UTF-8（BOMなし）
2) JSONをパースして “論理値” として保持
3) object の key を辞書順（Unicode codepoint順）で再帰的にソート
4) 数値はJSONとして同値を保つ範囲で表現を正規化（指数表記の揺れ禁止）
5) 余分な空白・改行なしで最小JSONとしてシリアライズ

hash:
- sha256(canonical_json_bytes_utf8)
- hex lowercase（64文字）

※ 生成関数の実装は言語に依存するが、上記手順は不変。

---

# 6. Version戦略（絶対固定）

## 6.1 互換あり（MINOR扱い）
- optional field の追加
- enum の追加（既存値を壊さない）
- descriptionの変更

→ event_version は据え置き（=同じ schema_hash は変わる可能性があるが、互換ありの範囲でのみ許容）
→ ただし **schema_hash が変わる場合は Compatibility Table に追記が必須**

## 6.2 互換なし（MAJOR扱い）
以下は **互換破壊**：

- field削除
- 型変更（string→int等）
- required の追加
- 意味変更（同名keyの意味を変える）
- payload構造の再編

→ event_version を +1  
→ 旧versionと共存（最低1世代は受け入れ可能にする）

## 6.3 禁止
- versionを上げずに互換破壊
- “後から required を足す” のに version固定
- schema無し運用（WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT で schema無しは禁止）

---

# 7. Idempotency（絶対固定）

## 7.1 event_id
- event_id は UUID（v4推奨）で一意
- 同一event_id の二重適用は禁止

## 7.2 apply側の原則
- “processed_event_log（または同等の記録）” を持ち、
  event_id が存在する場合は skip（冪等）

**INTERFACE_EVENT は必ず冪等であること（境界で再送が起こり得るため）。**

---

# 8. Event Catalog 保管規約（絶対固定）

## 8.1 ディレクトリ（Persona worlds）
- worlds/<world>/event-catalog/<EVENT_TYPE>/v<version>.schema.json
- worlds/<world>/event-catalog/<EVENT_TYPE>/compatibility.md

例:
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/v1.schema.json
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/v2.schema.json
- worlds/life/event-catalog/LIFE_SLEEP_RECORDED/compatibility.md

## 8.2 ディレクトリ（ERP domains）
- domains/<domain>/event-catalog/<EVENT_TYPE>/v<version>.schema.json
- domains/<domain>/event-catalog/<EVENT_TYPE>/compatibility.md

## 8.3 INTERFACE_EVENT の保管
- integration/interface-events/<EVENT_TYPE>/v<version>.schema.json
- integration/interface-events/<EVENT_TYPE>/compatibility.md

---

# 9. Compatibility Table（互換性テーブル：絶対固定）

**目的**
- 受け入れ可能versionの一覧を “正本” として残す
- schema_hash の差分（互換 or 破壊）を追跡する
- “どのversionをいつまで受け入れるか” を明記する

**必須列**
- event_type
- event_version
- schema_hash
- compatibility: COMPATIBLE / BREAKING
- introduced_at (date)
- deprecated_at (date or blank)
- notes

---

# 10. Registry 登録手順（設計手順：固定）

WORLD_EVENT / DOMAIN_EVENT / INTERFACE_EVENT を追加・変更する際の手順：

1) event_type を命名規則で決める
2) v1.schema.json を作る（templates参照）
3) schema_hash を算出し、compatibility table に追記する
4) event-catalog に格納する（規約パス厳守）
5) (Personaの場合) persona-system/core/event-registry に “許可event” として登録する
6) (Interfaceの場合) integration 側で署名対象に含め、検証を強制する
7) 互換破壊なら v+1 を作り、旧も受け入れ可能期間を明記する

---

# 11. Freeze（Event標準の凍結）

Tier 0（Hard Freeze）
- 本書の分類・必須フィールド・命名規則
- schema_hash生成ルール
- INTERFACE_EVENT の署名対象フィールド定義
- Compatibility Table 必須列

Tier 1（Controlled）
- event_registry の route / weight / 受け入れversion範囲

Tier 2（Flexible）
- payloadの詳細追加（互換範囲内）
- world/domain固有の追加仕様（ただし本標準を破らない）

