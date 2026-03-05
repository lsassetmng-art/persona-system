# ============================================================
# CIVILIZATION OS — 完全マスター構造図（Master Map）
# ============================================================
status: CANONICAL
owner: Boss
prepared_by: Zero
version: 1.0

Purpose:
Civilization OS の全コンポーネントと依存関係を「1枚の構造図」として固定する。

------------------------------------------------------------
MASTER MAP
------------------------------------------------------------

HUMAN ADMIN (Boss)
|
+-- Governance Layer
|    +-- Policy Registry
|    +-- Approval System
|    +-- Audit Chain
|    +-- Compliance Monitor
|    +-- Conflict Resolution
|
+-- Civilization OS Core
|    |
|    +-- Runtime Layer
|    |    +-- Scheduler
|    |    +-- Tick Engine
|    |    +-- Execution Flow Controller
|    |    +-- Runtime State Machine
|    |    +-- Failure Guard (fail-closed)
|    |
|    +-- Event Universe
|    |    +-- Event Standard (schema_hash/signature/key_id)
|    |    +-- Event Registry
|    |    +-- Command Model
|    |    +-- Outbox Pattern
|    |    +-- Dispatcher
|    |    +-- Retry / Dead / Quarantine
|    |    +-- Apply Engine (only mutator)
|    |
|    +-- Simulation Engine (deterministic)
|    |    +-- Time Model (day_index)
|    |    +-- Population Engine
|    |    +-- Economy Engine
|    |    +-- Diplomacy / Trade Engine
|    |    +-- War Engine
|    |    +-- Disaster / Politics / Crime (abstract)
|    |
|    +-- World Management
|    |    +-- World Registry
|    |    +-- World Instance Model
|    |    +-- World Isolation Policy
|    |    +-- Cross-world Communication Rules (event-only)
|    |
|    +-- Data Integrity
|    |    +-- Schema Hash Verification
|    |    +-- Signature Verification (Ed25519)
|    |    +-- Checkpoint Model
|    |    +-- Replay Model
|    |    +-- Determinism Contract
|    |
|    +-- Security Layer
|    |    +-- Identity Model
|    |    +-- Key Lifecycle / Rotation
|    |    +-- Trust Boundaries
|    |    +-- Internal Token Model (if used)
|    |    +-- Tamper Detection
|    |
|    +-- Metrics / Observability
|         +-- Runtime Metrics
|         +-- Event / Queue Metrics
|         +-- Integrity Alerts (replay mismatch etc.)
|
+-- Worlds
|    +-- Civilization World (macro)
|    +-- Life World
|    +-- Business World
|    +-- ERP World
|    +-- Persona World
|
+-- PersonaOS (Truth Owner)
|    +-- persona_state
|    +-- persona_event_log
|    +-- growth events
|    +-- snapshot generator
|
+-- Snapshot Layer
|    +-- Canonical JSON
|    +-- Ed25519 signature
|    +-- Immutable certificate (revocable only)
|
+-- Applications
     +-- PocketSecretary
     +-- ERP UI
     +-- Mobile Apps
     +-- Analytics / Visualization

------------------------------------------------------------
CANONICAL INVARIANTS（不変）
------------------------------------------------------------
- PersonaOS is the only owner of persona state.
- Boundary crossing is event-only, signed, schema-hashed.
- Apply Engine is the only mutator.
- Snapshot is the only public persona artifact.
- Replay mismatch => SEV1 integrity incident.

------------------------------------------------------------
END
------------------------------------------------------------
