# Diplomacy Engine
status: canonical
scope: civilization.diplomacy
owner: Boss
prepared_by: Zero

## Diplomacy State
- relations_score (civA,civB): -100..+100
- treaty set: trade, non-aggression, defense, tech-sharing
- sanctions set: active sanctions with scope + severity

## Update Drivers
- events: war, treaty, sanctions, propaganda, trade shocks
- cultural affinity modifier
- economic dependency modifier

## Outputs
- treaty proposals
- sanctions recommendations
- alliance shifts
