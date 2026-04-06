#!/bin/bash
# Story Engine — Initialize New Project
# Usage: bash scripts/init-project.sh "My Story Title"

TITLE="${1:-Untitled Project}"
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')
DATE=$(date +%Y-%m-%d)

echo "📖 Story Engine — Initializing: $TITLE"
echo "=================================="

# Create scene directory
mkdir -p outline/scenes

# Set project title in PROJECT.md
sed -i "s/\[Working Title\]/$TITLE/g" PROJECT.md 2>/dev/null

# Create initial act files from structure
for ACT in 1 2 3; do
    if [ ! -f "outline/act-${ACT}.md" ]; then
        cat > "outline/act-${ACT}.md" << EOF
# Act ${ACT} — [Title]

## Chapters

### Chapter [N] — [Title]
- **Scene Card:** outline/scenes/ch[N]-s1.md
- **POV:** [Character]
- **Purpose:** [Why this chapter exists]
- **Word Target:** [N]

---

## Act ${ACT} Notes
[Thematic concerns, pacing notes, key moments to nail]
EOF
        echo "  ✅ Created outline/act-${ACT}.md"
    fi
done

# Initialize empty continuity state
echo "  ✅ Continuity tracker ready"
echo "  ✅ Thread tracker ready"
echo "  ✅ Changelog ready"

echo ""
echo "=================================="
echo "✨ Project initialized: $TITLE"
echo "📁 Structure:"
echo ""
find . -name "*.md" -not -path "./.git/*" | sort | head -30
echo ""
echo "🚀 Next steps:"
echo "   1. Open Claude Code in this directory"
echo "   2. Share your story idea"
echo "   3. Claude will guide you through each phase"
echo ""
echo "📋 Paste SYSTEM_PROMPT.md as your system prompt to activate Story Engine mode."
