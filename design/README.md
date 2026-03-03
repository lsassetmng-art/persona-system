# CIVILIZATION DESIGN REPOSITORY

## Overview

This repository contains the canonical architectural design of the LSAM Civilization System.

It defines:

- Constitutional control layer
- System structure (Persona + ERP)
- Event standards (v2)
- Dependency rules
- Runtime governance
- Cross-system interface contracts

This repository does NOT contain implementation.
It defines the rules that implementation must follow.

---

# Architecture Layers

## 1. Constitution (Highest Authority)

Defines fail-closed principles and system invariants.

Folder:
constitution/

---

## 2. Architecture Layer

Defines static structural boundaries.

Includes:
- Persona system structure
- ERP system structure
- Dependency graph
- Canonical consistency matrix

Folder:
architecture/

---

## 3. Runtime Layer

Defines dynamic control mechanisms.

Includes:
- Freeze policy
- Integration rules
- Fail-closed gates

Folder:
runtime/

---

## 4. Event Standard (v2)

Defines strict rules for:

- WORLD_EVENT
- DOMAIN_EVENT
- INTERFACE_EVENT

Includes:
- schema_hash canonicalization
- version policy
- compatibility table rules

Folder:
event-standard/

---

# System Boundary Rule

ERP ↔ Persona interaction is ONLY allowed through:

INTERFACE_EVENT

Direct mutation across systems is permanently prohibited.

All cross-boundary events must include:

- event_id
- event_type
- event_version
- schema_hash
- signature

Fail-closed on validation failure.

---

# Versioning Strategy

Breaking structural change → MAJOR version  
Compatible extension → MINOR version  
Documentation update → PATCH version  

Current canonical version:
v2.0.0

---

# Relationship to Other Repositories

This repository governs:

- erp-foundation
- erp-*
- PersonaOS
- persona-visual-runtime
- game-platform-foundation
- StreamingCreationFoundation
- life-foundation

All implementation repositories must comply with this design.

---

# Design Philosophy

This is not an app architecture.

This is a Civilization Operating System.

Structure > Features  
Safety > Convenience  
Explicit boundaries > Implicit coupling  

---

END OF README
