# Style guide for lecture notes

The aim is notes that are **short but complete** and **human-like**. This guide adds the lecture-specific rules to
`shared/style-core.md`, which you must also follow. Each rule has a short reason, so you can judge cases it does not
cover. Instructions from the user or from `COURSE.md` override this guide.

## 1. Format (always the same)

- Use `templates/lecture-template.tex`: a bold course line, then "Lecture N: title" in `\large`, then the author.
  Number the sections.
- The sections come in this order:
  1. motivation;
  2. core sections;
  3. method (optional);
  4. summary;
  5. homework (optional).
- Write one `.tex` file, ready for students, with no instructor/student switches.
- Do not add "Key idea" panels, instructor notes, timing plans, or "do on the board" cues. Use at most one `\boxed{}`
  formula, for *the* key result.

## 2. Transitions

- Move into each new part with a sentence saying why we need it now, rather than an abrupt heading.
  *Why:* a heading such as "Why X is allowed", dropped in without warning, confused readers.
- Bold only words being defined, or the single key word of a sentence.

## 3. Less but complete

- Teach the topic fully, so a student can learn it from the notes alone, even if they have met it before.
- Cover exactly the topic asked for. Do not add neighbouring topics, history, applications lists or further reading
  unless asked.
- Each section must earn its place. If removing a paragraph loses nothing, remove it.
- Typical length is 3–5 pages.

## 4. Sequencing

- Define every symbol and concept before it is used, or used as motivation.
- Show the problem before the fix.
- State a result before using it to explain an example.
- **No starred, optional or "for reading" sections.** Leave a side topic out, or state it in one sentence.

## 5. Proofs and results

- Keep proofs short and elementary. If a proof is long or needs heavy tools, write "we state this without proof" and
  add one sentence of intuition.
- After a result, one sentence may say what it means in practice.

## 6. Examples

- A worked example with simple numbers, done step by step as on a blackboard: show the first step in full, then a
  short table or the remaining steps.
- A second example only if it shows something new, such as typical behaviour, a failure, or a special case.
- Reuse the course's running examples when possible.
- Follow each example with one sentence on what it shows.
- Tables have few columns and 5 significant digits.

## 7. Methods and algorithms (only when the topic is a method)

- Pseudocode (`algorithm` + `algpseudocode`, `noend`) must be complete: every quantity is an input or is computed in
  an earlier line. Define each matrix or operator inside the algorithm, or name the section that defines it.
  *Why:* an algorithm using "A ← PᵀAP" without defining P was rejected as incomplete.
- Comments are short plain-English phrases. Line numbers mentioned in the text must match the PDF.
- If cost matters to the course, derive it in one line rather than just stating it.
- Use mathematical names ("inner product"), never code names (`dot`, `axpy`).

## 8. Summary and homework

- **Summary:** 3–6 one-sentence bullet points, with no new material.
- **Homework**, if the course uses it: 4–7 questions, pen and paper only (code belongs to the companion script). Mix:
  - a short computation;
  - verifying a step from the notes;
  - a small proof;
  - a "what happens if…" question.

  Each question must be well posed and answerable from the notes.

## 9. Final checklist

- [ ] The notes are short but complete: nothing is padded and nothing needed is missing.
- [ ] They follow the fixed format, with no boxes, instructor notes or starred sections.
- [ ] Every concept is introduced before use, and there are no abrupt headings.
- [ ] Nothing refers to future lectures or guesses what comes next.
- [ ] Every number was computed, and every worked step matches the computation.
- [ ] Long proofs are stated without proof.
- [ ] Any algorithm is complete, and its line references match the PDF.
- [ ] Nothing from the COURSE.md Exclude list appears.
- [ ] Every exercise is well posed and pen and paper only.
- [ ] The build is clean, and every page was rendered and inspected.
- [ ] If there is companion code, it runs and matches the notes.
- [ ] The lecture's entry was added to `COURSE-LOG.md`.
