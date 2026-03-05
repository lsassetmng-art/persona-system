# CIVILIZATION EVENT UNIVERSE MODEL

Purpose:
文明OSのイベント宇宙を定義する。

------------------------------------------------
Event Layers
------------------------------------------------

Internal Event
World Event
Interface Event
External Event

------------------------------------------------
Event Pipeline
------------------------------------------------

event creation
→ validation
→ dispatcher
→ apply engine
→ snapshot

------------------------------------------------
Outbox Pattern
------------------------------------------------

All mutations generate events first.

------------------------------------------------
Retry Model
------------------------------------------------

PENDING
RETRY
DEAD

------------------------------------------------
Snapshot Model
------------------------------------------------

Snapshots represent canonical state.
