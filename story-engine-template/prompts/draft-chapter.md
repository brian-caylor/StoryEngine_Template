# Prompt: Draft Chapter

## Instructions for Claude Code

You are about to draft Chapter [N]. Follow this protocol EXACTLY.

### Step 1: Pre-Draft Reads
Execute these reads in order. Do not skip any.

```
cat drafts/chapter-[N-1].md
cat drafts/chapter-[N-2].md
cat outline/scenes/[scene-id].md
cat continuity/tracker.md
cat continuity/threads.md
cat style/voice-guide.md
cat style/samples.md
cat characters/[pov-character].md
```

### Step 2: Pre-Draft Checklist
Before writing a single word, confirm:
- [ ] I know the scene's purpose
- [ ] I know the entry hook
- [ ] I know the exit hook
- [ ] I know the emotional trajectory
- [ ] I know all continuity dependencies
- [ ] I've internalized the voice guide
- [ ] I know what the POV character wants, fears, and is hiding

### Step 3: Draft
Write the chapter. Target word count: [N from scene card].

### Step 4: Post-Draft Updates
```
# Update continuity tracker with new facts
# Update thread tracker with opened/advanced/closed threads
# Add changelog entry
```

### Step 5: Self-Check
Before presenting to the user, verify:
- [ ] No continuity violations against tracker
- [ ] Voice is consistent with samples
- [ ] All scene card beats were hit
- [ ] Entry and exit hooks are strong
- [ ] Emotional trajectory lands as planned
