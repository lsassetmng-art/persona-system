#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

ROOT="$HOME/persona-system"
DOCS="$ROOT/docs"
CIV="$DOCS/civilization"

MASTER="$DOCS/CIVILIZATION_COMPLETE_BIBLE_MASTER.md"
FINAL="$DOCS/CIVILIZATION_COMPLETE_BIBLE_FINAL.md"
INDEX="$DOCS/CIVILIZATION_DESIGN_INDEX.md"

echo "======================================"
echo "Civilization Bible Builder"
echo "======================================"

# ------------------------------------------------------------
# 1 Bible rebuild
# ------------------------------------------------------------

echo "Rebuilding FINAL Bible..."

echo "# CIVILIZATION COMPLETE BIBLE FINAL" > "$FINAL"
echo "" >> "$FINAL"

append () {

  if [ -f "$1" ]; then

    echo "" >> "$FINAL"
    echo "==================================================" >> "$FINAL"
    echo "$(basename "$1")" >> "$FINAL"
    echo "==================================================" >> "$FINAL"
    echo "" >> "$FINAL"

    cat "$1" >> "$FINAL"

  fi

}

append "$MASTER"
append "$CIV/CIVILIZATION_OS_ARCHITECTURE_MAP.md"
append "$CIV/CIVILIZATION_EXECUTION_FLOW_CANONICAL.md"
append "$CIV/CIVILIZATION_DATA_MODEL_CANONICAL.md"

echo "Bible rebuilt."

# ------------------------------------------------------------
# 2 Index rebuild
# ------------------------------------------------------------

echo "Rebuilding design index..."

echo "# CIVILIZATION DESIGN INDEX" > "$INDEX"
echo "" >> "$INDEX"

echo "Generated: $(date)" >> "$INDEX"
echo "" >> "$INDEX"

echo "Core Bible:" >> "$INDEX"
echo "- CIVILIZATION_COMPLETE_BIBLE_FINAL.md" >> "$INDEX"
echo "" >> "$INDEX"

echo "Civilization Documents:" >> "$INDEX"

ls "$CIV"/*.md | xargs -I{} basename {} >> "$INDEX"

echo "Index rebuilt."

# ------------------------------------------------------------
# 3 Git commit
# ------------------------------------------------------------

cd "$ROOT"

git add "$DOCS"

git commit -m "Civilization: rebuild bible + index" || true

# ------------------------------------------------------------
# 4 Git push
# ------------------------------------------------------------

git push || true

echo ""
echo "======================================"
echo "Civilization build complete"
echo "======================================"

