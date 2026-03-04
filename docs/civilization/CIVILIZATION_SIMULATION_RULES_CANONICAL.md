# Civilization Simulation Rules (Canonical)
status: canonical
scope: civilization.rules
owner: Boss
prepared_by: Zero

## Non-destruction Rule
- No civilization can be fully erased by simulation.
- Collapse is represented as fragmentation, loss of sovereignty, or governance failure.

## Migration Rule
- Migration has cooldowns and trust decay.
- Stateless zone absorbs shocks (refugees, informal economy growth).

## Market Rule
- Each civilization has its own currency.
- FX is influenced by:
  - trade balance
  - war risk
  - inflation
  - sanctions
- FX cannot be perfectly stable unless forced by treaty/policy.

## War Rule
- War increases:
  - casualties (population decrease)
  - inflation
  - corporate bankruptcy risk
- War ends via:
  - ceasefire
  - treaty
  - regime change
- Proxy wars preferred over total wars.

## Tech Rule
- Breakthrough probability increases with:
  - education level
  - R&D investment
  - stability (to a point; mild competition helps)
- AI regulation can reduce tech growth but increase stability.

## Governance Rule
- Laws are activated/deactivated (no hard delete).
- Sanctions are policy events with clear start/end and measurable effects.

## Logging Rule
- Every tick emits:
  - tick_summary
  - metrics
  - conflict_report (if any)
