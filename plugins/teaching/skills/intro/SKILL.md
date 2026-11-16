---
name: intro
description: Write a short motivating page for the start of a university course, telling students why the course is worth learning and where they will use it, as LaTeX and PDF. Built from the syllabus and COURSE.md, with genuine uses only. Use when the user asks for an introduction, a motivation page, a "why study this course" handout or a first-day page, or types /intro.
argument-hint: "[extra instructions]"
---

# /intro: why learn this course

Writes `Lectures/intro.tex` and `Lectures/intro.pdf`: one or two pages for students, handed out or shown on the
first day, before Lecture 1. It answers one question: **why should I learn this course, and where will I use it?**

Request: `$ARGUMENTS`. Before writing, read `shared/style-core.md` and, unless `COURSE.md` says `NBA: no`,
`shared/nba-obe.md`.

---

## Step 1 — Inputs

1. **Syllabus.** Find it as in `shared/style-core.md` §6. It may be one the instructor wrote themselves.
2. **From `COURSE.md`:** the course, the audience and their programmes, the prerequisites, the course outcomes, the
   application areas to prefer, the Exclude list and the house rules.
3. **Existing page.** If `Lectures/intro.tex` exists, never overwrite it without asking. If the user asks for
   changes, edit it.

## Step 2 — Plan the page

The page is a motivation, not a lecture. It has no definitions, theorems, proofs or problems.

- **Open with a question or a situation the students already know.** Take it from their programme and their daily
  life, such as a search engine, a photo on a phone, a map app or a recommendation. It must need no knowledge beyond
  the prerequisites.
- **Then 3–5 short sections, one per genuine use.** Each says, in plain words:
  - a real problem or system;
  - what the course gives for it, named in everyday language;
  - when students will meet it: in which later courses, kinds of jobs or tools.

  Take the uses from the course outcomes and the application areas in `COURSE.md`, so that the page and the COs
  promise the same things.
- **At most one small concrete illustration**, with numbers that work out by hand, if it makes a use vivid. Compute
  it with code. No formulas beyond what a student who has met the prerequisites can read.
- **End with one short paragraph on how to learn the course well**: work the problems, come to the tutorials, and
  why the proofs matter. No grade rules: those are in the syllabus.

## Step 3 — Honesty rules

- **Only genuine uses** (`shared/style-core.md` §3). Every use named must be real, and the course must really teach
  the mathematics behind it. If you cannot name where students will meet a use, leave it out.
- **No hype.** No "revolutionary", no "the most important subject", no claims about salaries or industries. Say what
  the course does and where it is used.
- **Never invent facts.** No made-up statistics, company practices, dates or quotations. A well-known fact, such as
  that a search engine ranked pages with eigenvectors, may be stated in plain words without numbers.
- **What the page may say about the future.** This page is the one student document that looks ahead, because that
  is its purpose. It may name the main ideas of the course as the syllabus does. It must not give a lecture-by-lecture
  roadmap, dates, or promises beyond the syllabus.
- Nothing from the `COURSE.md` Exclude list may appear.

## Step 4 — Write

- Use `templates/intro-template.tex`, with the same preamble and macros as the course's lectures if any exist.
- Follow `shared/style-core.md` §1–§2: plain English, short sentences, "we" and "you", no boxes, icons or emoji.
- One to two pages. When in doubt, cut.

## Step 5 — Build and look

Follow `shared/style-core.md` §5: a clean build, every page rendered and looked at, and the PDF text searched for
placeholders and Exclude-list topics. The roadmap rule of style-core §3 is relaxed here as Step 3 says.

## Step 6 — Report

Reply briefly with:
- the paths;
- the opening question and the uses named, one line each, with the CO each one matches;
- any claim you could not verify;
- any choice the instructor may want to change.

`/intro` does not write to `COURSE-LOG.md`: it teaches no content that tutorials or assessments may use.
