# 90 Actor Issue & Policy Bootstrap（設計正本）
status: FROZEN_CANONICAL
last_updated: 2026-02-28

最初の1体（enterprise_operator）を発行する“設計のみ”:

Persona側で必要:
- actor_id発行
- key_id/sig_ver=1 を trusted_keys に登録
- admission policy（integration.actor_policy）を発行
- whitelist（integration.actor_whitelist）に許可 action を登録
- route_registry に os_key を登録
- 期限（expires_at）必須

実装は後段（設計完了後）で行う。
