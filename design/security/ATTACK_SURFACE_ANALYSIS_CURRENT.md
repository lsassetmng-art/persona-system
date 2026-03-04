# Security Attack Surface

## External Entry Points (Public JWT)
- persona-create
- persona-event-history
- visual-job-create
- visual-compose
- visual-upload

## Internal Token Protected
- persona-state-apply
- sign-event
- snapshot-revoke
- civilization-event-dispatcher

## Public Snapshot Surface
- snapshot-verify
- revocation-list

------------------------------------------------------------

High Risk Zones:
- snapshot-verify (crypto validation)
- visual-upload (binary integrity)
- persona-state-apply (state mutation)

Mitigation:
- Fail-Closed
- Hash verification
- Ed25519 signatures
- RLS isolation
