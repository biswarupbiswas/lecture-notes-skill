---
name: course-plan
description: Make the instructor's semester plan for a university course - every lecture slot week by week, the tutorial sheets (5 by default) with the lectures each covers, and when each assessment falls - from the syllabus and the L-T-P structure (e.g. 3-1-0). Can also re-plan the rest of the semester from what has actually been taught. Use when the user asks for a course plan, lesson plan, teaching schedule or types /course-plan.
argument-hint: "[update] [extra instructions, e.g. holidays, exam weeks]"
---

# /course-plan: the semester plan

This skill produces `Plan/plan.md`, a **working plan for the instructor only**. It covers:
- which syllabus topic goes in each lecture slot;
- the tutorial blocks;
- where the assessments fall.

Request: `$ARGUMENTS`. Before writing, read `shared/style-core.md` and `shared/course-log.md`, and, unless
`COURSE.md` says `NBA: no`, `shared/nba-obe.md`.

**What the plan is not:**
- `/lecture` never reads it to choose a topic. The instructor names each lecture's topic, either one at a time with
  `/lecture <topic>` or by approving the topic list in `/all-lectures`.
- Tutorials and assessments may take their default lecture *range* from it, but never their content. Content comes
  from the lecture notes and `COURSE-LOG.md`.
- Nothing from the plan is copied into a student document.

---

## Step 1 — Inputs

1. **Syllabus.** Use `Syllabus/syllabus.tex`, or the official file named in `COURSE.md`.
   If there is neither, stop and suggest `/syllabus` first.
2. **From `COURSE.md`:**
   - L-T-P and weeks (default 14);
   - semester dates, holidays and exam weeks, if given;
   - number of tutorial sheets (default **5**);
   - the assessment components.
3. **Counts:**
   - lecture slots = L × weeks;
   - tutorial hours = T × weeks.

   For 3-1-0 over 14 weeks this gives 42 lecture slots and 14 tutorial hours.
   Subtract holidays and exam weeks if dates are given.
4. If `$ARGUMENTS` starts with `update`, also read `COURSE-LOG.md` and go to Step 5.

## Step 2 — Lecture slots

- Split each syllabus unit into **lecture-sized topics**. One topic is one lecture of notes, typically 3–5 pages.
- Use the unit hours from the syllabus. If they do not fit the available slots, say so and propose where to cut or
  merge. Do not silently drop topics.
- Keep the syllabus order unless a prerequisite forces a change. If it does, explain the change.
- Every syllabus topic appears exactly once. Add nothing that is not in the syllabus.
- **COs (NBA):** give each lecture the CO(s) it serves, taken from the syllabus unit–CO mapping and the CO
  statements in `COURSE.md`. Every CO must have lectures; if one has none, report it.
- Leave 2–3 **buffer** slots for catch-up and revision, spread across the semester rather than all at the end.

## Step 3 — Tutorial blocks

- Divide the lecture slots into S contiguous blocks, one per tutorial sheet. S comes from `COURSE.md` (default 5).
- Make the blocks roughly equal. Where possible, end a block at a unit boundary.
- Sheet k is issued after its block's last lecture.
- The tutorial hours are shared among the sheets. For 3-1-0 over 14 weeks: 14 hours / 5 sheets ≈ 3 hours per sheet,
  so each sheet is worked through over about 3 tutorial sessions.
- No sheet may cover lectures that come after it.

## Step 4 — Assessments

- Place each component from `COURSE.md`, for example quizzes, mid-sem and end-sem.
- For each, give its week and its lecture range. The mid-sem usually covers lectures up to the week before it.
- Do not plan two assessments, or an assessment and a tutorial sheet deadline, in the same week unless the
  instructor wants that.

## Step 5 — Update mode (`/course-plan update`)

- Compare `COURSE-LOG.md` with the plan.
- Mark lectures with `Status: delivered` in the log as **done**, and lectures with `Status: prepared` as
  **written**. Note topics that took more or fewer slots than planned.
- Re-plan only the **remaining** slots, blocks and assessment ranges. Delivered lectures are never changed.
- If the remaining topics no longer fit, say which ones and propose options. Do not decide for the instructor.

## Step 6 — Write and check

- Write `Plan/plan.md` from `templates/plan-template.md`.
- Check with code:
  - the number of slots;
  - every syllabus topic appears exactly once;
  - every lecture is in exactly one tutorial block;
  - every assessment range ends before its week;
  - with NBA, every CO has at least one lecture, and every non-buffer lecture has a CO.

## Step 7 — Report

Reply briefly with:
- the path;
- the counts: lectures, buffer slots, sheets and their lecture ranges, assessments;
- with NBA, the number of lectures per CO;
- any syllabus topic that did not fit;
- any choice the instructor may want to change.
