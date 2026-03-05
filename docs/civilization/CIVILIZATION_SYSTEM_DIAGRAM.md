# ============================================================
# CIVILIZATION SYSTEM DIAGRAM
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS 全体構造を崩れないテキスト図で固定する。

------------------------------------------------------------
TOP LEVEL
------------------------------------------------------------

Human Admin / Governance
        |
        v
+-----------------------------+
|        GOVERNANCE LAYER     |
| gates / approvals / audit   |
+--------------+--------------+
               |
               v
+-----------------------------+
|            RUNTIME          |
| scheduler -> tick -> dispatch|
| -> apply -> checkpoint       |
| -> snapshot -> monitoring    |
+--------------+--------------+
               |
               v
+-----------------------------+
|          EVENT SYSTEM       |
| schema_hash + signature      |
| retry / dead / quarantine    |
+------+------------------+---+
       |                  |
       v                  v
+--------------+    +--------------+
|  SIMULATION  |    |     ERP      |
| pop/econ/war |    | business dom |
+------+-------+    +------+-------+
       |                  |
       | WORLD_EVENT       | INTERFACE_EVENT (signed)
       v                  v
+-----------------------------+
|          APPLY ENGINE       |
| (only mutator of projections)|
+--------------+--------------+
               |
               v
+-----------------------------+
|           PERSONAOS         |
| persona_state + snapshot     |
| Ed25519 + canonical JSON     |
+--------------+--------------+
               |
               v
+-----------------------------+
|     EXTERNAL APPLICATIONS   |
| consume snapshot only       |
+-----------------------------+

------------------------------------------------------------
END
------------------------------------------------------------
