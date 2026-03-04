# War Engine
status: canonical
scope: civilization.war
owner: Boss
prepared_by: Zero

## War Types
- military
- economic
- proxy
- civil

## State
- tension_score (0..100)
- active_conflicts list
- casualty_rate modifier
- supply_chain_risk modifier

## Rules
- no total annihilation
- conflicts resolve by:
  - ceasefire + treaty
  - regime change
  - exhaustion (stability collapse => forced negotiation)
