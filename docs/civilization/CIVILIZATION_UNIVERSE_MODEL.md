# ============================================================
# CIVILIZATION UNIVERSE MODEL
# universe -> world -> civilization -> nation -> organization -> persona
# ============================================================
status: canonical
scope: civilization.universe.model
owner: Boss
prepared_by: Zero
version: 1.0

Hierarchy:
Universe
  -> World (simulation instance; isolated by default)
     -> Civilization (sovereign macro-entity; currency/population/economy)
        -> Nation / Federation (political grouping)
           -> Organization (companies/schools/agencies)
              -> Persona (citizen; state owned by PersonaOS, revealed by snapshot)

Rules:
- 1 persona can belong to 1 nation at a time (stateless allowed)
- currencies are per nation/civilization as configured
- relations are between civilizations/nations (treaty framework)

Cross-layer rule:
- only events cross boundaries (no direct mutation).

