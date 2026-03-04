# Civilization Event Taxonomy
status: canonical
scope: civilization.events
owner: Boss
prepared_by: Zero

## Categories
A) Geophysical / Disaster
- disaster.earthquake
- disaster.flood
- disaster.storm
- disaster.drought
- disaster.pandemic

B) Political / Governance
- politics.election
- politics.coup
- politics.regime_change
- politics.law_enacted
- politics.law_repealed (soft; law becomes inactive)

C) War / Conflict
- war.declare
- war.battle
- war.ceasefire
- war.treaty
- war.proxy_conflict

D) Economy / Market
- econ.fx_shock
- econ.inflation_spike
- econ.recession
- econ.boom
- econ.trade_dispute
- econ.sanctions_imposed
- econ.sanctions_lifted

E) Corporate
- corp.found
- corp.merge
- corp.bankruptcy
- corp.nationalized
- corp.scandal

F) Society
- society.migration_wave
- society.unrest
- society.crime_spike
- society.education_reform
- society.healthcare_reform

G) Tech
- tech.breakthrough
- tech.adoption
- tech.ai_regulation
- tech.ai_termination (special; governance-bound)

## Severity
- 1..20 minor
- 21..50 moderate
- 51..80 major
- 81..100 civilization-shaping

## Safety
For violence-related events:
- no procedural “how-to” details
- only abstract outcomes and categories
