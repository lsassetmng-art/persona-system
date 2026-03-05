# ============================================================
# CIVILIZATION RUNTIME LIFECYCLE
# ============================================================
status: canonical
scope: civilization.runtime.lifecycle
owner: Boss
prepared_by: Zero
version: 1.0

## 0. Purpose
起動から停止までの「実行順序」を固定し、事故を防ぐ。

## 1. Lifecycle States
BOOT -> READY -> RUNNING -> DRAINING -> STOPPED
Error path: any -> SAFE_STOP (fail-closed)

## 2. Boot Sequence
1) load config + gates
2) load enabled worlds
3) init scheduler
4) warm-up: load latest checkpoints (optional cache)
5) READY

## 3. Running Loop
per schedule:
- tick_engine for each world (serialized apply per world)
- dispatcher claims events
- apply engine mutates state
- checkpoint/replay integrity checks

## 4. Shutdown
- set draining flag
- stop new claims
- finish in-flight apply
- persist checkpoints
- STOPPED
