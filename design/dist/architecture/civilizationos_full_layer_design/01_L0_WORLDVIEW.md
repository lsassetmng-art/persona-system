# L0 世界観・責任境界（憲法）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero

## 定義
- ERP: 現実の個人/企業が使う。中身は現実の経営情報（責任世界）。
- PersonaOS: 現実の個人/企業が使う。中身は非現実の情報（文明世界）。
- AI社員: PersonaOS由来の主体が、ERPに“来て仕事をする”ことがある。

## 絶対原則
1) 混ぜない：ERPデータとPersonaデータは同一DB/同一スキーマに置かない。
2) 直結しない：DB直結・service_role共有・相互参照は禁止。
3) 責任逆流禁止：Personaの推論/感情がERPの確定情報を書き換えない。
4) 双方向は“境界層”を経由：Interface Layerで署名/監査/承認を統制する。

## 設計上の結論
- ERPは「実行系OS（Reality）」。
- PersonaOSは「思考系OS（Civilization）」。
- 双方向橋渡しは「Interface Layer」が唯一の道。

