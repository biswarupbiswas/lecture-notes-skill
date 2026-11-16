# COURSE.md — settings for the teaching skills

Put this file in the root folder of a course. Every teaching skill (`/syllabus`, `/course-plan`, `/lecture`,
`/tutorial`, `/assessment`) reads it every time. `/syllabus` can create it for you.
Every field is optional, so delete what you don't need.

## Course
- Code and title: <e.g. MA2101 Numerical Methods>
- Instructor (author line): <name>
- Audience: <e.g. 2nd-year B.Tech, all branches>
- Year of study: <1st | 2nd | 3rd | final> (sets the highest Bloom level of COs; see `shared/nba-obe.md` §1)
- Highest CO level (optional): <e.g. L3> (overrides the year's default: no CO above it, and at most one CO at it)
- Prerequisites: <e.g. calculus, linear algebra>
- L-T-P and credits: <e.g. 3-1-0, 4 credits>
- Weeks of teaching: <e.g. 14>
- Semester dates and holidays (optional): <start date; holidays; exam weeks>

## Files
- Layout (defaults shown):
  - `COURSE.md`, `COURSE-LOG.md` in the course root
  - `Syllabus/syllabus.tex`
  - `Plan/plan.md` (instructor only)
  - `Lectures/intro.tex` (the motivating page from `/intro`) and `Lectures/lectureN.tex` (all lectures in one folder,
    never one folder per lecture)
  - `Tutorials/tutorialN.tex` and `Tutorials/tutorialN-solutions.tex`
  - `Assessments/<name>.tex` and `Assessments/<name>-solutions.tex`
- Official syllabus file (if any): <path; it is used as given and never reworded>

## Lectures
- Problems at the end of each lecture: <yes (default) | no> (there is never a summary section)
- Companion code: <none (default) | Julia | Python | MATLAB ...>

## Tutorials
- Number of sheets: <5 (default)>
- Problems per sheet: <10–12 (default)>
- Solutions: <separate file (default) | none>
- Built: <as lectures are prepared (default): each lecture adds 2–3 problems to the open sheet, which closes at the
  end of its plan block | all at once with /tutorial>

## Assessments
- Components, marks and weights: <e.g. Quiz 1 and Quiz 2: 10 marks, 30 min each, 10% each;
  Mid-sem: 30 marks, 90 min, 30%; End-sem: 50 marks, 180 min, 50%>
- Allowed material: <e.g. closed book, non-programmable calculator>
- Bloom spread of marks (optional): <e.g. L1–L2 ≤ 30%, L3–L4 ≥ 50%, L5–L6 ≥ 10%>

## Accreditation (NBA)
Rules in `shared/nba-obe.md`.
- NBA: <yes (default) | no>
- Programme: <e.g. B.Tech Computer Science and Engineering>
- PO set: <NBA 11 POs (default) | path to the department's PO list>
- PSOs (from the department; never invented):
  - PSO1: <...>
  - PSO2: <...>
- CO code format: <CO1, CO2, ... (default) | C<course code>.<n>, e.g. MA2101.1>
- Course outcomes (filled in by /syllabus once approved):
  - CO1 (L3): <...>

## Content
- Textbooks / reading: <author, title, edition, publisher>
- Running examples to reuse: <e.g. f(x) = eˣ on [0, 1]; A = [4 1 0; 1 4 1; 0 1 4]>
- Application areas to prefer, when a genuine link exists: <e.g. computer science, machine learning, circuits>

## Exclude
Topics that must not appear in any document, e.g. because another instructor teaches them:
- <...>

## Co-teacher material (optional)
- <e.g. "also write a reference implementation for the lab instructor; keep it out of the notes">

## House rules
Corrections that should always apply. Add to this list over time:
- <...>
