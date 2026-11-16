---
name: assessment
description: Write a quiz, mid-semester or end-semester exam paper for a university course, with a separate solutions and marking-scheme file, as LaTeX and PDF. Questions come only from lectures already taught (COURSE-LOG.md), marks add up exactly, the paper fits the time, and every answer is computed. Use when the user asks for a quiz, test, exam, question paper or marking scheme, or types /assessment.
argument-hint: "<quiz N | midsem | endsem | name> [lectures a–b] [marks, duration, extra instructions]"
---

# /assessment: an exam paper with its marking scheme

Writes `Assessments/<name>.tex` (the paper) and `Assessments/<name>-solutions.tex` (solutions and
marking scheme), with PDFs. `<name>` is e.g. `quiz1`, `midsem`, `endsem`.

Request: `$ARGUMENTS`. Before writing, read `shared/style-core.md` and `shared/course-log.md`, and, unless
`COURSE.md` says `NBA: no`, `shared/nba-obe.md`.

---

## Step 1 — Settings

1. **From `$ARGUMENTS` and `COURSE.md`:**
   - type and name;
   - total marks;
   - duration;
   - allowed material;
   - the Bloom spread of marks, if set;
   - any choice rule (e.g. "answer any 4 of 5").

   Ask in **one** message for anything still missing. Never guess marks or duration.
2. **Lecture range.**
   - If the user gives one, use it.
   - Otherwise, if `Plan/plan.md` exists, use the plan's range for this assessment.
   - Otherwise: a quiz covers the delivered lectures since the previous assessment, a mid-sem covers all delivered
     lectures so far, and an end-sem covers the whole course.
   - Content comes only from the lecture notes and `COURSE-LOG.md`, never from the plan. State the range in one
     line before writing, and say if any lecture in it is still `prepared`.
3. Read the log entries and the lecture files in the range, so that you know their notation, results, problems and
   tutorial problems.

## Step 2 — Design the paper

- **Marks add up exactly** to the total. Every question and sub-question shows its marks.
- **Time:** estimate how long a prepared student needs for each question. A useful rule is three times your own
  solving time for a careful hand solution. The total must be at most about 80% of the duration.
  An end-sem paper usually spans 50–60% routine questions and 40–50% that need understanding.
- **Coverage:** spread marks across the range in proportion to how much was taught. In a mid-sem or end-sem paper,
  every unit taught gets at least one question.
- **Levels:** a mix of direct application, standard problems, and one or two questions that need understanding:
  a short proof, a "what happens if…", or a choice of method with a reason.
- **Fair:** only what the log shows was taught. Ask for proofs only of results that were **proved** in the lectures.
- **No copies:** no question may be a lecture problem or tutorial problem from the log. A new question of the same type is
  fine and expected.
- Numbers must be manageable in the time with the allowed material.
- **CO and Bloom tags (NBA, the default):** follow `shared/nba-obe.md` §6.
  - Every question and sub-question carries marks, a CO and a Bloom level.
  - Every CO taught in the range is assessed. In a mid-sem or end-sem paper, no single CO carries more than about
    40% of the marks.
  - The Bloom spread follows `COURSE.md`. The default is at most 40% of marks at L1–L2 and at least 40% at L3–L4.
  - A question tagged with a CO tests that CO's verb and content.

## Step 3 — Solve and check everything

- Solve every question in a scratch directory, with code for every number (`shared/style-core.md` §4).
- Check with code that question marks add up to the total, and that each question's step marks add up to its marks.
- With NBA, compute with code the marks and percentage per CO and per Bloom level, and check them against the rules
  in Step 2.
- Check every question is well posed and has one clear expected answer.

## Step 4 — Write both files

Use `templates/assessment-template.tex` for both files.
- **Paper:**
  - header with course, assessment name, date `<to fill>`, duration, maximum marks;
  - instructions: allowed material, choice rule if any, "show your working";
  - questions with marks on the right; with NBA, `[marks | CO | L]` on every question and sub-question.
  - No answers, no hints, and no instructor notes.
- **Solutions and marking scheme:**
  - the same header with "Solutions and marking scheme";
  - each question restated, then a full solution;
  - a **step-mark breakdown** for each question (e.g. "setting up the system — 1; elimination — 2; answer — 1");
  - a line on partial credit and common mistakes;
  - the per-question time estimates at the end;
  - with NBA, the **blueprint**: tables of marks and percentages per CO and per Bloom level.

## Step 5 — Build and look

Follow `shared/style-core.md` §5 for both files. Keep each question on one page if possible.
Search the paper's text for any leaked answer.

## Step 6 — Update the course log

Add the assessment entry to `COURSE-LOG.md`, with one line per question and its marks and `[CO, L]` tags, and the
marks per CO and per level (`shared/course-log.md`).

## Step 7 — Report

Reply briefly with:
- the paths;
- the lecture range;
- a question table: number, topic, marks, estimated minutes;
- the total time estimate against the duration;
- with NBA, the marks per CO and per Bloom level;
- anything you could not verify;
- any choice the instructor may want to change.
