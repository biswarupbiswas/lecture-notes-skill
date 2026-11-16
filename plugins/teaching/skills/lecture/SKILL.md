---
name: lecture
description: Write one lecture's notes for any university course as a LaTeX file and PDF. The notes are short but complete and read as if a teacher wrote them by hand. They follow a fixed, simple format, every number in them is checked, and nothing about future lectures is guessed. Use when the user asks for lecture notes or types /lecture with a topic.
argument-hint: "<topic of this lecture> [extra instructions]"
---

# /lecture: write lecture notes

**Main aim:** notes that are **short but complete** and read as if a careful teacher wrote them by hand.
A student should be able to learn the topic from the notes alone, and nothing in them should be there just to fill space.

Request: `$ARGUMENTS`. Extra wishes from the user always override the defaults below.

Before writing, read:
- `shared/style-core.md`: rules shared by all teaching skills;
- `reference/style-guide.md`: rules for lecture notes;
- `shared/course-log.md`: the course log you update at the end.

`examples/example-lecture.tex` shows the expected look.
Its subject is only an illustration: copy its *format and tone*, never its content.

---

## Step 1 — Topic and context

1. **The topic must come from the user.** If `$ARGUMENTS` names no topic, ask for it in one short question.
   Never guess the topic from a syllabus, the course plan (`Plan/plan.md`) or the previous lecture.
   **Batch mode:** when `/all-lectures` calls this skill with `batch mode: topic approved by the instructor`, the
   topic, lecture number and CO(s) are given and approved. Do not stop to ask questions. Make sensible choices, follow the house
   rules, and list your choices in the report. Stop only for a real blocker.
2. **Course settings.** Find `COURSE.md` and follow it (`shared/style-core.md` §6).
   It may give the title, instructor, file layout, books, running examples, topics to exclude, companion code and house rules.
3. **Previous lectures.** Read `COURSE-LOG.md` and the latest one or two lecture files fully. Keep:
   - their notation, macros and running examples;
   - any edits the instructor made by hand, which show their taste. Never undo them.

   You may refer back to earlier lectures.
4. **Output file** follows the course layout (default `LectureN/lectureN.tex`). Never overwrite an existing lecture without asking.

## Step 2 — Plan, keeping only what the topic needs

Use the **fixed format** of `templates/lecture-template.tex` and include only the parts that this topic needs:

| Part | Include |
|---|---|
| Title block, as in the template | always |
| 1. Motivation: link to what students know, and the question this lecture answers | always |
| Core sections: definitions, ideas, results with short proofs, worked examples, in a strict order | always |
| Method / algorithm with its cost | only if the topic *is* a method or procedure |
| Summary (3–6 bullets) | always |
| Homework / exercises | if the course uses them (default yes, 4–7 questions, pen and paper) |
| Companion code | only if COURSE.md asks for it or the earlier lectures have it |

Check the **sequencing**: nothing may be used, or used as motivation, before it is introduced.
Aim for the shortest notes that are still complete, typically **3–5 pages**. When in doubt, cut.

## Step 3 — Check every number and claim

- **Never write a number or a worked step you have not computed** (`shared/style-core.md` §4).
- Choose examples whose arithmetic students can follow by hand.
- Work out each worked example step by step in exactly the form the notes will show it.
- Check that every exercise is well posed and can be answered from the notes.

## Step 4 — Write

Follow `reference/style-guide.md`. The essentials:
- plain prose and short paragraphs, using "we", with natural transitions rather than abrupt headings;
- no coloured boxes, instructor notes, starred or optional sections, or "further reading" detours;
- **nothing about future lectures:** no "next lecture", no roadmap, no "we will see later";
- long proofs become "we state this without proof";
- nothing from the COURSE.md "Exclude" list;
- if there is an algorithm, it is complete, with every symbol defined.

## Step 5 — Build and look

Follow `shared/style-core.md` §5: a clean build, every page rendered and inspected, and the PDF text searched for
forbidden content.

## Step 6 — Companion code (only if asked for)

Write the code only when COURSE.md or the user asks for it, or the earlier lectures have it.
- Use the course's language, standard library only.
- Write one function per method in the notes, following the notes line by line.
- Include a demo that reproduces every example in the notes.
- Run it and confirm the output matches the notes.
- Keep the instructor's conventions from earlier scripts.

Any co-teacher material that COURSE.md asks for goes in separate files, never in the notes.

## Step 7 — Update the course log

Add this lecture's entry to `COURSE-LOG.md`, in the format of `shared/course-log.md`. Its status is `prepared` in
batch mode, or if the user says the lecture is not yet taught; otherwise it is `delivered`. With NBA (the `COURSE.md`
default), the entry includes the lecture's CO(s), taken from the syllabus mapping of its topic. The notes themselves
carry **no** CO tags. Create the file if it is missing;
if earlier lectures exist but are not logged, add their entries first.

## Step 8 — Report

Go through the checklist in `reference/style-guide.md`. Then reply **briefly** with:
- the file paths;
- a 4–6 line outline;
- any choice the instructor may want to change;
- anything you could not verify.

Do not paste the notes into the chat and do not suggest what the next lecture should be.

When the user asks for changes, edit the file, rebuild, look at the affected pages again, and update the log entry
if what was taught changed.
