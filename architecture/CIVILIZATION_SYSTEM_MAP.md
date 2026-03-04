# Civilization System Map

## Purpose

Single-page overview of Civilization OS runtime flow.

------------------------------------------------------------------------

## System Flow

Worlds - life - business - streaming - game - learning - social

        ↓

Event Creation

        ↓

Outbox Pattern

        ↓

Dispatcher Runtime

        ↓

Event Registry Validation

        ↓

Apply Engine

        ↓

Persona State Mutation

        ↓

Persona Snapshot

------------------------------------------------------------------------

## Core Principle

All worlds produce events. Events flow through a unified dispatcher.
Dispatcher validates against the event registry. Apply engine mutates
the persona state. Snapshots capture the resulting civilization state.
