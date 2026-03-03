# ============================================================
# 03 ERP SYSTEM STRUCTURE
# ============================================================

3. ERP SYSTEM STRUCTURE (Enterprise Scope)
============================================================

erp-system/
  core/
  domains/
  integration/
  management/

------------------------------------------------------------
3.1 ERP CORE (Tier 0)
------------------------------------------------------------
- tenant model
- auth
- workflow
- audit
- permission

------------------------------------------------------------
3.2 ERP DOMAINS (Tier 1)
------------------------------------------------------------

domains/
  sales/
  purchase/
  inventory/
  accounting/
  finance/
  hr/
  manufacturing/
  crm/
  approval/
  planning/
  strategy/
  project/
  asset/
  quality/
  legal/

Domains produce DOMAIN_EVENT.

------------------------------------------------------------
3.3 ERP INTEGRATION (Tier 1)
------------------------------------------------------------
- event-bridge
- interface-event-generator
- signature attach

------------------------------------------------------------
3.4 ERP MANAGEMENT (Tier 2)
------------------------------------------------------------
- reporting
- dashboard
- analytics
- read-only projections

Management cannot execute commands.

============================================================