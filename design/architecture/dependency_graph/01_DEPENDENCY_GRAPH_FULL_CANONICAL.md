# DEPENDENCY GRAPH - FULL CANONICAL

## Global Structure

ERP-System  →  Integration  →  Persona-System

Direct calls between ERP and Persona are permanently prohibited.
Only INTERFACE_EVENT may cross the boundary.

---

## Persona Internal Flow

worlds → integration → civilization → core → snapshot → expression

Rules:
- worlds never mutate core directly
- expression never mutates core
- dispatcher is the only apply path

---

## ERP Internal Flow

core → domains → management (read-only)
domains → integration (boundary)

Management cannot execute domain commands.
