---
name: tutorial
description: Write one tutorial sheet for a university course, with a separate full-solutions file, as LaTeX and PDF. Problems come only from lectures already taught (COURSE-LOG.md), go from warm-up to challenge, and every answer is computed and checked. By default a course has 5 sheets (e.g. for a 3-1-0 course). Use when the user asks for a tutorial, problem sheet or exercise sheet, or types /tutorial.
argument-hint: "<sheet number> [lectures a–b] [extra instructions]"
---

# /tutorial: a tutorial sheet and its solutions

Writes `Tutorials/tutorialN.tex` (students) and `Tutorials/tutorialN-solutions.tex` (instructor and TAs), with PDFs.

**How sheets are normally made.** By default a sheet grows while the lectures are written: each `/lecture` adds 2–3
problems for its lecture to the open sheet, and closes the sheet after the last lecture of its block in the plan
(`/lecture` Step 8). Use `/tutorial` to write a whole sheet at once (when `COURSE.md` says tutorials are built all at
once), or to finish, repair or extend a sheet that already exists. **If the sheet exists, complete it, keep its
problems, and never rewrite it from scratch** without asking.

Request: `$ARGUMENTS`. Before writing, read `shared/style-core.md` and `shared/course-log.md`, and, unless
`COURSE.md` says `NBA: no`, `shared/nba-obe.md`.

---

## Step 1 — Which sheet, which lectures

1. **Sheet number N.**
   - Take it from `$ARGUMENTS`. If none is given, use the next one after the last tutorial in `COURSE-LOG.md`.
   - The total number of sheets is in `COURSE.md` (default **5**).
2. **Lecture range.**
   - If the user gives one, use it.
   - Otherwise, if `Plan/plan.md` exists, use the plan's lecture block for sheet N.
   - Otherwise cover the lectures after the previous sheet's last lecture, up to the latest **delivered** lecture
     in `COURSE-LOG.md`.
   - Tell the user the range in one line before writing. Ask only if the range is empty or looks wrong, for
     example 2 lectures, or 20.
3. **Content source.** Use only `COURSE-LOG.md` and the lecture files in that range, plus earlier lectures and
   prerequisites as background. The plan may give the default *range*, never the *content*: a tutorial covers what
   the lecture notes contain. Every lecture in the range must have notes and a log entry. If any is still
   `prepared`, say so in the one-line range message.
   If `COURSE-LOG.md` is missing, rebuild it from the lecture files first (`shared/course-log.md`).
4. Read the lecture files in the range fully, so that you know their notation, examples and problems.

## Step 2 — Design the sheet

- **Size:** the number of problems per sheet comes from `COURSE.md` (default **10–12**). In a 3-1-0 course with
  5 sheets, one sheet is used over about 3 one-hour tutorial sessions. Size it so that roughly half the problems
  can be worked in those sessions and the rest are for practice.
- **Three levels, in this order:**
  - **A. Warm-up** (about 30%): direct use of one definition, result or method.
  - **B. Standard** (about 50%): typical exam-level problems.
  - **C. Challenge** (about 20%): problems that combine ideas, ask "what happens if…", or need a short proof.
- **Coverage:** every lecture in the range has at least one problem. Weight lectures by how much they contain.
- **Variety:** mix computation, derivation or small proof, interpretation, and one problem that connects two or
  more lectures.
- **No repeats:** do not reuse a lecture problem or an earlier tutorial problem from the log. A new problem of
  the same type is fine.
- **CO and Bloom tags (NBA):** tag every problem with the CO it tests and its Bloom level (`shared/nba-obe.md` §3,
  §6).
  - Every CO taught in the range gets at least one problem.
  - The levels match the parts, within the course's highest CO level (`shared/nba-obe.md` §1): A is L1–L2,
    B is L2–L3, and C is at the top level. In a first-year course C is still L3: harder problems that combine
    methods, not L4–L6.
  - A problem's level is never above its CO's level.
- Use the course's notation and running examples. Problems are pen and paper, with numbers that can be done by hand
  or with a basic calculator, unless `COURSE.md` says otherwise.
- Only results that were **proved** or **stated** in the log may be quoted. A problem may ask students to prove
  something only if the needed tools were taught.

## Step 3 — Solve and check everything

- Solve every problem fully in a scratch directory, with code for every number (`shared/style-core.md` §4).
- Check each problem is well posed: it has a unique answer, or the question says what kind of answer is expected.
- Check the levels: an A problem should take a few minutes, a C problem should not need anything untaught.

## Step 4 — Write both files

Use `templates/tutorial-template.tex` for both files.
- **Sheet (`tutorialN.tex`):** the course line, "Tutorial N", and the lectures covered. Then the problems grouped
  A / B / C, numbered continuously. With NBA, put the `(CO, L)` tag at the right of each problem; otherwise an
  optional "(Lecture k)" tag. There are no answers, no hints unless asked, and no instructor notes.
- **Solutions (`tutorialN-solutions.tex`):** the same header with "Solutions". Each problem is restated, then
  followed by a full solution written as a teacher would write it on the board. That means the key steps, not just
  the final answer. Where students often go wrong, add one line saying so. With NBA, end with a short table of the
  number of problems per CO and per Bloom level.

## Step 5 — Build and look

Follow `shared/style-core.md` §5 for both files. Make sure no problem is split across pages in the sheet.
Search the sheet's text for any answer that leaked in.

## Step 6 — Update the course log

Add the tutorial entry to `COURSE-LOG.md`, with one line per problem and its `[CO, L]` tags, in the format of
`shared/course-log.md`.

## Step 7 — Report

Reply briefly with:
- the paths;
- the lecture range;
- the problem count per level, with a one-line topic list;
- with NBA, the problems per CO and per Bloom level;
- anything you could not verify;
- any choice the instructor may want to change.
