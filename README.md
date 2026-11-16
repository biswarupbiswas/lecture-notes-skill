# /lecture — lecture notes skill for Claude Code

`/lecture <topic>` writes the notes for **one lecture** of any university course, in any subject. The notes are
**short but complete** and read as if a teacher wrote them by hand.

The output is `lectureN.tex` and `lectureN.pdf`, in one fixed, simple format:
- motivation;
- the core ideas, with short proofs and worked examples;
- a summary;
- homework, if your course uses it.

Parts that only some subjects need are added only when the topic calls for them. These are algorithms, cost counts and a companion script.

Before it reports back, the skill checks the notes. Every number is computed, every page of the PDF is checked by eye, and nothing about future lectures is mentioned or guessed.

## Install

**Option 1 — install script (gives the command `/lecture`)**

```bash
git clone <this-repo-url> lecture-notes-skill
cd lecture-notes-skill
./install.sh                    # for your user, in every project
# or
./install.sh --project ~/teaching/MA1234    # only for one course folder
```

Remove it with `./install.sh --uninstall`.

**Option 2 — as a Claude Code plugin**

```
/plugin marketplace add <this-repo-url or local path>
/plugin install lecture@lecture-notes
```

Plugin skills are namespaced, so in that case the command may appear as `/lecture:lecture`.

**Requirements:**
- a LaTeX distribution with `latexmk`;
- `poppler-utils` (`pdftoppm`, `pdftotext`) for the page checks;
- Python 3 or Julia for checking numbers.

## Use

Open Claude Code in your course folder and type, for example:

```
/lecture Gaussian quadrature
/lecture The Lagrangian of a double pendulum
/lecture Newton's method for systems, keep it to 4 pages
```

You always name the topic. The skill never picks or predicts it.

The skill reads the previous lectures in the folder so that it can:
- keep the notation;
- reuse the running examples;
- refer back to earlier results;
- follow any edits you made by hand.

## Course settings: `COURSE.md`

Put a `COURSE.md` file in the course's root folder; the template is in `plugins/lecture/skills/lecture/templates/COURSE.template.md`. In it you can set:

- the course title, the instructor and the folder layout;
- the textbooks and the running examples;
- whether the course has homework, and whether it has companion code (by default it has none);
- an **Exclude** list of topics taught by someone else, which never appear in the notes;
- optional co-teacher material;
- **House rules**: corrections you want applied to every future lecture.

Without a `COURSE.md`, the skill works these out from the existing lecture files and asks only what it can't.

## Style, in short

The full rules are in `plugins/lecture/skills/lecture/reference/style-guide.md`, and `examples/` shows a finished lecture.

- Short but complete: every paragraph earns its place, typically 3–5 pages.
- Plain prose written by a teacher, in a fixed simple format. No coloured boxes, instructor notes or starred sections.
- Strict order: nothing is used before it is introduced.
- Nothing about future lectures: no "next lecture", no roadmap, no "we will see later".
- Short proofs; anything long is stated without proof.
- Algorithms, if there are any, are complete.
- Homework, if there is any, is pen and paper only.

## Layout

```
.claude-plugin/marketplace.json        plugin marketplace entry
plugins/lecture/.claude-plugin/plugin.json
plugins/lecture/skills/lecture/
    SKILL.md                           the workflow Claude follows
    reference/style-guide.md           style rules and final checklist
    templates/lecture-template.tex     LaTeX skeleton
    templates/COURSE.template.md       per-course settings
    examples/example-lecture.tex       a finished lecture (style reference)
    examples/example-companion.jl      its companion script
install.sh                             install / uninstall
```

## License

MIT, see `LICENSE`.
