# The course log: `COURSE-LOG.md`

`COURSE-LOG.md` sits in the course root, next to `COURSE.md`. It records the lectures that have been **written**,
with their status, and the tutorials and assessments that have been issued. It does not record what is only planned.

- `Status: delivered` means the lecture has been taught.
- `Status: prepared` means the notes are written but the lecture is not yet taught. This is what `/all-lectures`
  writes.

The instructor marks lectures delivered by editing the log, or by telling Claude, e.g. "lectures 1–8 were
delivered". Tutorials and assessments take their content only from logged lectures, and say so when a lecture in
their range is still `prepared`.

## Who writes it

| Skill | Adds |
|---|---|
| `/lecture` (also when run by `/all-lectures`) | one entry per lecture, after the PDF is built |
| `/tutorial` | one entry per sheet |
| `/assessment` | one entry per paper |

`/syllabus` and `/course-plan` never write to it. The plan is not the log.

If the log is missing but lecture files exist, rebuild it first from those files, in lecture order. Read each one
and write its entry. Tell the user you did this.

The instructor may edit the log by hand, for example to mark a lecture as skipped or a section as not covered.
Such edits always win over the lecture files.

## Entry format

Keep entries short and factual. Use the names and notation that the documents use.

```markdown
## Lecture 7 — Gaussian quadrature   (Lectures/lecture7.tex)
- Status: delivered
- Defined: orthogonal polynomials for a weight w(x); Gauss nodes x_i and weights w_i
- Results: the n-point rule is exact for degree 2n−1 (proved); error formula (stated without proof)
- Methods: computing nodes from the three-term recurrence
- Notation: w(x), x_i, w_i, P_n
- Examples: ∫₀¹ eˣ dx with n = 2 and n = 3
- Homework: 5 questions (computation; verify exactness for x³; proof for n = 1; ...)
- COs: CO3

## Tutorial 2 — Lectures 7–12   (Tutorials/tutorial2.tex)
- Problems: 11 (A: 3, B: 6, C: 2); one line per problem with its tags:
  1. 2-point Gauss rule for ∫₀² x⁴ dx [CO3, L3]; 2. ...

## Mid-semester exam — Lectures 1–18   (Assessments/midsem.tex)
- 30 marks, 90 min, 5 questions; one line per question: Q1(a) LU factorisation of a 3×3 matrix — 4 marks [CO1, L3]; ...
- Marks per CO: CO1 10, CO2 12, CO3 8. Marks per level: L2 6, L3 16, L4 8.
```

The `COs` line and the `[CO, L]` tags are written only when `COURSE.md` has `NBA: yes`. A lecture's COs come from
the syllabus mapping of its topic. CO attainment can later be computed from the tagged assessment entries.

"Results" says whether each result was proved, stated, or only used. This tells assessments what students can be
asked to prove.
