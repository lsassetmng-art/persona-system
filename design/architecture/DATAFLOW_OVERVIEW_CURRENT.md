# Data Flow Overview

Core Tables:
- personas
- growth_events
- persona_snapshot
- visual_generation_jobs
- visual_assets
- approval_request
- persona_signing_key

Security Tables:
- world_signing_keys
- sign_log
- persona_snapshot_revocation

Event Pipeline:
civilization_event → persona_state_apply → growth_events → snapshot
