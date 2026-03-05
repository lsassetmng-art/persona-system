# ============================================================
# CIVILIZATION SLA MODEL
# ============================================================
status: canonical
scope: civilization.operations.sla
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
運用品質（SLA/SLO）を固定し、設計の「守るべき基準」を明文化。

## 1. SLO Examples
- dispatch p95 < 2s
- apply p95 < 5s
- checkpoint success > 99.9%
- replay mismatch = 0
- dead-letter rate < 0.1% (excluding intentional DEAD)

## 2. Incident Severity
SEV1: runtime stop / data integrity risk
SEV2: backlog sustained / partial world impact
SEV3: minor degradation

## 3. Reporting
daily: throughput, retry, dead/quarantine, checkpoint rate
