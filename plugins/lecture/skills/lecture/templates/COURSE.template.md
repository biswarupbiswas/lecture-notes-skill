# COURSE.md — settings for the /lecture skill

Put this file in the root folder of a course. `/lecture` reads it every time.
Every field is optional, so delete what you don't need. You always give the topic yourself (`/lecture <topic>`),
and the skill never guesses what comes next.

## Course
- Code and title: <e.g. PH2101 Classical Mechanics>
- Instructor (author line): <name>
- Audience: <e.g. 2nd-year undergraduates>

## Files
- Layout: <e.g. `LectureN/lectureN.tex`, PDF next to it>
- Homework: <yes (default) | no>
- Companion code: <none (default) | Julia | Python | MATLAB ...>

## Content
- Textbooks / reading: <...>
- Running examples to reuse: <e.g. the simple pendulum; A = [2 1 0; 1 2 1; 0 1 2]>

## Exclude
Topics that must not appear in the notes, e.g. because another instructor teaches them:
- <...>

## Co-teacher material (optional)
- <e.g. "also write a reference implementation and a one-page handoff note for the lab instructor;
  keep them out of the notes">

## House rules
Corrections that should always apply. Add to this list over time:
- <...>
