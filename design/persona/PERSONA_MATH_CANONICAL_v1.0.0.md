# ============================================================
# CIVILIZATION OS – PERSONA MATH CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Persona Core Internal Mathematics
# Owner: Boss
# ============================================================

This document defines:

- Axis Model
- Emotion Vector Model
- Growth Model
- Decay Model
- Weight Application Formula
- Saturation & Normalization Rules

Pure deterministic. Replay-safe.

============================================================
1. AXIS MODEL (Long-term Traits)
============================================================

1.1 Axis Set (Fixed)

Persona Core defines exactly 6 base axes:

1. vitality      (生命力)
2. intellect     (知性)
3. discipline    (規律)
4. social        (社会性)
5. creativity    (創造性)
6. stability     (精神安定)

Fixed size: 6
Adding/removing axes is a MAJOR change.

------------------------------------------------------------
1.2 Axis Range
------------------------------------------------------------

Each axis is continuous float:

0.0 ≤ axis ≤ 100.0

- 0   = absence
- 50  = neutral human baseline
- 100 = theoretical peak

No negative values.
No overflow allowed.

------------------------------------------------------------
1.3 Saturation Rule (Soft Cap)
------------------------------------------------------------

Soft saturation near upper bound:

new_value = old_value + Δ

If new_value > 100:
  new_value = 100 - (100 - old_value) * 0.1

If new_value < 0:
  new_value = 0

============================================================
2. EMOTION VECTOR MODEL (Short-term Reaction)
============================================================

Emotion is not a persistent axis.
It is a decaying vector.

------------------------------------------------------------
2.1 Emotion Dimensions
------------------------------------------------------------

4D vector:

- joy
- anger
- fear
- sadness

Range:
-100.0 ≤ emotion ≤ +100.0

0 = neutral
Positive/negative allowed.

------------------------------------------------------------
2.2 Emotion Apply
------------------------------------------------------------

emotion_new = emotion_old + emotion_delta

Then clamp to [-100, 100].

------------------------------------------------------------
2.3 Emotion Decay
------------------------------------------------------------

Exponential decay per apply cycle:

emotion(t+1) = emotion(t) × 0.90

Decay rate fixed at 10% per cycle.

============================================================
3. GROWTH MODEL (Long-term Progression)
============================================================

Growth accumulates through axis changes.

------------------------------------------------------------
3.1 Growth Score
------------------------------------------------------------

Each axis has a hidden growth_score contribution:

growth_score += abs(delta_axis)

Total growth is:

total_growth_score = sum(growth_score over all axes)

------------------------------------------------------------
3.2 Level Function (Non-linear)
------------------------------------------------------------

Persona Level L:

L = floor( sqrt(total_growth_score) / 5 )

Rationale:
- Fast early progress
- Slower at higher levels
- Stable monotonic growth

============================================================
4. WEIGHT APPLICATION FORMULA
============================================================

All WORLD_EVENT deltas computed as:

Δ = base_value × world_weight × persona_modifier

------------------------------------------------------------
4.1 world_weight
------------------------------------------------------------

Default: 1.0
Range: 0.0 – 2.0
World cannot exceed 2.0.

------------------------------------------------------------
4.2 persona_modifier
------------------------------------------------------------

Derived from stability axis:

persona_modifier = 0.5 + (stability / 100)

Range: 0.5 – 1.5

Higher stability increases controlled adaptation.

============================================================
5. CROSS-AXIS / EMOTION INFLUENCE
============================================================

Fixed influence coefficients:

- vitality   → stability   : 0.20
- intellect  → creativity  : 0.15
- discipline → stability   : 0.25
- social     → joy         : 0.30

Influence applied as secondary delta:

secondary_delta = primary_delta × factor

============================================================
6. ORDER OF APPLY (Strict)
============================================================

For each event:

1. Compute primary axis delta
2. Apply cross-axis influence (secondary deltas)
3. Apply emotion delta
4. Apply saturation/clamp
5. Update growth_score
6. Apply emotion decay

No deviation allowed.

============================================================
7. DETERMINISM GUARANTEE
============================================================

Forbidden:
- Randomness
- Time-based scaling
- External I/O
- Non-deterministic ordering

Floating drift control:
After each step, apply:

round(value, 4)

============================================================
8. SYSTEM INVARIANTS
============================================================

- Axis always within [0, 100]
- Emotion always within [-100, 100]
- Growth monotonically increases
- Level never decreases
- Apply is pure function

Violation = constitutional breach.

============================================================
END OF PERSONA MATH CANONICAL v1.0.0
============================================================

