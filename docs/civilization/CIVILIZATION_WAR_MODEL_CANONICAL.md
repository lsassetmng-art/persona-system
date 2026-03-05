# ============================================================
# CIVILIZATION WAR MODEL (CANONICAL)
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Goal:
文明間の戦争・抑止・終戦を抽象モデルとして再現する（手口の具体化は禁止）。

------------------------------------------------------------
1. PRINCIPLES (SAFETY)
------------------------------------------------------------
- No tactical instructions / no real-world actionable guidance.
- Only abstract categories, probabilities, and outcomes.

------------------------------------------------------------
2. STATES
------------------------------------------------------------
PEACE
TENSION
CONFLICT
WAR_LIMITED
WAR_TOTAL
CEASEFIRE
POSTWAR_STABILIZATION

Transitions are driven by:
- diplomacy events
- economic stress
- misinformation waves (abstract)
- provocations (abstract)

------------------------------------------------------------
3. WAR COSTS
------------------------------------------------------------
War reduces:
- stability_index
- productivity
- population (death/refugee)

War increases:
- treasury stress
- sanctions risk

------------------------------------------------------------
4. TERMINATION
------------------------------------------------------------
Termination outcomes:
- ceasefire treaty
- total defeat settlement
- regime change (abstract)
- federation break / merge (abstract)

------------------------------------------------------------
5. OUTPUT EVENTS
------------------------------------------------------------
- war.state_changed
- war.casualty_estimate_updated (abstract)
- war.refugee_wave
- war.sanctions_triggered
- war.treaty_signed

------------------------------------------------------------
END
------------------------------------------------------------
