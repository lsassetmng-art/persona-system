#!/data/data/com.termux/files/usr/bin/sh
set -eu
# ============================================================
# Apply Integration Gate DDL
# IMPORTANT: Run ONLY after Sato(DB) review.
# Requires: PERSONA_DATABASE_URL
# ============================================================

: "${PERSONA_DATABASE_URL:?missing PERSONA_DATABASE_URL}"

SQL_FILE="$HOME/architecture/civilization_platform_canonical/65_INTEGRATION_GATE_DDL.sql"

psql "$PERSONA_DATABASE_URL" -v ON_ERROR_STOP=1 <<SQL
\i '$SQL_FILE'
SQL

echo "OK: applied integration gate DDL"
