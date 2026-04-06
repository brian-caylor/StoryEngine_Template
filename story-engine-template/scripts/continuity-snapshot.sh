#!/bin/bash
# Story Engine — Continuity Snapshot
# Creates a timestamped backup of all continuity files.
# Usage: bash scripts/continuity-snapshot.sh

DATE=$(date +%Y-%m-%d_%H%M)
SNAPSHOT_DIR="continuity/snapshots"

mkdir -p "$SNAPSHOT_DIR"

echo "📸 Creating continuity snapshot: $DATE"

cp continuity/tracker.md "$SNAPSHOT_DIR/tracker_${DATE}.md" 2>/dev/null && echo "  ✅ Tracker backed up"
cp continuity/threads.md "$SNAPSHOT_DIR/threads_${DATE}.md" 2>/dev/null && echo "  ✅ Threads backed up"
cp continuity/changelog.md "$SNAPSHOT_DIR/changelog_${DATE}.md" 2>/dev/null && echo "  ✅ Changelog backed up"

echo ""
echo "Snapshot saved to: $SNAPSHOT_DIR/*_${DATE}.md"
echo ""
echo "Existing snapshots:"
ls -la "$SNAPSHOT_DIR/" 2>/dev/null | tail -10
