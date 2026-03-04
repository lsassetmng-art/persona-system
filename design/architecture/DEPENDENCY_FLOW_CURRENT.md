# Dependency Flow (Current Snapshot)

Civilization Flow:
producer → sign-event → event-validate → dispatcher → persona-state-apply → snapshot-issue

Visual Flow:
visual-job-create → visual-compose → visual-upload → (optional snapshot-issue)

Snapshot Trust:
snapshot-issue → snapshot-verify
snapshot-revoke → revocation-list

Approval:
asset-publish-request-create → approval-action → publish_apply
