# NBA outcome-based education (OBE): rules for all teaching skills

Follow this file when `COURSE.md` has `NBA: yes`, which is the default. It covers course outcomes (COs), their
mapping to programme outcomes (POs) and programme-specific outcomes (PSOs), and CO and Bloom tags on tutorials and
assessments, in the form the NBA Self Assessment Report (SAR) expects.

> Copied into every skill by `sync-shared.sh`. Edit only `plugins/teaching/shared/nba-obe.md`.

## 1. Course outcomes (COs)

- **Number:** 4–6 COs per course, typically 5 or 6. Together they cover the whole syllabus, and they do not overlap.
- **Label:** `CO1`, `CO2`, ... by default. If `COURSE.md` gives a CO code format, such as `C<course code>.<n>` as in
  `MA2101.1`, use that format everywhere.
- **Form:** one sentence that completes **"At the end of the course, the student should be able to …"**. A CO is a
  capability the student takes away from the course, not a topic of the course.
- **One action verb, from the table in §3, and only one.** No second verb hidden in a purpose clause, as in
  "Apply X to model and solve …" or "… to fit models and to compress images". Name the target with nouns instead:
  "… to data fitting and image compression".
- **Prefer the level's own name as the verb** wherever it reads naturally: Remember (L1), Understand (L2),
  Apply (L3), Analyse (L4), Evaluate (L5), Create (L6). Use another verb from the same row of §3 only when the name
  does not fit the sentence. Never use "know", "learn", "appreciate" or "be aware of".
- **The pattern depends on the year of study** (`Year` in `COURSE.md`):
  - **1st year:** `<one action verb> <a concept, method or standard problem of the course>`, with an optional
    short "using …". The object is the course's own mathematics or science, not an engineering application or a
    real-world system. A simple use may appear as an example, never as the point of the CO. Examples:
    "Remember the definitions of limit, continuity and differentiability" (L1); "Understand the geometric meaning
    of the derivative and the definite integral" (L2); in the rare L3 case, "Apply differentiation and integration
    to standard problems of one variable".
  - **2nd year and above:** `<one action verb> <a real-world system or problem> using <the mathematics of the
    course>`. The verb points at the real world, never at mathematics. What is solved, understood or evaluated is
    an engineering, computing, data or physical system or problem, not a matrix, a solution set or another
    mathematical object. Think of "Understand how a weather prediction model works", not "Understand
    eigenvalues". The mathematics comes after "using", as the means; name it briefly.
- **Test every CO before proposing it:** read it after the stem "At the end of the course, the student should be
  able to …", then ask what the object of the verb is. In a 1st-year course, rewrite it if the object is an
  application or a real-world system. From the 2nd year on, rewrite it if the object is a piece of mathematics.

  For the 2nd year and above:

  | Not a CO | Why | A CO |
  |---|---|---|
  | Solve systems of linear equations by Gaussian elimination. | solves mathematics | Solve engineering problems with unknown parameters, such as fitting curves through measured points and balancing flows in networks, using systems of linear equations and matrix algebra. |
  | Explain the structure of the solution set of a linear system using rank and the four fundamental subspaces. | explains mathematics with mathematics | Explain the degrees of freedom in underdetermined engineering and data models, such as flow networks and data sets with redundant features, using vector spaces, rank and the four fundamental subspaces. |
  | Explain eigenvalues, eigenvectors and diagonalization. | a topic list with a verb in front | Explain how a web search engine ranks pages, using eigenvalues, eigenvectors and Markov chains. |
  | Explain the long-term behaviour of iterative processes and Markov chains using eigenvalues. | Markov chains are mathematics too | (as above) |
  | Apply least squares and the SVD to fit models to data and to compress images. | two verbs (fit, compress) | Solve data-fitting and image-compression problems using least squares, orthogonal projections and the singular value decomposition. |

- **Level follows the verb, not ambition.** Do not force a CO up to a higher level. From the 2nd year on, if a CO
  does not genuinely solve an outside problem, give it a lower-level verb such as Understand, still pointed at a
  real system.
- **Bloom level:** give each CO the level of its verb (§3). The spread depends on the year of study (`Year` in
  `COURSE.md`; if it is missing, take it from the audience, or ask):

  | Year of study | CO levels | Notes |
  |---|---|---|
  | 1st year | L1–L2 | **L3 only in a rare case, for at most one CO; no L4–L6** |
  | 2nd and 3rd year | L2–L5 | mostly L3–L4 |
  | Final year, electives, projects | L2–L6 | include L4–L6 |

  `COURSE.md` may override this table for a course.
- **Taught and assessable:** everything a CO names must be taught in the units, and every CO must be
  testable in the course's assessments.

## 2. CO–PO/PSO articulation matrix

- **Rows** are COs; **columns** are PO1–PO11 (§4), then PSO1–PSOk from `COURSE.md`.
- **Cells:**
  - `3` means substantial (high) correlation;
  - `2` means moderate (medium);
  - `1` means slight (low);
  - `–` means no correlation.
- **Course row:** below the CO rows, a row with the **average of the non-empty cells** in each column, to 2
  decimals. Compute it with code. A column with no entries gets `–`.
- **Honest mapping:** map a CO to a PO only when the course content *and* its assessment actually address that PO.
  - A theory course usually maps mainly to PO1, PO2, and sometimes PO3, PO4, PO5 and PO11.
  - PO6–PO10 need real course activity, such as a project, report, team work, ethics or finance content. Do not map
    them for an ordinary lecture course.
  - Use `3` only when the CO is a main way the course addresses that PO.
  - Do not fill every cell. An inflated matrix fails scrutiny.
- **No justification section:** the syllabus shows the matrix only, with no written justification of the cells.
  Still check each non-empty cell yourself against the course content and assessment, and name any doubtful cell in
  the report to the instructor, not in the document.
- **PSOs:** PSO statements are written by the department. Take them from `COURSE.md`. If they are missing, ask once;
  if they are still unknown, mark the PSO columns `<to confirm>` and say so in the report. Never invent PSOs.

## 3. Bloom's taxonomy levels and verbs (revised taxonomy)

| Level | Category | Action verbs |
|---|---|---|
| L1 | Remember | Remember, State, List, Recall, Identify, Define, Name, Recognise, Reproduce, Enumerate, Label, Match, Outline |
| L2 | Understand | Understand, Explain, Describe, Interpret, Classify, Summarise, Paraphrase, Illustrate, Translate, Infer, Distinguish, Discuss, Review |
| L3 | Apply | Apply, Solve, Compute, Calculate, Construct, Use, Demonstrate, Perform, Execute, Implement, Operate, Sketch, Simulate |
| L4 | Analyse | Analyse, Examine, Determine, Distinguish, Compare, Investigate, Decompose, Differentiate, Organise, Attribute, Break down, Relate, Categorise |
| L5 | Evaluate | Evaluate, Justify, Assess, Critique, Argue, Validate, Judge, Defend, Prioritise, Recommend, Appraise, Conclude |
| L6 | Create | Create, Formulate, Design, Develop, Generalise, Derive, Model, Extend, Construct, Hypothesise, Invent, Synthesise, Propose, Plan |

Two verbs sit at two levels: Distinguish (L2 or L4) and Construct (L3 or L6). Give them the level of the thinking
the CO or question really needs. In a first-year course, use them at the lower level.

A CO starts with one of these verbs only, preferably the first one in its row, which is the level's name. If
`COURSE.md` gives the institution's own verb list, use that instead.

A question's Bloom level is the level of thinking it needs, not just its verb. "Compute" for a routine plug-in is
L3; "compute" that needs choosing and adapting a method may be L4.

## 4. Programme outcomes: the 11 POs (revised NBA SAR)

These are the 11 POs of the revised NBA SAR for engineering programmes, aligned with the Washington Accord graduate
attributes. Labels and names are listed with short statements. Before using them in a document, check them against
the institution's own SAR copy. If `COURSE.md` gives a different PO list, that list wins.

| PO | Name | Short statement |
|---|---|---|
| PO1 | Engineering knowledge | Apply knowledge of mathematics, natural science, computing, engineering fundamentals and an engineering specialisation to develop solutions to complex engineering problems. |
| PO2 | Problem analysis | Identify, formulate, review research literature and analyse complex engineering problems, reaching substantiated conclusions with consideration for sustainable development. |
| PO3 | Design/development of solutions | Design creative solutions for complex engineering problems and design/develop systems, components or processes to meet identified needs, with consideration for public health and safety, whole-life cost, net zero carbon, culture, society and environment as required. |
| PO4 | Conduct investigations of complex problems | Conduct investigations of complex engineering problems using research-based knowledge, including design of experiments, modelling, analysis and interpretation of data, to provide valid conclusions. |
| PO5 | Engineering tool usage | Create, select and apply appropriate techniques, resources and modern engineering and IT tools, including prediction and modelling, recognising their limitations, to solve complex engineering problems. |
| PO6 | The engineer and the world | Analyse and evaluate societal and environmental aspects while solving complex engineering problems, for their impact on sustainability with reference to economy, health, safety, legal framework, culture and environment. |
| PO7 | Ethics | Apply ethical principles and commit to professional ethics, human values, diversity and inclusion; adhere to national and international laws. |
| PO8 | Individual and collaborative team work | Function effectively as an individual, and as a member or leader in diverse or multidisciplinary teams. |
| PO9 | Communication | Communicate effectively and inclusively within the engineering community and society at large: comprehend and write effective reports and design documentation, and make effective presentations, considering cultural, language and learning differences. |
| PO10 | Project management and finance | Apply knowledge and understanding of engineering management principles and economic decision-making to one's own work, as a member and leader in a team, and to manage projects in multidisciplinary environments. |
| PO11 | Life-long learning | Recognise the need for, and have the preparation and ability for, independent and life-long learning, adaptability to new and emerging technologies, and critical thinking in the broadest context of technological change. |

## 5. Where COs appear in each document

| Document | What it shows |
|---|---|
| Syllabus | the CO table with Bloom levels, the CO–PO/PSO matrix with the average row; no justification section |
| Course plan | the CO(s) of each lecture; a check that every CO has lectures |
| Lecture notes | **no tags**: the notes stay plain teaching text. `COURSE-LOG.md` records the lecture's COs. |
| Tutorial sheet | a (CO, Bloom level) tag on every problem |
| Assessment paper | marks, CO and Bloom level on every question and sub-question; a CO-wise and Bloom-wise marks table in the solutions file |

## 6. Assessments and tutorials

- **CO coverage:** every CO taught in the range is assessed. In a mid-sem or end-sem paper, no single CO should
  carry more than about 40% of the marks unless the range contains only that CO.
- **Bloom spread:** follow `COURSE.md` if it sets one. Otherwise:
  - **1st year:** the marks follow the CO levels, so most are at L1–L2. L3 marks go only to an L3 CO, if the
    course has one;
  - **2nd year and above:** at most 40% of the marks at L1–L2; the rest at L3 and above, but never above the
    course's highest CO level (§1); some L5–L6 in end-sem papers only when the course has COs at those levels.
- **Tag honestly:** a question tagged with a CO must test that CO's verb and content. A question's Bloom level is at
  or below its CO's level, never above it. Harder questions in a first-year course stay at the CO's level: longer
  computations or combining two ideas, not higher-level questions.
- **Blueprint:** the solutions file ends with a table of marks per CO and per Bloom level, as numbers and
  percentages, computed with code. CO attainment is later calculated from these tags.
