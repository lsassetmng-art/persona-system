# 96 Next Implementation Order（次の実装順 正本）
status: APPLY_READY
last_updated: 2026-02-28

最短・安全順:
1) 87 の ingest RPC を各OSに追加（佐藤レビュー後）
2) integration.deliver_internal_batch を実行して internal 配送を成立
3) EXTERNAL_HTTP（ERP）配送ワーカー設計→実装（別番号で出す）
4) 最初の Actor 発行（policy/whitelist/keys）
5) ERP受け口（ingest）実装
