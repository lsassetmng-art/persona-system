# 18 AI Employee Formal Specification（AI社員 正式仕様）
status: FROZEN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

---

# 0. 定義

AI社員とは：
PersonaOS に属する Persona が、
BusinessOS / ERP OS に対して
提案・診断・分析を行う存在。

AI社員は「実行主体ではない」。

---

# 1. 役割階層（責任モデル）

R3 = 現実確定（ERP / Business）
R2 = 認知処理（Persona / Integration）
R1 = 表現/補助（Life/Game/Streaming）

AI社員は R2 に属する。
R3 に直接作用してはならない。

---

# 2. AI社員の行為タイプ

AI社員が出せるものは以下のみ：

1) SUGGESTION
2) DIAGNOSIS
3) CONSULT_RESULT
4) RISK_ALERT
5) PERFORMANCE_REPORT

すべて「非確定」。

---

# 3. ERPに関与する公式フロー

■ 正式経路

ERP/Business → Integration → PersonaOS → Business Approval → ERP Execution

詳細：

① ERP/Business が FACT_EVENT を生成（署名付き）
② Integration が検証・翻訳
③ PersonaOS が分析
④ AI社員が提案を生成（署名付き）
⑤ BusinessOS が approval_flow を通す
⑥ 承認後のみ ERP が Execution 実行

AI社員が直接 Execution を呼ぶことは禁止。

---

# 4. AI社員の署名仕様

AI社員の出力は必ず：

- persona_snapshot.signature
- persona_signing_key
- event_version
- source_os = "personaos"

を含む。

署名対象 canonical JSON：

{
  event_id,
  event_type,
  event_version,
  persona_id,
  user_id,
  payload,
  occurred_at
}

署名アルゴリズム：
Ed25519

---

# 5. 権限モデル

AI社員にはロールが付与される。

例：

- AI_CONSULTANT
- AI_ANALYST
- AI_AUDITOR
- AI_OPERATOR

しかしこれらは「提案権限」であり、
実行権限ではない。

---

# 6. AI社員が実行に関与できる唯一の例外

以下のみ許可：

■ AUTO_EXECUTION_MODE（限定運用）

条件：

1) BusinessOS の approval_flow_definition に
   auto_approve_ai = true が設定されている
2) risk_level = LOW
3) system_control.auto_exec_enabled = 1
4) 監査ログが有効

この場合のみ、
AI提案が即 Execution に昇格する。

ただし：

- すべて audit_trail に保存
- rollback可能な行為のみ許可

金銭確定系は禁止。

---

# 7. AI社員の監査義務

すべてのAI提案は：

- personaos.persona_action_log
- business.decision_log
- shared.dispatcher_run_log

に記録される。

最低保存期間：
7年（R3関与時）

---

# 8. 停止可能性

以下が 0 の場合、AI社員は停止：

personaos.system_control.os_enabled
personaos.system_control.apply_enabled
business.system_control.os_enabled

Integration が停止した場合も停止。

---

# 9. 責任分離

AI社員は「助言者」であり、
最終責任は：

- 承認者（人間）
- 組織（法人）
- Execution主体（ERP）

に帰属する。

---

# 10. 禁止事項

AI社員は以下をしてはならない：

- ERPテーブルへの直接書き込み
- approvalをバイパス
- 署名なし出力
- event_version 無し出力
- source_os 偽装
- 自己承認

---

# 11. 将来拡張余地

将来的に：

- AI社員の「信用スコア」
- 成功率ベース weight 調整
- AI社員ランキング
- Cross-world AI派遣

は追加可能。

ただし責任階層は破らない。

---

# 12. 凍結宣言

AI社員は R2存在であり、
R3を直接変更しない。

文明の安全原則として固定する。

