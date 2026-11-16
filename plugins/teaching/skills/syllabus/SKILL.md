---
name: syllabus
description: Create a university course's syllabus as LaTeX and PDF and set up the course folder (COURSE.md). Uses the official syllabus exactly as given when there is one; otherwise drafts one from the course details for the instructor to approve. Use when the user starts a new course, asks for a syllabus or course outline, or types /syllabus.
argument-hint: "[path to official syllabus | course title, L-T-P, audience, prerequisites, books]"
---

# /syllabus: the course syllabus and course setup

This is the first skill to run for a new course. It produces:
- `Syllabus/syllabus.tex` and `syllabus.pdf`, for students;
- `COURSE.md`, the settings file every teaching skill reads.

Request: `$ARGUMENTS`. Before writing, read `shared/style-core.md` and, unless `COURSE.md` says `NBA: no`,
`shared/nba-obe.md`. The syllabus is where the course outcomes (COs) and the CO–PO/PSO matrix for the NBA SAR are
made.

---

## Step 1 — Inputs and mode

1. Find `COURSE.md` and any earlier syllabus in the course folder.
2. Decide the **mode**:
   - **Official**: the user gives the university's syllabus, as a file (PDF, DOCX, text) or pasted text, or
     `COURSE.md` names one.
   - **Draft**: there is no official syllabus.
3. Collect what is missing in **one** short message. You need at least:
   - code and title;
   - L-T-P and credits, e.g. 3-1-0;
   - weeks of teaching (default 14);
   - audience, year of study and prerequisites;
   - in draft mode, the main topics or the textbook the instructor wants, if they have one;
   - the evaluation scheme, if the university fixes it;
   - for NBA:
     - the programme;
     - the department's **PSO statements**;
     - the CO code format, if the institution has one;
     - the PO list, if the department does not use the 11 NBA POs.

## Step 2a — Official mode: use it as given

- Transcribe faithfully: units, topics, hours, outcomes, books and evaluation scheme.
  **Do not reword, reorder, add or drop anything.** Only the layout changes.
- If something in it is inconsistent, report it and leave it as it is. Examples: unit hours do not add up to
  L × weeks, or a book is listed twice.
- If the official syllabus lacks a part the template has, leave that part out. Do not invent it.
  **The one exception is NBA.** If the official syllabus has no COs or no CO–PO/PSO matrix, write them as in
  Step 2c. Put them in a separate section headed "Course outcomes and mapping (proposed)", and mark them for the
  instructor to approve.
- If the official COs break the rules in `shared/nba-obe.md` §1, keep them as they are and list the problems in the
  report. Examples: an unmeasurable verb such as "understand", or too many COs.

## Step 2b — Draft mode: write a draft for approval

- **Course objectives**: 2–4 sentences on what the course is for.
- **Course outcomes**: written as in Step 2c.
- **Units**: typically 4–6. Give each unit a title, its topics in teaching order, and its lecture hours.
  - Unit hours add up to the lecture hours, L × weeks, minus 2–3 hours of buffer. Say how many buffer hours you left.
  - The order respects prerequisites.
  - Nothing from the Exclude list.
- **Textbooks and references**: only books you are certain exist, with author, title, edition and publisher.
  If you are unsure of any detail, write `<to confirm>` rather than guessing.
- **Evaluation**: take it from the user or `COURSE.md`. Otherwise leave `<to be decided by the instructor>`.
- Put "Draft" in the document title. Remove it only after the instructor approves the syllabus.

## Step 2c — Course outcomes and CO–PO/PSO matrix (NBA)

Follow `shared/nba-obe.md` §1–§4:
- 4–6 COs, each one sentence with one measurable verb and a Bloom level, in the CO code format of `COURSE.md`.
  The levels stay within the range for the year of study: L1–L3 for a first-year course (`shared/nba-obe.md` §1);
- each CO states what students can do in a wider engineering, computing or data situation, not a mathematical
  procedure (`shared/nba-obe.md` §1, "Scope of the verb"). Add to the units the applications the COs name;
- every unit serves at least one CO, and every CO is served by at least one unit. Show the CO(s) of each unit in
  the unit table;
- the articulation matrix:
  - rows are COs; columns are PO1–PO11, then the PSOs;
  - cells are 3, 2, 1 or –, with honest, non-inflated mapping;
  - an average row, computed with code;
- no justification section in the document. Check each non-empty cell against the course content, and name any
  doubtful cell in the report.

If `COURSE.md` says `NBA: no`, write 4–6 plain COs with measurable verbs, and no matrix.

## Step 3 — Check

With code:
- unit hours add up as stated;
- tutorial hours = T × weeks;
- evaluation weights add up to 100%;
- the matrix average row;
- every CO appears in at least one unit, and every unit has a CO.

By reading:
- every CO starts with a measurable verb whose Bloom level matches its tag, and no CO is above the year's level;
- every CO names a wider situation, not a procedure, and the units teach the applications it names;
- no PO is mapped without a real activity behind it, and no PSO is invented;
- every topic belongs to the course level;
- nothing is invented.

## Step 4 — Write and build

Use `templates/syllabus-template.tex` and follow `shared/style-core.md` §1 and §5. The syllabus has no proofs or
examples. Use tables for units, hours and evaluation, and short plain lines for everything else. It should fit on
2–3 pages, including the NBA mapping.

## Step 5 — Set up the course folder

- **No `COURSE.md` yet:** create it from `shared/COURSE.template.md`.
  - Fill in everything the syllabus fixes: course, L-T-P, weeks, prerequisites, textbooks, evaluation.
  - Fill in the year of study and the Accreditation section: programme, PSOs, CO code format, and the approved COs with their levels.
    The other skills read the COs from there.
  - Fill in the official syllabus path, if there is one.
  - Keep the defaults for the rest: layout, homework, 5 tutorial sheets, no companion code.
  - Delete fields that do not apply.
- **`COURSE.md` already exists:** change only the fields the syllabus fixes, and show the user what changed.
  Never touch Exclude, House rules or co-teacher material.
- Do not create `COURSE-LOG.md`; `/lecture` creates it.

## Step 6 — Report

Reply briefly with:
- the paths;
- the mode (official or draft);
- a unit list with hours;
- the COs with their Bloom levels, and which POs and PSOs they map to;
- any doubtful CO–PO cell, with the reason;
- every `<to confirm>` item and inconsistency found, including missing PSOs and any CO problems.

In draft mode, ask the instructor to approve or edit the draft. Once it is approved, the next step is
`/course-plan`.
