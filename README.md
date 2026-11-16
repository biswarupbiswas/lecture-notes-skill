# Build a whole course with Claude Code 🚀

Lecture notes, tutorials and exams for any university course, as clean LaTeX and PDF, in a few commands.

```
/syllabus Calculus     → syllabus with CO–PO articulation as per NBA SAR
/lecture Norms         → one lecture, and its questions added to the tutorial sheet
/tutorial 1            → Tutorial 1, with solutions
/all-lectures          → all lecture notes, from that syllabus
```

## Why you'll like it

- ✍️ **Reads like a teacher wrote it.** Notes are short, clear and complete, with no AI fluff.
- ✅ **Every number is checked.** Each example and answer is computed, and every PDF page is inspected.
- 🎯 **NBA-ready.** COs with Bloom levels, a CO–PO/PSO matrix, and CO tags on every question.
- 📚 **Fair tests.** Tutorials and exams ask only about what you have taught.
- 🧑‍🏫 **Your course, your style.** Use your own syllabus. Correct one lecture, and the rest follow.

## Install

You need [Claude Code](https://claude.com/claude-code), LaTeX (`latexmk`), `poppler-utils` and Python 3.

```bash
git clone https://github.com/biswarupbiswas/lecture-notes-skill.git
cd lecture-notes-skill && ./install.sh
```

Then open Claude Code in a course folder and start typing `/`.

## All the commands

| Command | What you get |
|---|---|
| `/syllabus` | the syllabus with COs and the CO–PO matrix (or bring your own) |
| `/course-plan` | a week-by-week teaching plan |
| `/intro` | a first-day page: why this course matters |
| `/lecture <topic>` | one lecture, plus 2–3 new questions (with solutions) on the current tutorial sheet |
| `/tutorial N` | tutorial sheet N, with solutions |
| `/assessment midsem` | a question paper, with solutions and marking scheme |
| `/all-lectures` | every lecture, from your syllabus |

Course settings such as your name, the assessment scheme, PSOs and house rules go in one file, `COURSE.md`, which
`/syllabus` creates for you.

<details>
<summary>Other ways to install</summary>

- **As a plugin:** `/plugin marketplace add biswarupbiswas/lecture-notes-skill`, then
  `/plugin install teaching@lecture-notes`. The commands then appear as `/teaching:lecture` and so on.
- **For one course folder only:** `./install.sh --project ~/teaching/MA1234`
- **Uninstall:** `./install.sh --uninstall`

</details>

## Feedback

Found something to improve? Open an issue. Contributors: see `CLAUDE.md` for how the skills are organised.

MIT licence.
