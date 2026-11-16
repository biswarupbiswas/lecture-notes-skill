---
name: lecture
description: Write one lecture's notes for any university course as a LaTeX file and PDF. The notes are short but complete and read as if a teacher wrote them by hand. They follow a fixed, simple format, every number in them is checked, and nothing about future lectures is guessed. Use when the user asks for lecture notes or types /lecture with a topic.
argument-hint: "<topic of this lecture> [extra instructions]"
---

# /lecture: write lecture notes

**Main aim:** notes that are **short but complete** and read as if a careful teacher wrote them by hand.
A student should be able to learn the topic from the notes alone, and nothing in them should be there just to fill space.

Request: `$ARGUMENTS`. Extra wishes from the user always override the defaults below.

Read `reference/style-guide.md` before writing. `examples/example-lecture.tex` shows the expected look.
Its subject is only an illustration: copy its *format and tone*, never its content.

---

## Step 1 — Topic and context

1. **The topic must come from the user.** If `$ARGUMENTS` names no topic, ask for it in one short question.
   Never guess the topic from a syllabus, a plan or the previous lecture.
2. **Course settings.** Look for `COURSE.md` in the current directory and its parents, and follow it.
   It may give the title, instructor, file layout, books, running examples, topics to exclude, companion code and house rules.
   If it is missing, take what you can from existing lecture files.
3. **Previous lectures.** Read the latest one or two lecture files fully. Keep:
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

- **Never write a number or a worked step you have not computed.** Use Python, sympy, Julia or similar in a scratch directory.
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

1. Build with `latexmk -pdf` in a scratch directory. You need 0 errors, 0 undefined references and 0 overfull boxes. Then copy the PDF next to the `.tex`.
2. Render **every page** to PNG and **look at it**. Fix wide tables, stranded headings, cramped lists and split algorithms, then rebuild.
3. Search the PDF text for forbidden content: "next lecture", "later", ★, "instructor", and the Exclude list.

## Step 6 — Companion code (only if asked for)

Write the code only when COURSE.md or the user asks for it, or the earlier lectures have it.
- Use the course's language, standard library only.
- Write one function per method in the notes, following the notes line by line.
- Include a demo that reproduces every example in the notes.
- Run it and confirm the output matches the notes.
- Keep the instructor's conventions from earlier scripts.

Any co-teacher material that COURSE.md asks for goes in separate files, never in the notes.

## Step 7 — Report

Go through the checklist in `reference/style-guide.md`. Then reply **briefly** with:
- the file paths;
- a 4–6 line outline;
- any choice the instructor may want to change;
- anything you could not verify.

Do not paste the notes into the chat and do not suggest what the next lecture should be.

When the user asks for changes, edit the file, rebuild, and look at the affected pages again.
If a correction is a general preference, apply it now and suggest adding it to the "House rules" in COURSE.md.
