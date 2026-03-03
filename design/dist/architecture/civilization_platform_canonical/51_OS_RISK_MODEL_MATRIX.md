# 51 OS Risk Model Matrix（OS別リスク行列 正本）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 目的
OSごとに「許せる行為」の最大リスクを固定し、設計ブレを止める。

---

# 1. risk_level（共通）
0: READ ONLY（参照のみ）
1: RECORD ONLY（提案/診断の記録。状態を変えない）
2: REQUEST（承認要求/pending化。確定しない）
3: DRAFT/RESERVE（下書き/予約。取消可能）
4: COMMIT REALITY（現実確定：原則AI禁止）
5: MONEY/LEGAL（資金/法務確定：禁止）

---

# 2. OS別最大リスク（デフォルト）
- ERP (erpos): max 2（REQUESTまで）※4/5禁止
- BusinessOS: max 3（DRAFTまで）
- StreamingOS: max 3（配信操作/予約まで）
- GameOS: max 3（世界内状態更新は可、ただし現実には影響しない）
- LifeOS: max 2（提案/申請まで）
- GovernanceOS: max 1（提案/評価のみ）
- SystemOS: max 1（記録・点検のみ。実行は人間）

---

# 3. Human Gate（原則）
- risk>=2 の行為はOSにより人間承認が必要
- ERPは常に人間承認（例外は設計で明示しない限り禁止）

