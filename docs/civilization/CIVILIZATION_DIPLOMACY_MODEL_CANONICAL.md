# ============================================================
# CIVILIZATION DIPLOMACY MODEL (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
文明間関係（同盟・中立・敵対・貿易）を行列として保持し、イベントで更新する。

------------------------------------------------------------
1. RELATION TYPES
------------------------------------------------------------
- ALLIED
- FRIENDLY
- NEUTRAL
- TENSE
- HOSTILE
- SANCTIONED
- AT_WAR

------------------------------------------------------------
2. UPDATE RULES (DAILY)
------------------------------------------------------------
Relation score changes by:
- trade balance
- treaty compliance
- misinformation waves (abstract)
- war escalation
- humanitarian aid

------------------------------------------------------------
3. OUTPUT EVENTS
------------------------------------------------------------
- diplomacy.relation_changed
- diplomacy.treaty_proposed
- diplomacy.treaty_signed
- diplomacy.sanction_applied

------------------------------------------------------------
END
------------------------------------------------------------
