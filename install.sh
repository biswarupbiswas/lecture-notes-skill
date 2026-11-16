#!/usr/bin/env bash
# Install the /lecture skill for Claude Code.
#
#   ./install.sh                 install for your user (works in every project)  -> ~/.claude/skills/lecture
#   ./install.sh --project DIR   install only for one project                    -> DIR/.claude/skills/lecture
#   ./install.sh --uninstall [--project DIR]
#
# After installing, start Claude Code and type /lecture.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src="$here/plugins/lecture/skills/lecture"
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

dest="$target_root/skills/lecture"

if [[ $uninstall -eq 1 ]]; then
  if [[ -d "$dest" ]]; then rm -r -- "$dest"; echo "Removed $dest"; else echo "Nothing to remove at $dest"; fi
  exit 0
fi

[[ -f "$src/SKILL.md" ]] || { echo "SKILL.md not found in $src" >&2; exit 1; }
mkdir -p "$target_root/skills"
if [[ -d "$dest" ]]; then
  # keep backups OUTSIDE skills/, otherwise Claude Code would load them as a second /lecture
  mkdir -p "$target_root/skill-backups"
  backup="$target_root/skill-backups/lecture.$(date +%Y%m%d%H%M%S)"
  mv -- "$dest" "$backup"
  echo "Existing install moved to $backup"
fi
cp -r -- "$src" "$dest"
echo "Installed /lecture to $dest"

for tool in latexmk pdftoppm pdftotext; do
  command -v "$tool" >/dev/null 2>&1 || echo "Note: '$tool' not found; /lecture uses it to build and check the PDF."
done
command -v julia >/dev/null 2>&1 || command -v python3 >/dev/null 2>&1 || \
  echo "Note: neither julia nor python3 found; /lecture uses one of them to verify numbers."
