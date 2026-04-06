# Prompt: Revision Pass

## Instructions for Claude Code

You are revising Chapter [N] based on editorial feedback.

### Step 1: Load Context
```
cat drafts/chapter-[N].md          # The current draft
cat continuity/tracker.md          # Current state of truth
cat style/voice-guide.md           # Voice reference
cat style/samples.md               # Voice calibration samples
cat characters/[pov-character].md  # POV character reference
```

### Step 2: Load Revision Notes
Read the specific feedback provided by the user or from review reports:
```
cat continuity/audit-report.md     # If continuity issues
cat style/consistency-report.md    # If voice issues
cat drafts/reader-report.md        # If reader experience issues
```

### Step 3: Revision Strategy
Before editing, write a brief revision plan:
- **What's changing:** [List specific changes]
- **What's staying:** [What works and shouldn't be touched]
- **Ripple effects:** [Will these changes affect other chapters?]
- **Continuity impact:** [What tracker entries need updating?]

### Step 4: Revise
Edit the chapter file in place. Preserve what works. Fix what doesn't.

### Step 5: Post-Revision Updates
```
# Update continuity tracker if any facts changed
# Update thread tracker if any threads changed
# Log the revision in changelog:
#   "Chapter [N] REVISED: [summary of changes]"
```

### Step 6: Ripple Check
If the revision changed any established facts:
1. Search all subsequent chapters for references to the changed facts
2. Flag any downstream chapters that now need revision
3. Report to user: "This revision affects Chapters [X, Y, Z] — want me to propagate?"
