# ============================================================
# CIVILIZATION OS – ERP DEPENDENCY CANONICAL v1.0.0
# Status: CANONICAL
# Scope: Enterprise Domain Dependency Governance
# Owner: Boss
# ============================================================

This document fixes:

- Full domain dependency direction matrix
- Financial priority hierarchy
- Mandatory audit routing
- Event-only boundary enforcement
- DAG (Directed Acyclic Graph) enforcement

ERP is enterprise-grade.
No structural ambiguity allowed.

============================================================
1. DOMAIN LIST (Fixed)
============================================================

sales
purchase
inventory
accounting
finance
hr
manufacturing
crm
approval
planning
strategy
project
asset
quality
legal

Adding/removing domains = MAJOR change.

============================================================
2. DEPENDENCY RULE TYPES
============================================================

ALLOWED      : direct event flow allowed
EVENT_ONLY   : must pass through DOMAIN_EVENT boundary
FORBIDDEN    : no directional influence permitted

Direct state mutation across domains is always prohibited.
All influence via DOMAIN_EVENT only.

============================================================
3. FINANCIAL PRIORITY HIERARCHY
============================================================

Hierarchy (highest authority first):

1. accounting
2. finance
3. approval
4. all operational domains

Accounting is the single financial truth source.
No domain may override accounting outputs.

============================================================
4. CORE DIRECTIONAL MATRIX
============================================================

Allowed directional influence (via DOMAIN_EVENT):

sales        → accounting
purchase     → accounting
inventory    → accounting
manufacturing→ inventory
manufacturing→ accounting
hr           → finance
finance      → accounting
crm          → sales
project      → accounting
asset        → accounting
quality      → manufacturing
legal        → approval
strategy     → planning
planning     → project

------------------------------------------------------------
FORBIDDEN (examples)
------------------------------------------------------------

accounting   → sales
accounting   → purchase
finance      → inventory
sales        → hr
hr           → accounting (direct override)
crm          → accounting
project      → hr
quality      → accounting (direct)

If not explicitly allowed, it is FORBIDDEN.

============================================================
5. EVENT-ONLY ENFORCEMENT
============================================================

All domain influence must:

- Emit DOMAIN_EVENT
- Be schema-validated
- Pass registry validation
- Be auditable

No cross-domain function calls.
No shared mutable state.

============================================================
6. MANDATORY AUDIT ROUTING
============================================================

For financially impacting events:

domain → accounting → audit-log → finalize

Finalization without accounting validation is prohibited.

High-risk events (value > threshold):
Must pass through approval domain before finalize.

============================================================
7. DAG ENFORCEMENT
============================================================

Domain dependency graph must remain acyclic.

No circular dependency allowed.

Violation = structural defect.

============================================================
8. PERSONA BOUNDARY RULE
============================================================

ERP may influence Persona ONLY via:

INTERFACE_EVENT

No DOMAIN_EVENT may cross to Persona directly.

ERP simulation must also respect this rule.

============================================================
9. MANAGEMENT LAYER RESTRICTION
============================================================

Management layer is:

- Read-only
- Projection-only
- Cannot emit DOMAIN_EVENT
- Cannot override accounting

============================================================
10. SYSTEM INVARIANTS
============================================================

- Accounting remains final financial truth
- No domain override of accounting
- All cross-domain influence via DOMAIN_EVENT
- DAG structure preserved
- Persona boundary respected
- Audit routing enforced

Violation = constitutional breach.

============================================================
END OF ERP DEPENDENCY CANONICAL v1.0.0
============================================================

