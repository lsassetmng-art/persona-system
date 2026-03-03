# Compatibility Table (Canonical)

| event_type | event_version | schema_hash | compatibility | introduced_at | deprecated_at | notes |
|-----------|---------------|-------------|---------------|---------------|--------------|------|
| <EVENT_TYPE> | 1 | <sha256-hex> | COMPATIBLE | 2026-03-01 | | initial |

Rules:
- COMPATIBLE: optional追加など互換範囲
- BREAKING: field削除/型変更/required追加/意味変更（=version+1必須）
- schema_hash が変わるなら必ず行追加（追跡のため）
