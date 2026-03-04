# Civilization Design Dependency Graph

## Purpose

Shows dependency relations between all major Civilization /
Persona-System design documents. Helps prevent circular architecture and
design drift.

------------------------------------------------------------------------

## Dependency Graph

``` mermaid
flowchart TD

CONSTITUTION[Civilization Constitution]

ARCH[Architecture Layer]
EVENT[Event System]
RUNTIME[Runtime System]
SECURITY[Security Model]
DATA[Data Model]
OPS[Operations]

DISPATCHER[Dispatcher Runtime]
APPLY[Apply Engine]

OUTBOX[Outbox Pattern]
REGISTRY[Event Registry]

OBS[Observability]
FAILURE[Failure Matrix]

CONSTITUTION --> ARCH

ARCH --> EVENT
ARCH --> RUNTIME
ARCH --> DATA
ARCH --> SECURITY

EVENT --> REGISTRY
EVENT --> OUTBOX

RUNTIME --> DISPATCHER
RUNTIME --> APPLY

SECURITY --> DISPATCHER
SECURITY --> APPLY

DATA --> APPLY

RUNTIME --> OBS
OPS --> FAILURE
```

------------------------------------------------------------------------

## Dependency Principles

1.  Constitution is the highest authority.
2.  Architecture defines system structure.
3.  Event System defines event contracts.
4.  Runtime implements execution logic.
5.  Operations manages reliability and monitoring.

------------------------------------------------------------------------

## Layer Order Rule

Allowed dependency direction:

Constitution\
→ Architecture\
→ Event System\
→ Runtime\
→ Operations

Lower layers must never depend on higher layers.
