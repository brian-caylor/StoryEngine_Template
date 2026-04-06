# Prompt: Continuity Audit

## Instructions for Claude Code

Perform a full continuity audit of the current manuscript.

### Step 1: Load State
```
cat continuity/tracker.md
cat continuity/threads.md
cat world/rules.md
cat world/timeline.md
cat characters/cast.md
```

### Step 2: Sequential Read
Read every chapter in order from Chapter 1 to the latest draft. For EACH chapter, check:

1. **Fact Consistency:** Does anything contradict the continuity tracker?
2. **Timeline Logic:** Do events happen in a possible order? Are travel times realistic?
3. **Character Knowledge:** Does any character act on information they shouldn't have yet?
4. **Object Tracking:** Are objects where they should be? Did anyone use something they don't possess?
5. **World Rule Violations:** Does anything break the established rules?
6. **Relationship Consistency:** Do character dynamics match their last established state?
7. **Physical State:** Are injuries, conditions, or appearances tracked correctly?

### Step 3: Generate Report
Create `continuity/audit-report.md` with:

```markdown
# Continuity Audit Report — [Date]

## Summary
- Chapters Audited: [N]
- Issues Found: [N]
- Critical (breaks plot): [N]
- Moderate (noticeable to careful readers): [N]
- Minor (nitpicks): [N]

## Critical Issues
### Issue [N]
- **Location:** Chapter [N], paragraph [N]
- **Problem:** [description]
- **Contradicts:** [source — tracker entry, earlier chapter, world rule]
- **Suggested Fix:** [recommendation]

## Moderate Issues
[same format]

## Minor Issues
[same format]

## Thread Health
- Open threads past deadline: [list]
- Threads that seem forgotten: [list]
- Threads resolved too abruptly: [list]
```
