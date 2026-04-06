# Story Engine — An Agentic Narrative Architecture for Claude Code

## What Is This?

Story Engine is a **project scaffold and orchestration system** that transforms Claude Code into a full-stack fiction writing partner. It mirrors the same principles that make Claude Code powerful for software development — **file-based state, iterative drafting, self-review loops, and persistent project architecture** — and applies them to long-form narrative creation.

Instead of `src/`, `components/`, and `tests/`, you get `world/`, `characters/`, `outline/`, and `continuity/`. Instead of a linter, you get a **coherence checker**. Instead of unit tests, you get **voice consistency validation**.

---

## Quick Start

1. **Use this template** — Click "Use this template" on GitHub to create your own copy
2. **Open in Claude Code** — Navigate to the project directory
3. **Load the system prompt** — Paste the contents of `SYSTEM_PROMPT.md` as your system prompt (or reference it in your CLAUDE.md)
4. **Start writing** — Tell Claude: *"I want to write a story about [your idea]"*
5. Claude will walk you through each phase, creating and populating files as you go

### Alternative: Shell Script Setup
```bash
bash scripts/init-project.sh
```
This scaffolds the directory structure and creates starter files.

---

## Project Structure

```
story-engine/
├── README.md                  ← You are here
├── SYSTEM_PROMPT.md           ← Master orchestration prompt for Claude Code
├── PROJECT.md                 ← Story-specific project state (generated per story)
│
├── world/                     ← Lore, rules, setting, magic systems
│   ├── setting.md
│   ├── rules.md
│   ├── timeline.md
│   └── locations.md
│
├── characters/                ← Profiles, arcs, relationships, voice guides
│   ├── _TEMPLATE.md           ← Character profile template
│   ├── cast.md
│   └── [character-name].md
│
├── outline/                   ← Structure, beats, scene cards
│   ├── structure.md
│   ├── act-1.md / act-2.md / act-3.md
│   └── scenes/
│       ├── _TEMPLATE.md       ← Scene card template
│       └── [scene-id].md
│
├── drafts/                    ← Actual prose, chapter by chapter
│   └── chapter-01.md ...
│
├── continuity/                ← Living tracker of established facts
│   ├── tracker.md
│   ├── threads.md
│   └── changelog.md
│
├── style/                     ← Tone, POV, motifs, prose DNA
│   ├── voice-guide.md
│   ├── motifs.md
│   └── samples.md
│
├── prompts/                   ← Reusable orchestration prompts
│   ├── draft-chapter.md
│   ├── continuity-check.md
│   ├── voice-check.md
│   ├── reader-review.md
│   └── revision-pass.md
│
├── scripts/                   ← Utility shell scripts
│   ├── init-project.sh
│   ├── compile-manuscript.sh
│   ├── word-count.sh
│   └── continuity-snapshot.sh
│
└── build-docx.js              ← Compile chapters into a formatted Word document
```

---

## Workflow Overview

### Phase 1: Conception
Pitch an idea to Claude. It generates `PROJECT.md` with premise, themes, and initial scope.

### Phase 2: World-Building
Claude populates `/world/` with setting, rules, timeline. You review and adjust.

### Phase 3: Character Architecture
Claude creates character profiles in `/characters/` — backstory, motivation, arc trajectory, voice DNA, relationships.

### Phase 4: Structural Outlining
Claude builds act/chapter/scene structure in `/outline/`. Each scene gets a card with beats, POV, purpose, and emotional trajectory.

### Phase 5: Style Calibration
Claude writes 2-3 sample passages in different tonal registers. You pick your preferred voice. Claude codifies it in `/style/voice-guide.md`.

### Phase 6: Iterative Drafting
Claude writes one chapter at a time, reading relevant context before each chapter and updating continuity after. Every chapter builds on a foundation of established facts.

### Phase 7: Review Cycles
After a complete draft, Claude runs three automated reviews:
1. **Continuity Audit** — Cross-references all chapters against the tracker
2. **Voice Consistency Check** — Compares prose against the voice guide
3. **Reader Simulation** — Reads as a first-time reader, flagging issues

### Phase 8: Revision
You provide notes, Claude revises with full project context, updating all affected files.

---

## Key Principles

- **Files are memory.** Every decision, detail, and draft lives in a file Claude can read back.
- **Read before write.** Claude always reads relevant context files before generating new content.
- **Track everything.** The continuity system ensures nothing slips through the cracks.
- **Iterate, don't regenerate.** Revisions edit existing files rather than starting from scratch.
- **User is the director.** Claude proposes, user disposes. Every phase has a review gate.

---

## Compiling Your Manuscript

Once your draft is complete, compile it into a Word document:

```bash
node build-docx.js
```

Edit the script to set your title, chapter count, and source directory.

---

## Commands Reference

You can issue these commands to Claude at any time:

| Command | Action |
|---|---|
| `status` | Show current phase, progress, and next steps |
| `review [file]` | Display a specific file for review |
| `revise [chapter]` | Enter revision mode for a specific chapter |
| `continuity` | Display the current continuity tracker |
| `threads` | Display open/active/closed threads |
| `wordcount` | Run word count across all draft files |
| `compile` | Merge all chapters into a single manuscript file |
| `audit` | Run a continuity audit on current drafts |
| `voice-check` | Run a voice consistency check |
| `reader-sim` | Run a reader simulation review |
| `next` | Advance to the next phase or chapter |

---

## Requirements

- [Claude Code](https://claude.com/claude-code) (CLI)
- Node.js (for `build-docx.js`)
- Bash shell (for utility scripts)

---

Built by [OddlyUseful.app](https://oddlyuseful.app)
