# Core rules shared by all teaching skills

These rules apply to every document the teaching skills write: syllabus, lecture notes, tutorial sheets,
assessments and solutions. Each skill adds its own rules on top. Instructions from the user override `COURSE.md`, and
`COURSE.md` overrides these rules.

> This file is copied into every skill by `sync-shared.sh`. Edit the copy in `plugins/teaching/shared/`, never a
> skill's `shared/` copy.

## 1. Look

- Use plain LaTeX and the skill's own template in `templates/`:
  - article class, 11pt, A4;
  - margins, title block and page style exactly as in that template (lecture notes have a coloured title block and a
    running header; see the lecture style guide);
  - standard theorem environments and `booktabs` tables.
- Copy the macros and notation of earlier course documents, so all files of one course look alike.
- **Do not use** coloured boxes, `tcolorbox`, icons, margin notes, emoji or decorative rules.
  *Why:* heavy formatting looks machine-made and gets in the way of the content.

## 2. Voice

- Write like a teacher, in plain English with short sentences and full words. Use "we" in teaching text.
- Use a list only when the items really are a list.
- Avoid filler: "it is important to note", "in this section we will", grand summaries.

## 3. Order, scope and honesty

- **Use only what has been taught.** Student documents (notes, tutorials, assessments) use only material in
  `COURSE-LOG.md` and the course prerequisites. See `shared/course-log.md`.
- **Nothing about the future in student documents:** no "next lecture", no "we will see later", no roadmap.
  References *back* to earlier lectures are good. The one exception is the `/intro` page, which may name the main
  ideas of the course as the syllabus does, but gives no lecture-by-lecture roadmap.
- **Never invent facts.** This covers book titles, editions, authors, dates and university rules. If you are not sure
  of one, leave a clear `<to confirm: ...>` and list it in your report.
- Nothing from the `COURSE.md` **Exclude** list may appear.
- **Only genuine applications and examples.** Link a concept to an application only when the link is real and
  students will meet it. Never force a contrived one just to have an application.
  *Why:* a forced link reads as desperate and teaches nothing.
- **Examples need only the prerequisites.** An example must not depend on knowledge outside the course and its
  prerequisites, such as mechanics or circuit laws in a mathematics course. If an application needs such
  knowledge, mention it in one plain sentence or leave it out.

## 4. Every number is computed

- Never write a number, answer or worked step you have not computed. Use Python, sympy, Julia or similar in a scratch
  directory, never in the course folder.
- Every problem must be well posed and answerable with what students have been taught.
- Sums that must add up, such as hours, marks and lecture counts, are added up by code, not by eye.

## 5. Build and look

1. Build with `latexmk -pdf` in a scratch directory. You need 0 errors, 0 undefined references and 0 overfull boxes.
   Then copy the PDF next to the `.tex`.
2. Render **every page** to PNG (`pdftoppm -r 80 -png`) and **look at it**. Fix wide tables, stranded headings,
   cramped lists and problems split across pages, then rebuild.
3. Search the PDF text (`pdftotext`) of student documents for forbidden content: "next lecture", "later", "★",
   "instructor", `<`, `>` placeholders, and the Exclude list.

## 6. Files and course settings

- Look for `COURSE.md` in the current directory and its parents, and follow it. If it is missing, take what you can
  from existing course files, and ask only what you cannot find.
- **Finding the syllabus.** The instructor may have written it themselves, in any format: PDF, DOCX, TeX, Markdown
  or text. Look in this order:
  1. a path in `$ARGUMENTS`;
  2. the official syllabus file named in `COURSE.md`;
  3. the `Syllabus/` folder;
  4. a file in the course root whose name contains "syllabus".

  If none is found, ask for it in one short question. Suggest `/syllabus` only if the instructor has no syllabus
  at all. Never change, reword or add to a syllabus the instructor wrote.
- Follow the course's file layout. The default is in `shared/COURSE.template.md`.
- **Never overwrite** an existing document without asking.
- Never undo edits the instructor made by hand; they show the instructor's taste.
- When the user corrects something that is a general preference, apply it now and suggest adding it to the
  "House rules" in `COURSE.md`.

## 7. Accreditation (NBA)

When `COURSE.md` has `NBA: yes` (the default), follow `shared/nba-obe.md`. It covers COs, the CO–PO/PSO matrix,
and CO and Bloom tags. Never invent PSOs or PO statements, and never inflate a mapping.

## 8. Report

Reply briefly: the file paths, a short outline, any choice the instructor may want to change, and anything you could
not verify. Do not paste the documents into the chat.
