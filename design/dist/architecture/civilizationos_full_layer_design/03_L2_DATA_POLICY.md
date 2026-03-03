# L2 データ分類・配置ポリシー（何をどこに置くか）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## データ分類
### ERP（Reality）
- 財務/会計/販売/購買/在庫/人事/監査などの現実業務情報
- 法的・金銭的・実務責任が伴う

### PersonaOS（Civilization）
- persona_state / growth / emotion / snapshot / visualなどの非現実情報
- 物語・人格・文明指標

## 禁止
- ERPにpersona_stateを保存しない
- PersonaOSに現実の経営データをコピーしない（必要なら集計/匿名化/最小化したイベントのみ）

## 共有方法（唯一）
- 署名付きイベント
- 境界層での提案（Suggestion）と承認（Approval）
