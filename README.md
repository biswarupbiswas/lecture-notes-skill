# Teaching skills for Claude Code

Six skills that build a university course, in any subject, as LaTeX files and PDFs:

| Skill | Writes |
|---|---|
| `/syllabus` | the syllabus (`Syllabus/syllabus.pdf`) and the course settings file `COURSE.md` |
| `/course-plan` | the instructor's semester plan (`Plan/plan.md`): lectures week by week, tutorial blocks, assessments |
| `/lecture <topic>` | one lecture's notes (`Lectures/lectureN.pdf`) |
| `/all-lectures` | every lecture of the course (or a unit, or a range) from your own syllabus, in order |
| `/tutorial N` | tutorial sheet N and its full solutions (`Tutorials/`) |
| `/assessment <name>` | a quiz or exam paper and its solutions and marking scheme (`Assessments/`) |

All documents are **short but complete** and read as if a teacher wrote them by hand. They use a fixed, simple format.
Every number in them is computed, and every page of every PDF is checked by eye. Tutorials and exams use **only what
has actually been taught**.

## Install

**Option 1 — install script (gives the commands `/syllabus`, `/lecture`, ...)**

```bash
git clone https://github.com/biswarupbiswas/lecture-notes-skill.git
cd lecture-notes-skill
./install.sh                    # for your user, in every project
# or
./install.sh --project ~/teaching/MA1234    # only for one course folder
```

Remove them with `./install.sh --uninstall`.

**Option 2 — as a Claude Code plugin**

```
/plugin marketplace add biswarupbiswas/lecture-notes-skill
/plugin install teaching@lecture-notes
```

Plugin skills are namespaced, so in that case the commands appear as `/teaching:lecture`, `/teaching:tutorial` and
so on.

**Requirements:**
- a LaTeX distribution with `latexmk`;
- `poppler-utils` (`pdftoppm`, `pdftotext`) for the page checks;
- Python 3 or Julia for checking numbers.

## How to build a course

Make an empty folder for the course, open Claude Code in it, and follow these steps. If you write the syllabus
yourself, put it in the folder and go straight to step 3: `/all-lectures` reads it directly.

**1. Syllabus and course settings, once per course.**

```
/syllabus ~/Downloads/MA2101-official-syllabus.pdf
```

If there is no official syllabus, describe the course instead:

```
/syllabus MA2101 Numerical Methods, 3-1-0, 4 credits, 14 weeks, 2nd-year B.Tech, prerequisites calculus and linear algebra
```

An official syllabus is used exactly as given. Without one, the skill drafts a syllabus for you to edit and approve.
Either way, it writes the NBA course outcomes and CO–PO/PSO matrix, and asks for your department's PSOs. It also
creates `COURSE.md`. Open it and check:
- the instructor name;
- the assessment scheme;
- the number of tutorial sheets (default 5);
- the Exclude list.

**2. Semester plan, once, then whenever you fall behind or move ahead.**

```
/course-plan
/course-plan update
```

For 3-1-0 over 14 weeks this gives 42 lecture slots, with a few kept as buffer. It also splits the lectures into
5 tutorial blocks and places the quizzes and exams. The plan is for you only. No student document is made from it.

**3. The lectures: all at once, or one at a time.**

To write every lecture from your own syllabus:

```
/all-lectures ~/teaching/MA2101/my-syllabus.pdf
/all-lectures unit 2
/all-lectures lectures 10-15
```

The skill splits your syllabus into lecture topics and shows you the list to approve. It never changes the syllabus
itself. Then it writes Lecture 1 and waits for your comments; those become house rules for the rest. After that it
writes the lectures one after another, each building on the ones before. It stops at the first problem, and running
it again continues where it stopped. These lectures are logged as `prepared`. Tell Claude "lectures 1–8 were
delivered" as you teach them.

For a single lecture, name the topic:

```
/lecture Newton's method for nonlinear equations
```

Both keep your notation and running examples, and add each lecture to `COURSE-LOG.md`, the record of what was
written and taught.

**4. Each tutorial sheet, after its block of lectures.**

```
/tutorial 1
/tutorial 2 lectures 9-16
```

Each sheet has about 10–12 problems, from warm-up to challenge, over about 3 tutorial sessions. The full solutions
go in a separate file.

**5. Each assessment.**

```
/assessment quiz1
/assessment midsem 30 marks 90 minutes
/assessment endsem
```

The marks add up exactly and the paper fits the time. A separate file gives the solutions with step marks.

Edit anything by hand at any time. The skills keep your edits and follow your style from then on. If you correct
something that should always apply, add it to **House rules** in `COURSE.md`.

## A course folder

```
MA2101/
  COURSE.md              settings, read by every skill
  COURSE-LOG.md          what has been taught and issued (written by /lecture, /tutorial, /assessment)
  Syllabus/syllabus.tex, .pdf
  Plan/plan.md           instructor only
  Lectures/lecture1.tex, .pdf, lecture2.tex, ...   all lectures in one folder
  ...
  Tutorials/tutorial1.tex, tutorial1-solutions.tex, ..., PDFs
  Assessments/midsem.tex, midsem-solutions.tex, ..., PDFs
```

The template for `COURSE.md` is `plugins/teaching/shared/COURSE.template.md`. Besides what is shown in step 1, it can
set:
- the textbooks and the running examples;
- problems at the end of each lecture (there is no summary section) and companion code;
- the problems per tutorial sheet;
- the Bloom spread of marks in assessments;
- an **Exclude** list of topics taught by someone else;
- **House rules**.

## Style, in short

The shared rules are in `plugins/teaching/shared/style-core.md`. The lecture rules are in
`plugins/teaching/skills/lecture/reference/style-guide.md`, and `examples/` shows a finished lecture.

- Short but complete: every paragraph earns its place. A lecture is typically 3–5 pages.
- Plain prose written by a teacher, in a fixed simple format. No coloured boxes, instructor notes or starred sections.
- Strict order: nothing is used before it is introduced.
- Nothing about future lectures in student documents: no "next lecture", no roadmap.
- Tutorials and exams ask only about what was taught, and never copy lecture problems or earlier tutorial problems.
- Nothing invented: unknown book details or rules are marked `<to confirm>`.

## NBA accreditation (on by default)

Course outcomes follow the NBA Self Assessment Report (SAR), using the 11 POs of the revised SAR. The rules are in
`plugins/teaching/shared/nba-obe.md`.

- **Syllabus:** 4–6 COs, each with one measurable verb and a Bloom level, and the units each CO covers. The highest
  level depends on the year of study: up to L3 in first year, L5 in 2nd–3rd year, and L6 in final year.
  Also the CO–PO/PSO articulation matrix (3/2/1/–) with its average row (no written justification
  section; doubtful cells are reported to the instructor instead).
- **Plan:** the CO(s) of each lecture, with a check that every CO is taught.
- **Lecture notes:** no tags; the course log records each lecture's COs.
- **Tutorials:** a (CO, Bloom level) tag on every problem.
- **Assessments:** `[marks | CO | L]` on every question. The solutions end with a blueprint: marks and percentages
  per CO and per Bloom level.

PSOs are written by your department, so `/syllabus` asks for them and never invents them. Check the PO statements
against your institution's SAR copy. To use a different PO list, or to switch NBA off, edit the Accreditation
section of `COURSE.md`.

## Layout

```
.claude-plugin/marketplace.json        plugin marketplace entry
plugins/teaching/.claude-plugin/plugin.json
plugins/teaching/shared/               rules shared by all skills (edit here)
    style-core.md                      shared style, build-and-look, file rules
    course-log.md                      format of COURSE-LOG.md
    nba-obe.md                         NBA COs, 11 POs, CO–PO matrix, Bloom levels, tagging rules
    COURSE.template.md                 per-course settings
plugins/teaching/skills/<skill>/
    SKILL.md                           the workflow Claude follows
    templates/                         LaTeX (or Markdown) skeletons
    shared/                            copy of plugins/teaching/shared (made by sync-shared.sh)
plugins/teaching/skills/lecture/reference/style-guide.md, examples/
install.sh                             install / uninstall all skills
sync-shared.sh                         copy shared/ into every skill (--check to verify)
```

## License

MIT, see `LICENSE`.
