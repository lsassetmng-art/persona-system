# =========================================================
# CivilizationOS / Civil Core（トリプル）設計正本 v1.0
# =========================================================
status: CANONICAL
phase: A-B-C (CCI / Earth Success DB / Intervention Algo)
personaos: FROZEN (READ ONLY)
db: PERSONA_DATABASE_URL
owner: Boss
prepared_by: Zero

------------------------------------------------------------
0. 目的
------------------------------------------------------------
Civil Core（トリプル）は PersonaOS 内部世界の「文明バランス」を維持する。
ただし直接介入（個人書換）はしない。
提案は governance スキーマのイベント(outbox)として発火し、人間管理チームの承認で初めて適用される。

------------------------------------------------------------
1. 前提（絶対）
------------------------------------------------------------
- personaos スキーマは凍結（構造変更禁止）
- cross-schema 直接更新禁止（personaos へのUPDATE禁止）
- Civil Core は READ を personaos から行い、WRITE は governance のみ
- 人間管理チーム命令が最優先（提案より上位）

------------------------------------------------------------
2. 成功定義（E:複合評価）固定
------------------------------------------------------------
Earth Composite Success Index（ECSI）思想を Persona世界に転用し、
Persona世界の複合指数 Civil Composite Index（CCI）で文明状態を評価する。

評価軸（Persona世界の観測軸例）:
- relationship_score_avg
- stability_avg
- innovation_index（curiosity等）
- economic_flow（将来 commerce へ）
- burnout_ratio（将来 burnout_level等へ）
- inequality_gap（格差）
- resilience_index（回復性）

重みは governance.cci_weight で管理（可変/監査対象）。

------------------------------------------------------------
3. A: CCI算出（READ集計）
------------------------------------------------------------
- 集計ソース: personaos.growth_core_state（READ ONLY）
- 出力: governance.v_cci_components / governance.v_cci_latest
- CCIは「現時点の世界状態」を表す指標。過去推移は governance.cci_snapshot へ保存可能（将来）。

------------------------------------------------------------
4. B: Earth成功事例DB（パターン庫）
------------------------------------------------------------
- governance.earth_success_case:
  地球史/管理者世界の成功事例を「軸スコア + タグ + 推奨ポリシー候補」で保存
- governance.earth_policy_recipe:
  成功事例から導出される「提案テンプレ（policy_key + payload）」を複数持てる

※事例はユーザーデータではない（公開知識/管理者世界知識のみ）。

------------------------------------------------------------
5. C: 介入アルゴリズム（提案＝イベント）
------------------------------------------------------------
- governance.triple_evaluate_and_emit():
  - governance.v_cci_latest を評価
  - 閾値/目標レンジから逸脱した場合のみ
  - Earth成功事例（earth_success_case / earth_policy_recipe）から提案を組み立て
  - governance.governance_event_outbox に event を INSERT（PENDING）

出力イベント例:
- event_type: governance.triple.proposal
- payload:
  - cci, components
  - reasons
  - recommended_policies[]
  - source_cases[]

※この関数は personaos に書き込まない（READのみ）。

------------------------------------------------------------
6. 人間優先（上書き原則）
------------------------------------------------------------
- 管理チームが「停止/保留/別案」を指示した場合、提案は無効化される。
- 無効化は governance 側の承認フロー（将来）で実装する。

# END
