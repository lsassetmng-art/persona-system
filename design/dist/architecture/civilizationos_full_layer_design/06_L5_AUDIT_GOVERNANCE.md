# L5 監査・説明責任（Audit & Governance）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## なぜ必要か
- ERPは責任世界：監査が無いと運用できない
- PersonaOSは文明世界：説明責任が無いと暴走する
- Persona→ERP は特に高リスク（“介入”）

## 監査の必須項目（最低限）
- who: 実行主体（人/AI社員/システム）
- why: 理由（提案根拠/ポリシー/承認）
- what: 対象（entity/範囲/差分）
- when: 時刻（発生/承認/実行）
- how: 経路（ingest/dispatcher/apply）
- proof: 署名/承認ログ/スナップショット

## 二重ログの原則
- PersonaOS側：提案・推論・人格適用のログ
- ERP側：承認・実行・現実変更のログ
互いに参照せず、イベントIDで照合可能にする。

