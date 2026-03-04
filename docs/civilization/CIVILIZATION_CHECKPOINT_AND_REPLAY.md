# Checkpoint and Replay
status: canonical
scope: civilization.recovery
owner: Boss
prepared_by: Zero

## Checkpoints
- A checkpoint is a compact snapshot of derived world state at tick T.
- Created periodically (e.g., every 30 ticks) or on major events.

## Replay
- Replay = load checkpoint at T0, apply events T0..Tn.
- Determinism must produce identical tick summaries.

## Divergence Handling
- If divergence occurs:
  - freeze further ticks
  - generate divergence report
  - require admin decision (choose branch or reconcile)
