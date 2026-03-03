# 26 Control Matrix by OS（制御マトリクス 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
system_control の各キー（os/dispatch/apply/ingest/maintenance）を、
OS×経路（ingest/dispatch/apply/execution）で必須化する。

---

# 1. キー定義（再掲）
- maintenance_mode: '1' → 原則書き込み禁止（最優先）
- os_enabled: '0' → 全停止
- ingest_enabled: '0' → 境界入力停止
- dispatch_enabled: '0' → outbox dispatch停止
- apply_enabled: '0' → state mutate停止

---

# 2. Persona Project（PERSONA_DATABASE_URL）制御マトリクス

## 2.1 Civilization（Dispatcher）
- 参照: civilization.system_control
- 参照: <world_schema>.system_control（world単位停止）

必須ガード（推奨順）:
1) assert_not_in_maintenance('civilization')
2) assert_os_enabled('civilization')
3) assert_dispatch_enabled('civilization')
4) for each world:
   - assert_os_enabled(world_schema)
   - assert_dispatch_enabled(world_schema)

## 2.2 PersonaOS（Apply）
必須ガード:
1) assert_not_in_maintenance('personaos')
2) assert_os_enabled('personaos')
3) assert_apply_enabled('personaos')

## 2.3 Integration（Ingest/Translate）
必須ガード:
1) assert_not_in_maintenance('integration')
2) assert_os_enabled('integration')
3) assert_ingest_enabled('integration')
4) signature_verified=true gate（必須）

## 2.4 Life/Game/Streaming/Business(軽量)
経路別:
- ingest: ingest_enabled
- dispatch: dispatch_enabled
- apply/execution: apply_enabled（state mutateがある場合）
- maintenance/os: 常に先頭

---

# 3. ERP Project（DATABASE_URL）制御マトリクス
ERPはドメイン分割（sales/purchase/accounting/inventory/approval/workflow/finance/hr …）

## 3.1 ドメインExecution（確定/状態遷移）
必須ガード（推奨順）:
1) assert_not_in_maintenance('<domain>')
2) assert_os_enabled('<domain>')
3) その関数が「dispatch」なら assert_dispatch_enabled
4) 「ingest」なら assert_ingest_enabled
5) 「apply」なら assert_apply_enabled

---

# 4. 合格条件
- キー欠落/テーブル欠落でも fail-closed（停止）
- maintenance が最優先で効く
- PersonaとERPで「停止の意味」が一致する
