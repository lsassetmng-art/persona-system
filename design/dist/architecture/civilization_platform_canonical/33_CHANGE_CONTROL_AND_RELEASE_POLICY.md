# 33 Change Control and Release Policy（変更管理 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
設計→実装の乱れ（途中でバタバタ）を再発させないための凍結/変更管理を固定する。

---

# 1. 変更区分
- Design Change: 本正本群の更新（GO/STOP必須）
- Additive Implementation: 既存破壊なし（先頭ガード追加/カラム追加）
- Breaking Change: version++ を伴う（原則次フェーズ）

---

# 2. 承認フロー
- Boss: GO/STOP
- 佐藤（DB担当）: DDL/関数レビュー必須
- Zero: 統合・計画・差分整理

---

# 3. リリース手順（推奨）
1) maintenance_mode=1（対象OS）
2) DDL/関数適用（Additive）
3) E2Eテスト（T1〜T5）
4) maintenance_mode=0
5) 段階的に ingest/dispatch/apply を戻す

---

# 4. ロールバック原則
- 可能なら “スイッチで戻す”（system_control）
- DDLロールバックは原則しない（前進のみ）
