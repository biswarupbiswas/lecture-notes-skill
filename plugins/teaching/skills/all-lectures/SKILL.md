---
name: all-lectures
description: Write the notes for all lectures of a university course, or a range or unit of them, in order, from the instructor's own syllabus. Splits the syllabus into lecture topics, gets the list approved, then writes each lecture with the full /lecture workflow (checked numbers, rendered pages, course log), one after another so each builds on the previous ones. Use when the user asks to create all lectures, the whole set of lecture notes, a unit's lectures, or types /all-lectures.
argument-hint: "[path to syllabus] [all | lectures a–b | unit k] [extra instructions]"
---

# /all-lectures: write all lectures from your syllabus

The instructor writes the syllabus. This skill turns it into lectures, `Lectures/lectureN.tex` and `.pdf` (all in one folder), by
running the `/lecture` workflow once per lecture, strictly in order, because each lecture reuses the notation,
examples and results of the ones before it.

Request: `$ARGUMENTS`. Before starting, read `shared/style-core.md`, `shared/course-log.md` and, unless
`COURSE.md` says `NBA: no`, `shared/nba-obe.md`.

---

## Step 1 — Read the syllabus

1. **Find it.** Look in this order:
   - a path in `$ARGUMENTS`;
   - the official syllabus file named in `COURSE.md`;
   - a `Syllabus/` folder;
   - a file in the course root whose name contains "syllabus" (PDF, DOCX, TeX, Markdown or text).

   If none is found, ask for it in one short question.
2. **Use it as given.** Never change, reword or add to the instructor's syllabus. Take from it:
   - the units, with their topics in order and their hours;
   - the L-T-P and weeks;
   - the COs, if it has them;
   - the textbooks.
3. **Course settings.**
   - If `COURSE.md` is missing, create it from `shared/COURSE.template.md` with what the syllabus gives. Ask in
     **one** message for anything needed that the syllabus lacks, such as the instructor name, lecture problems yes/no, and
     year of study.
   - If the course uses NBA and the syllabus has COs, copy them into `COURSE.md` exactly as written.
   - If the syllabus has no COs, do not invent them. Say so; the lectures are then logged without COs.

## Step 2 — The lecture list

1. **Existing list.** If `Plan/plan.md` exists, use its lecture list.
2. **Otherwise make the list:**
   - Split each syllabus unit into **lecture-sized topics**. One topic is one lecture of notes, typically 3–5 pages.
   - Follow the syllabus order and the unit hours: a unit of 8 hours gets about 8 lectures.
   - The total is at most L × weeks. For 3-1-0 over 14 weeks that is 42; leave 2–3 slots spare.
   - Every syllabus topic appears in exactly one lecture. Add nothing that is not in the syllabus.
   - With COs, give each lecture the CO(s) it serves.
   - Check the counts with code.
3. **Range.**
   - `all` (the default) means every lecture in the list.
   - `lectures a–b` and `unit k` mean only those lectures.
4. **Approval.** Show the instructor the list (number, topic, unit, CO) in **one** message, and ask them to approve
   it or change it. Changes can split, merge, rename or reorder topics.
   - The approved list counts as the instructor naming every topic.
   - Save it as the Lectures table of `Plan/plan.md`, from the `/course-plan` template, so that tutorials and
     assessments can find the lecture ranges later. Leave the other sections for `/course-plan`.
5. **Skip what exists.** A lecture whose file already exists is never overwritten. Mark it "kept", and read it so
   that later lectures build on it.

## Step 3 — A pilot lecture first

- Write the **first** lecture of the range alone, as in Step 4.
- Then stop and ask the instructor to look at it: length, depth, notation, examples, problems.
- Their corrections become house rules for the whole batch. Add them to "House rules" in `COURSE.md` with their
  agreement, so every later lecture follows them.
- Skip the pilot only if the instructor says so, or if earlier lectures in the course already show the style.

## Step 4 — One lecture at a time

For each lecture in order:

1. **Run the full `/lecture` workflow** for that topic and lecture number. Use a **subagent** (Agent tool), so that
   each lecture starts with a clean context and this session only keeps the results.
   - Tell the subagent to invoke the `lecture` skill (`teaching:lecture` if installed as a plugin).
   - Pass it: the topic, the lecture number, its CO(s), `batch mode: topic approved by the instructor`, and any
     instructions from the instructor.
   - If subagents are not available, run the workflow yourself, one lecture at a time.
2. **Strictly one after another**, never in parallel. Lecture N must read Lecture N−1 and its log entry.
3. **After each lecture**, check that:
   - the `.tex` and `.pdf` exist;
   - the build was clean;
   - the `COURSE-LOG.md` entry was added, with `Status: prepared`;
   - the lecture's problems were added to the current tutorial sheet, and the sheet was closed and logged if this
     lecture ends its block (`/lecture` Step 8).
4. **Stop at the first problem** and report it, keeping the lectures already done. Examples: a failed build, a
   number that cannot be verified, or a topic that needs a decision. Do not skip ahead.
   Running `/all-lectures` again continues from where it stopped, because finished lectures are kept.
5. Give the instructor a one-line progress note after each lecture.

## Step 5 — Report

Reply briefly with:
- a table of every lecture in the range: number, topic, pages, status (written, kept, or stopped), plus anything
  not verified;
- any choice that affects many lectures, such as a running example or a notation decision;
- a reminder that the log marks these lectures `prepared`. When a lecture is actually taught, mark it `delivered`
  in `COURSE-LOG.md`, or tell Claude "lectures 1–8 were delivered".

Do not paste notes into the chat.

## Cost and time

Each lecture is a full `/lecture` run, with computing and page checks. A whole 3-1-0 course is about 40 lectures and
takes a long time. If the instructor is unsure, suggest one unit at a time (`/all-lectures unit 1`), with a review
between units.
