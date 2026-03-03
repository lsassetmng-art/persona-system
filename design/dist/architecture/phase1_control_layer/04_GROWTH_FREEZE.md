# 04 Growth Freeze（最終防御停止）設計正本
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
review: 佐藤（DB担当）
last_updated: 2026-02-28

## ゴール
人格状態の更新（apply）を “最後の防波堤” として止める。
事故や暴走時に文明の状態破壊を防ぐ。

---

## 制御キー（system_control）
- growth_apply_enabled = "1" / "0"

---

## 適用ポイント
- persona_apply の入口でチェックし、0なら拒否
- dispatcher は失敗扱い（retry）として戻す（mark_retry）

---

## 返却コード（推奨）
- 503 Service Unavailable（運用停止）
または
- 423 Locked（凍結の意味が強い場合）

---

## 監査（必須）
- apply_run_log に「freezeで拒否」を記録
- Edge logs に JSON で出す（検索しやすく）

---

## 非目標
- growth_events 書き込み自体をDBトリガで止める（強すぎるため。まずEdgeで止める）
