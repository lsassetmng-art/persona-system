# ============================================================
# CIVILIZATION OS MASTER DIAGRAM
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Bible最終ページ用：Civilization OS を1枚で説明する。

------------------------------------------------------------
FLOW (ONE LINE)
------------------------------------------------------------
scheduler -> tick -> event_gen -> dispatcher -> apply -> checkpoint -> snapshot -> consumers

------------------------------------------------------------
BOUNDARIES (CANONICAL)
------------------------------------------------------------
- PersonaOS is the only owner of persona state.
- Civilization never directly mutates persona state.
- ERP/Civilization communication is signed events only.
- Apply Engine is the only mutator per domain.
- Snapshot is immutable; sync = re-issue only.
- Validation is fail-closed.

------------------------------------------------------------
END
------------------------------------------------------------
