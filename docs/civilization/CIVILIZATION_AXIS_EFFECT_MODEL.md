# ============================================================
# CIVILIZATION AXIS EFFECT MODEL
# ============================================================
status: canonical
scope: civilization.persona.axis.effect.model
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
文明イベントを「能力軸（axis）」へ落とす正本マッピング。

## 1. Canonical Axes (example)
- leadership
- resilience
- empathy
- discipline
- strategy
- creativity

## 2. Mapping Table (abstract)
- WAR_*           -> leadership/resilience/strategy
- DISASTER_*      -> resilience/discipline
- EDUCATION_*     -> creativity/discipline
- ECONOMY_*       -> strategy/discipline
- DIPLOMACY_*     -> empathy/strategy

## 3. Safety
- only bounded magnitudes 1..100
- no sensitive content in reasons
