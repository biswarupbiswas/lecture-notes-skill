#!/usr/bin/env bash
# Copy plugins/teaching/shared/ into every skill as <skill>/shared/.
# Skills are installed one folder at a time, so each one needs its own copy of the shared rules.
#
#   ./sync-shared.sh           update every skill's shared/ copy
#   ./sync-shared.sh --check   only report copies that are out of date (exit 1 if any)
#
# Always edit plugins/teaching/shared/, then run this script and commit the copies.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
shared="$here/plugins/teaching/shared"
check=0
[[ "${1:-}" == "--check" ]] && check=1

stale=0
for skill in "$here"/plugins/teaching/skills/*/; do
  skill="${skill%/}"
  [[ -f "$skill/SKILL.md" ]] || continue
  if [[ $check -eq 1 ]]; then
    if ! diff -rq "$shared" "$skill/shared" >/dev/null 2>&1; then
      echo "out of date: ${skill#"$here"/}/shared"
      stale=1
    fi
  else
    rm -rf -- "$skill/shared"
    cp -r -- "$shared" "$skill/shared"
    echo "synced ${skill#"$here"/}/shared"
  fi
done
exit $stale
