# Civilization OS Runtime Diagram

## Purpose

Provide a single visual overview of Civilization OS runtime
architecture.

This diagram shows the flow from worlds and ERP domains into the event
system and finally into the runtime persona state.

------------------------------------------------------------------------

## Runtime Architecture

``` mermaid
flowchart TD

subgraph Worlds
life[Life]
business[Business]
streaming[Streaming]
game[Game]
learning[Learning]
social[Social]
end

subgraph ERP
sales[Sales]
purchase[Purchase]
inventory[Inventory]
accounting[Accounting]
hr[HR]
end

subgraph Event_System
outbox[(Event Outbox)]
dispatcher[Dispatcher]
registry[(Event Registry)]
end

subgraph Runtime
apply[Apply Engine]
persona[(Persona State)]
snapshot[(Persona Snapshot)]
end

life --> outbox
business --> outbox
streaming --> outbox
game --> outbox
learning --> outbox
social --> outbox

sales --> outbox
purchase --> outbox
inventory --> outbox
accounting --> outbox
hr --> outbox

outbox --> dispatcher
dispatcher --> registry
registry --> apply
apply --> persona
persona --> snapshot
```

------------------------------------------------------------------------

## Event Flow

World / ERP\
↓\
Event Created\
↓\
Outbox\
↓\
Dispatcher\
↓\
Event Registry Validation\
↓\
Apply Engine\
↓\
Persona State Update\
↓\
Snapshot

------------------------------------------------------------------------

## Key Principles

**Fail Closed**\
Invalid events stop processing.

**Idempotency**\
Events must not mutate state twice.

**Boundary Enforcement**\
Only INTERFACE_EVENT may cross domains.

**Signature Validation**\
External events require cryptographic verification.
