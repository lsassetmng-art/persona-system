# 25 Guard Functions DDL Spec（DBガード関数 仕様正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
system_control を「実際に止める」ためのDBガード関数を共通化し、
すべての実行系RPC/関数の先頭で同一の停止判定を行えるようにする。

- Fail-Closed（読めない/存在しない/値不正 → 停止扱い）
- エラーコードとメッセージを統一
- schema-local system_control を参照する

---

# 1. 配置
- 関数は ERPプロジェクトでは core スキーマに置く（core.*）
- Personaプロジェクト側は civilization または personaos でも良いが、
  “共通ガード”としては core 相当スキーマを用意するのが望ましい
  （ただし本仕様は関数契約を定めるだけで配置はプロジェクト裁量）

---

# 2. 共通インターフェース（固定）

## 2.1 基本ユーティリティ
### core.get_control_value(p_schema text, p_key text) returns text
- system_control が無い / key が無い → NULL
- 例外は投げない（上位で fail-closed）

### core.assert_control_enabled(p_schema text, p_key text, p_label text) returns void
- v = get_control_value(...)
- v が '1' 以外（NULL含む）→ 例外
- message: '<label> <schema> is disabled'
- ERRCODE: 'P0001'

---

## 2.2 個別ガード（API）
### core.assert_os_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'os_enabled','OS')

### core.assert_dispatch_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'dispatch_enabled','DISPATCH')

### core.assert_apply_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'apply_enabled','APPLY')

### core.assert_ingest_enabled(p_schema text) returns void
- assert_control_enabled(p_schema,'ingest_enabled','INGEST')

### core.assert_not_in_maintenance(p_schema text) returns void
- v = get_control_value(p_schema,'maintenance_mode')
- v = '1' → 例外
- message: 'MAINTENANCE <schema> is enabled'
- ERRCODE: 'P0001'

---

# 3. 判定優先順位（推奨）
実行系RPCの先頭での推奨順：

1) core.assert_not_in_maintenance('<schema>')
2) core.assert_os_enabled('<schema>')
3) （用途に応じて）
   - dispatch path: core.assert_dispatch_enabled('<schema>')
   - apply path: core.assert_apply_enabled('<schema>')
   - ingest path: core.assert_ingest_enabled('<schema>')

---

# 4. 適用ルール（必須）
- “現実確定”に関わる関数は必ず上記ガードを先頭に置く
- 変更は「先頭にPERFORM追加」のみ（ロジックは変えない）
- Fail-Closedを壊すような例外握りつぶしは禁止

---

# 5. 監査（推奨）
DB例外は呼び出し側で捕捉される。
呼び出し側（Edge/アプリ）は best-effort で以下を記録する：

- event_id / correlation_id
- schema
- guard_name
- error_message

---

# 6. テスト要件（必須）
T1（停止）で以下が成立すること：

- os_enabled='0' → 実行系関数が例外で停止
- maintenance_mode='1' → 書き込み系が停止
- key欠落/テーブル欠落 → 停止（fail-closed）

---

# 7. 禁止事項
- control_value を boolean に変更（文字列統一を破る）
- guardが存在するのに直接SELECTして判定する独自実装（統一崩壊）
- ERRCODE/メッセージのバラバラ運用

---

# 8. 凍結宣言
本仕様は system_control の実効性（本当に止める）を担保する中核であり、
全OSの停止設計を統一する正本として凍結する。

