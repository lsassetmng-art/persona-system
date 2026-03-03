# 04 Foundation ↔ OS 境界ルール（固定）
status: DESIGN_CANONICAL
owner: Boss
prepared_by: Zero
last_updated: 2026-02-28

## Foundationの定義
Foundationは “共通機能” を提供するが “業務/文明の意思決定” を行わない。

対象:
- auth / storage / realtime / cron / vault / net / shared / system

## 固定ルール
1) FoundationはOSドメインデータを保持しない（例外: sharedの共通ログ/共通DLQ）
2) OSはFoundationの内部実装に依存しない（契約はインターフェースのみ）
3) OS間の橋渡しは Integration OS が唯一の窓口（例外: realtimeは通知のみ）
4) vaultのsecretはOS境界を越えて共有しない（OSごとに分離）

## shared/system の位置づけ
- shared: 監視/運用ログ、DLQ、共通イベントカタログ（参照のみ）
- system: OS横断で必要な “最低限の” outbox/メタ（ただしドメインは持たない）

## net/cron
- net: HTTPキュー（配送機構）
- cron: ジョブ定義（スケジューラ）
どちらも “意思決定をしない”。OSの指示に従うだけ。

