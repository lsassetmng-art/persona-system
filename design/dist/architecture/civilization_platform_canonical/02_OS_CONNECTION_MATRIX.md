# 02 OS接続マトリクス（公式）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## 接続の型（4種のみ）
1) FACT_EVENT: 署名付き事実イベント（Reality→Cognitiveが基本）
2) SUGGESTION: AI社員/文明からの提案（Cognitive→Realityが基本）
3) APPROVAL: 承認結果（Reality内、または Reality→Cognitive へ通知）
4) EXECUTION: 承認済み実行（Reality内の実行キュー。Cognitiveは“実行者”にならない）

## マトリクス（許可/禁止）
凡例:
- ✅ 許可（正規経路あり）
- ⚠️ 条件付き（承認/最小化/匿名化/制御層必須）
- ❌ 禁止（直結・責任逆流になる）

### Reality -> Cognitive（事実イベント）
- Business OS -> Integration OS : ✅ FACT_EVENT（署名/最小化）
- Life OS -> Integration OS     : ⚠️ FACT_EVENT（同意/最小化/プライバシー）
- Game OS -> Integration OS     : ✅ FACT_EVENT（結果イベントのみ）
- Streaming OS -> Integration OS: ✅ FACT_EVENT（配信結果/運用イベントのみ）

### Integration -> Cognitive（境界内配送）
- Integration OS -> Persona Core OS : ✅ FACT_EVENT（registry翻訳/weight適用）
- Integration OS -> Civilization OS : ✅ FACT_EVENT（world_registry/連邦配送）
- Integration OS -> Governance OS   : ⚠️ FACT_EVENT（統治評価用。最小化）

### Cognitive -> Reality（提案のみ）
- Persona Core OS -> Business OS : ⚠️ SUGGESTION（承認ゲート必須、直接更新禁止）
- Persona Core OS -> Life OS     : ⚠️ SUGGESTION（同意/安全）
- Persona Core OS -> Game OS     : ✅ SUGGESTION（演出/キャラ）
- Persona Core OS -> Streaming OS: ✅ SUGGESTION（台本/演出/キャラ）

### Governance（統治） -> 他
- Governance OS -> Persona Core OS : ✅ POLICY_EVENT（文明ポリシー適用）
- Governance OS -> Business OS     : ⚠️ POLICY_SUGGESTION（“推奨”としてのみ）
- Governance OS -> Integration OS  : ✅ CONTROL_POLICY（境界ポリシー配布）

## 禁止事項（固定）
- ❌ Cognitive から Reality への “直接DB書き込み”
- ❌ Reality の生データを Cognitive に “複製保管”
- ❌ OS間で service_role / secrets を共有
