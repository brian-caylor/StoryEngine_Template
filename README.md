# Story Engine Template

A file-based narrative architecture for writing long-form fiction with Claude Code. Story Engine applies software development principles -- persistent state, iterative drafting, self-review loops, and structured project files -- to novel and novella writing.

Every story decision, character detail, plot point, and stylistic choice lives in project files rather than conversation history. Claude reads and updates these files as you write together, maintaining continuity across an entire manuscript.

## Quick Start

```bash
# Clone the template
git clone https://github.com/FridTwinkieWeineer/StoryEngine-Template.git
cd StoryEngine-Template/story-engine-template

# Initialize a new project
bash scripts/init-project.sh "Your Story Title"
```

Then open the project in Claude Code and paste the contents of `SYSTEM_PROMPT.md` as your system prompt. Tell Claude your story idea and it will walk you through each phase.

## How It Works

Story Engine guides you through eight sequential phases, each with an explicit gate requiring your approval before advancing:

| Phase | What Happens | Output Files |
|-------|-------------|--------------|
| 1. Conception | Pitch your idea, Claude asks clarifying questions | `PROJECT.md` |
| 2. World-Building | Define setting, rules, timeline, locations | `world/` |
| 3. Characters | Build cast list and detailed character profiles | `characters/` |
| 4. Structure | Outline acts, chapters, and individual scene cards | `outline/` |
| 5. Style | Calibrate prose voice from sample passages | `style/` |
| 6. Drafting | Write chapters one at a time with continuity tracking | `drafts/` |
| 7. Review | Automated continuity audit, voice check, reader simulation | Reports in `continuity/` and `style/` |
| 8. Revision | Edit chapters with ripple-effect detection | Updated `drafts/` |

You control the pace. Nothing advances without your approval.

## Project Structure

```
story-engine-template/
├── SYSTEM_PROMPT.md          # Master orchestration prompt for Claude
├── PROJECT.md                # Story metadata (title, logline, themes, status)
│
├── world/                    # Setting, rules, timeline, locations
├── characters/               # Cast list + individual character profiles
│   └── _TEMPLATE.md          # Character profile template
├── outline/                  # Act structure + scene cards
│   └── scenes/
│       └── _TEMPLATE.md      # Scene card template
├── drafts/                   # Manuscript chapters (created during Phase 6)
│
├── continuity/               # Living story state, updated after each chapter
│   ├── tracker.md            # Established facts registry
│   ├── threads.md            # Open/active/closed plot threads
│   └── changelog.md          # Per-chapter change log
│
├── style/                    # Voice guide, motifs, approved prose samples
├── prompts/                  # Reusable prompts for drafting, review, revision
└── scripts/                  # Utility scripts (init, compile, word count, snapshots)
```

## Continuity System

The core differentiator. After every chapter, Claude updates three files:

- **`tracker.md`** -- Single source of truth for all established facts (character states, object locations, secrets, relationships, world state), each tagged with the chapter where it was established.
- **`threads.md`** -- Tracks every narrative promise: open threads that need resolution, active threads in progress, and closed threads that have been paid off.
- **`changelog.md`** -- Documents what changed with each chapter or revision.

Before drafting, Claude reads these files to prevent contradictions, character knowledge violations, and dropped plot threads.

## Commands

You can issue these at any time during a session:

| Command | Action |
|---------|--------|
| `status` | Current phase, progress, next steps |
| `continuity` | Display the continuity tracker |
| `threads` | Show open/active/closed plot threads |
| `wordcount` | Word count across all draft files |
| `compile` | Merge chapters into a single manuscript |
| `audit` | Run a full continuity audit |
| `voice-check` | Check prose consistency against voice guide |
| `reader-sim` | Simulate a first-time reader review |
| `next` | Advance to next phase or chapter |

## Scripts

```bash
# Initialize project structure
bash scripts/init-project.sh "Story Title"

# Track word count with progress bar
bash scripts/word-count.sh

# Compile all chapters into one markdown file
bash scripts/compile-manuscript.sh

# Snapshot continuity state before major revisions
bash scripts/continuity-snapshot.sh
```

### Export to Word

```bash
npm install docx
node build-docx.js
```

Compiles chapters into a formatted .docx with 6x9" trim, Georgia font, proper indentation, and scene breaks rendered as centered `* * *`.

## Review Prompts

The `prompts/` directory contains reusable review protocols:

- **`draft-chapter.md`** -- Pre-draft checklist, writing instructions, post-draft continuity updates
- **`continuity-check.md`** -- Full manuscript audit for contradictions, timeline errors, knowledge violations
- **`voice-check.md`** -- Chapter-by-chapter prose consistency analysis
- **`reader-review.md`** -- First-reader simulation (Claude reads only prose, ignores project files)
- **`revision-pass.md`** -- Editorial revision with ripple-effect detection across subsequent chapters

## Requirements

- [Claude Code](https://claude.ai/claude-code) (CLI, desktop app, or IDE extension)
- Bash (for utility scripts)
- Node.js + `docx` package (optional, for Word export)

## License

MIT
