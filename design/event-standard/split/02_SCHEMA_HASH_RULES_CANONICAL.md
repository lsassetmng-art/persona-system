# SCHEMA HASH RULES - CANONICAL

schema_hash = sha256(canonical_json(schema))

Canonical JSON rules:
1. UTF-8 without BOM
2. Keys sorted lexicographically
3. No extra whitespace
4. Numbers normalized
5. Minimal JSON serialization

Hash output:
- lowercase hex
- 64 characters
