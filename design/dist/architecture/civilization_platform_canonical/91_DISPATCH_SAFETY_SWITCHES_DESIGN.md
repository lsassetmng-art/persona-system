# 91 Dispatch Safety Switches（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

停止優先順位（Fail-Closed）:
1) integration.system_control.maintenance_mode=1
2) integration.system_control.os_enabled=0
3) integration.system_control.dispatch_enabled=0
4) <schema>.system_control.os_enabled=0
5) <schema>.system_control.dispatch_enabled=0
6) policy revoke / actor suspend / key revoke

原則:
- どれか1つでも止まっていたら “配送しない”
