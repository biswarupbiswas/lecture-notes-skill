#!/usr/bin/env bash
# Install the teaching skills for Claude Code: /syllabus, /course-plan, /lecture, /tutorial, /assessment.
#
#   ./install.sh                 install for your user (works in every project)  -> ~/.claude/skills/<skill>
#   ./install.sh --project DIR   install only for one project                    -> DIR/.claude/skills/<skill>
#   ./install.sh --uninstall [--project DIR]
#
# After installing, start Claude Code in a course folder and type /syllabus.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$here/plugins/teaching/skills"
target_root="$HOME/.claude"
uninstall=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) target_root="$(cd "${2:?--project needs a directory}" && pwd)/.claude"; shift 2 ;;
    --uninstall) uninstall=1; shift ;;
    -h|--help) sed -n '2,8p' "$0"; exit 0 ;;
    *) echo "unknown option: $1" >&2; exit 1 ;;
  esac
done

if [[ $uninstall -eq 1 ]]; then
  for src in "$skills_src"/*/; do
    dest="$target_root/skills/$(basename "$src")"
    if [[ -d "$dest" ]]; then rm -r -- "$dest"; echo "Removed $dest"; fi
  done
  exit 0
fi

# make sure every skill carries the current shared rules
"$here/sync-shared.sh" >/dev/null

mkdir -p "$target_root/skills"
stamp="$(date +%Y%m%d%H%M%S)"
for src in "$skills_src"/*/; do
  src="${src%/}"
  name="$(basename "$src")"
  [[ -f "$src/SKILL.md" ]] || { echo "skipping $name: no SKILL.md" >&2; continue; }
  dest="$target_root/skills/$name"
  if [[ -d "$dest" ]]; then
    # keep backups OUTSIDE skills/, otherwise Claude Code would load them as a second copy of the skill
    mkdir -p "$target_root/skill-backups"
    mv -- "$dest" "$target_root/skill-backups/$name.$stamp"
    echo "Existing $name moved to $target_root/skill-backups/$name.$stamp"
  fi
  cp -r -- "$src" "$dest"
  echo "Installed /$name to $dest"
done

for tool in latexmk pdftoppm pdftotext; do
  command -v "$tool" >/dev/null 2>&1 || echo "Note: '$tool' not found; the skills use it to build and check PDFs."
done
command -v julia >/dev/null 2>&1 || command -v python3 >/dev/null 2>&1 || \
  echo "Note: neither julia nor python3 found; the skills use one of them to verify numbers."
