# Civilization Operations Runbook
status: canonical
scope: civilization.ops
owner: Boss
prepared_by: Zero

## Run States
- simulation_enabled: true/false
- domain_enabled: economy/war/diplomacy/disaster/tech/etc.

## Standard Ops
- run tick
- create checkpoint
- replay range
- freeze on divergence
- resume after admin decision

## Incident Basics
- classify: divergence / data corruption / gate misconfig
- always produce: incident report + run_id + tick_id range
