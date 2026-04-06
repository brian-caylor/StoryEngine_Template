#!/bin/bash
# Story Engine — Word Count Report
# Usage: bash scripts/word-count.sh

echo "📊 Word Count Report"
echo "=================================="
echo ""

TOTAL=0
echo "Chapter Breakdown:"
echo "------------------"

for CHAPTER in drafts/chapter-*.md; do
    if [ -f "$CHAPTER" ]; then
        WORDS=$(wc -w < "$CHAPTER")
        TOTAL=$((TOTAL + WORDS))
        BASENAME=$(basename "$CHAPTER" .md)
        printf "  %-20s %6d words\n" "$BASENAME" "$WORDS"
    fi
done

echo ""
echo "------------------"
printf "  %-20s %6d words\n" "TOTAL" "$TOTAL"
echo ""

# Context comparisons
echo "For reference:"
echo "  Short story:    1,000 - 7,500 words"
echo "  Novelette:      7,500 - 17,500 words"
echo "  Novella:       17,500 - 40,000 words"
echo "  Novel:         40,000 - 100,000 words"
echo "  Epic:         100,000+ words"
echo ""

# Progress bar if PROJECT.md has a target
TARGET=$(grep -oP 'Estimated Word Count.*?(\d[\d,]+)' PROJECT.md 2>/dev/null | grep -oP '\d[\d,]+' | tr -d ',')
if [ -n "$TARGET" ] && [ "$TARGET" -gt 0 ] 2>/dev/null; then
    PCT=$((TOTAL * 100 / TARGET))
    BAR_LEN=30
    FILLED=$((PCT * BAR_LEN / 100))
    EMPTY=$((BAR_LEN - FILLED))
    BAR=$(printf "%${FILLED}s" | tr ' ' '█')$(printf "%${EMPTY}s" | tr ' ' '░')
    echo "Progress: [$BAR] $PCT% ($TOTAL / $TARGET)"
fi
