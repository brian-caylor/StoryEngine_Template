#!/bin/bash
# Story Engine — Compile Manuscript
# Merges all chapter drafts into a single manuscript file.
# Usage: bash scripts/compile-manuscript.sh [output-filename]

OUTPUT="${1:-manuscript.md}"
DATE=$(date +%Y-%m-%d)

echo "📖 Compiling manuscript..."
echo ""

# Get title from PROJECT.md
TITLE=$(head -1 PROJECT.md 2>/dev/null | sed 's/# PROJECT — //')

# Start manuscript
cat > "$OUTPUT" << EOF
# $TITLE

*Compiled: $DATE*

---

EOF

# Count and compile chapters
CHAPTER_COUNT=0
TOTAL_WORDS=0

for CHAPTER in drafts/chapter-*.md; do
    if [ -f "$CHAPTER" ]; then
        CHAPTER_COUNT=$((CHAPTER_COUNT + 1))
        WORDS=$(wc -w < "$CHAPTER")
        TOTAL_WORDS=$((TOTAL_WORDS + WORDS))
        
        echo "" >> "$OUTPUT"
        cat "$CHAPTER" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
        echo "---" >> "$OUTPUT"
        
        echo "  ✅ Added: $CHAPTER ($WORDS words)"
    fi
done

echo ""
echo "=================================="
echo "📄 Manuscript compiled: $OUTPUT"
echo "📊 Chapters: $CHAPTER_COUNT"
echo "📊 Total words: $TOTAL_WORDS"
echo "📊 Avg words/chapter: $((TOTAL_WORDS / (CHAPTER_COUNT > 0 ? CHAPTER_COUNT : 1)))"
