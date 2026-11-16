# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This repository holds Claude Code **skills**, not a course. There are five: `/syllabus`, `/course-plan`, `/lecture`,
`/tutorial` and `/assessment`. Together they build a university course as LaTeX files and PDFs. There is no
application code, build step or test suite. The "product" is the Markdown instructions and LaTeX templates under
`plugins/teaching/`. It is distributed two ways: copied in by `install.sh`, or installed as the plugin `teaching`
through `.claude-plugin/marketplace.json`.

## Commands

```bash
./sync-shared.sh             # copy plugins/teaching/shared/ into every skill's shared/ (run after editing shared/)
./sync-shared.sh --check     # exit 1 if any skill's copy is out of date
./install.sh                 # sync, then copy every skill to ~/.claude/skills/<skill>
./install.sh --project DIR   # ... to DIR/.claude/skills/<skill>
./install.sh --uninstall [--project DIR]

# Check templates and the example still compile (run in a scratch dir, never in the repo)
latexmk -pdf -outdir=<scratch> plugins/teaching/skills/<skill>/templates/<name>.tex
latexmk -pdf -outdir=<scratch> plugins/teaching/skills/lecture/examples/example-lecture.tex
```

- `install.sh` copies rather than symlinks, so re-run it to test edits through the slash commands.
- On reinstall it moves old copies to `~/.claude/skill-backups/`. The backups must stay outside `skills/`, or Claude
  Code would load duplicate skills.
- The `<...>` placeholders in templates compile; they render as ¡...¿.
- Do not name a LaTeX macro `\marks`: it is a TeX primitive.

## How the pieces fit together

- **Shared rules:** `plugins/teaching/shared/` is the single source.
  - `style-core.md` holds the look, voice, "every number computed", the build-and-look procedure and the file rules.
  - `course-log.md` gives the format of `COURSE-LOG.md`.
  - `nba-obe.md` holds the NBA rules: COs, the 11 POs, the CO–PO/PSO matrix, Bloom levels and tagging.
  - `COURSE.template.md` holds the per-course settings.

  Each skill is installed as a standalone folder, so `sync-shared.sh` copies `shared/` into every
  `skills/<skill>/shared/`, and those copies are committed. Edit only the top-level `shared/`, then run the sync.
  Each `SKILL.md` refers to `shared/...` relative to its own folder.
- **Data flow in a user's course folder:**
  - `/syllabus` writes `COURSE.md`, which every skill reads.
  - `/lecture`, `/tutorial` and `/assessment` append to `COURSE-LOG.md`.
  - `/tutorial` and `/assessment` take content **only** from the log, never from `Plan/plan.md`.
  - `/course-plan` writes the plan, and its `update` mode reads the log.
- **Deliberate rules the user chose; keep them:**
  - `/lecture` always needs the user to name the topic and never reads the plan;
  - the plan is instructor-only;
  - the default is 5 tutorial sheets per course (3-1-0 L-T-P, about 14 weeks);
  - an official syllabus is transcribed without rewording, and a drafted one needs approval.
  - COs follow the NBA SAR with the revised **11 POs** (`shared/nba-obe.md`), on by default (`NBA: yes` in
    `COURSE.md`). The chain covers syllabus COs and the CO–PO/PSO matrix, the plan, the log, tutorials and
    assessments. Lecture notes carry no CO tags. PSOs are never invented. CO attainment calculation is not built
    yet.
- **Lecture-only rules:** `/lecture` keeps them in `reference/style-guide.md`, plus a finished example in
  `examples/`. The other skills keep their specific rules in their `SKILL.md`.
- **References between files:** files refer to each other by relative path and by Step or § number. When you rename
  or renumber something, update the references, including `README.md`.

Precedence, as the skills state it: the user's request, then `COURSE.md`, then the style rules.

## Conventions when editing the skills

- Keep the skills subject-independent. Anything subject-specific belongs in a user's `COURSE.md`.
- The docs are written in plain, short English sentences, with lists where items really are a list. Match that style.
- When a release changes behaviour, bump `version` in `plugins/teaching/.claude-plugin/plugin.json`.
- Do not commit generated PDFs or LaTeX build files.
