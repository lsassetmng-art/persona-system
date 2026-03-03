# 24 Maintenance Mode Policy（保守モード 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
maintenance_mode='1' のときの「許可される操作/禁止される操作」を固定し、
障害対応や移行時に確実に安全側へ倒す。

---

# 1. 原則
- maintenance_mode='1' では原則 “書き込み禁止”
- 例外は最小限（停止解除・監査・DLQ退避など）

---

# 2. 禁止（例）
- ERP: 受注確定/出荷確定/会計仕訳確定/棚卸反映
- Persona: persona_state mutate / growth apply / snapshot発行（原則停止）
- Integration: 外部イベント採用（停止）

---

# 3. 例外（許可し得る）
- system_control の更新（解除作業）
- 監査ログの書き込み（障害解析）
- DLQ退避（状態悪化を防ぐための退避のみ、再実行は不可）
- READ ONLY 参照

---

# 4. 解除手順（推奨）
1) maintenance_mode='0'
2) os_enabled='1'
3) ingest/dispatch/apply を順に戻す（必要範囲のみ）

---

# 5. 禁止事項
- 保守中に auto-exec を有効化（禁止）
- “保守なのに書ける”抜け道を残す（禁止）
