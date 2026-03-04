# PersonaOS Edge Dependency Matrix (Current Snapshot)

Legend:
CALL = calls another Edge
READ = reads table
WRITE = writes table
STORAGE = storage bucket
TOKEN = required internal token
EXT = external system

============================================================

## 1. persona-create
READ: none
WRITE: personas
TOKEN: JWT
CALL: none

## 2. persona-event-history
READ: persona_event_log
TOKEN: JWT

## 3. persona-state-apply
READ: event_registry, personas, growth_events, system_control
WRITE: growth_events, apply_run_log
CALL: snapshot-issue (optional)
TOKEN: x-internal-token
EXT: Civilization dispatcher input

## 4. sign-event
READ: world_signing_keys
WRITE: sign_log
TOKEN: INTERNAL_DISPATCH_TOKEN

## 5. visual-job-create
READ: personas
WRITE: visual_generation_jobs
TOKEN: JWT

## 6. visual-compose
READ: visual_generation_jobs
CALL: resolve_visual_bundle_v3 (RPC)
TOKEN: JWT

## 7. visual-upload
READ: visual_generation_jobs
WRITE: visual_assets, visual_generation_jobs
STORAGE: persona-generated
TOKEN: JWT

## 8. persona-auto-generate-part
WRITE: asset.layer, persona_part_overrides, ai_generation_log
CALL: visual-compose (optional)
CALL: approval-create (if global)
TOKEN: SERVICE_ROLE

## 9. persona_build_manifest
CALL: build_character_manifest RPC
TOKEN: SERVICE_ROLE

## 10. persona_background_get_signed_urls
STORAGE: asset-background
TOKEN: SERVICE_ROLE

============================================================

## Approval Layer

## 11. approval-create
WRITE: approval_request
TOKEN: JWT

## 12. approval-action
READ: approval_request
WRITE: approval_request
CALL: publish_apply
TOKEN: JWT

## 13. approval-sla
READ: approval_request
WRITE: approval_request
TOKEN: SERVICE_ROLE

## 14. asset-publish-request-create
WRITE: approval_request
TOKEN: JWT

## 15. asset-publish-request-decide
READ: approval_request
WRITE: approval_request
TOKEN: JWT

## 16. asset-publish-list
READ: approval_request
TOKEN: PUBLIC

## 17. publish_apply
READ: approval_request
WRITE: asset.layer OR personas
TOKEN: SERVICE_ROLE

============================================================

## Snapshot / Security

## 18. snapshot-issue
READ: personas
WRITE: persona_snapshot
TOKEN: PERSONAOS_ISSUE_TOKEN

## 19. snapshot-revoke
READ: persona_snapshot
WRITE: persona_snapshot, persona_snapshot_revocation
TOKEN: x-internal-token

## 20. snapshot-verify
READ: persona_snapshot, persona_signing_key
TOKEN: PUBLIC

## 21. revocation-list
READ: persona_snapshot_revocation
TOKEN: PUBLIC

============================================================

## Keys

## 22. keygen-once
WRITE: persona_signing_key
TOKEN: SERVICE_ROLE

## 23. keys-by-id
READ: persona_signing_key
TOKEN: SERVICE_ROLE

## 24. keys-current
READ: persona_signing_key
TOKEN: SERVICE_ROLE

============================================================

## Civilization / Integration

## 25. civilization-event-producer
WRITE: civilization_event_outbox
TOKEN: SERVICE_ROLE

## 26. civilization-event-dispatcher
READ: civilization_event_outbox
CALL: sign-event
CALL: persona-state-apply
TOKEN: x-internal-token

## 27. civilization-dead-notify
WRITE: civilization_event_outbox
TOKEN: SERVICE_ROLE

## 28. event-validate
READ: event_registry
TOKEN: SERVICE_ROLE

## 29. external_dispatcher
READ: civilization_event_outbox
EXT: external webhook
TOKEN: SERVICE_ROLE

============================================================

# END
