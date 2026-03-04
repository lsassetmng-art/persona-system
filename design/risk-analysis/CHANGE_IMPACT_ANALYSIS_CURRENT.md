# Change Impact Analysis (Current)

## Core Impact Nodes (High Blast Radius)

1. persona-state-apply
   Affects:
   - growth_events
   - snapshot-issue
   - Civilization pipeline
   Risk: SYSTEM LEVEL

2. visual-upload
   Affects:
   - visual_assets
   - Storage
   - Snapshot integrity

3. snapshot-issue
   Affects:
   - persona_snapshot
   - snapshot-verify
   Risk: Trust Chain Break

4. civilization-event-dispatcher
   Affects:
   - All persona updates
   Risk: Global system disruption

------------------------------------------------------------

## Medium Impact Nodes

- approval-action
- publish_apply
- sign-event

------------------------------------------------------------

## Low Impact Nodes

- keys-by-id
- asset-publish-list
- revocation-list
