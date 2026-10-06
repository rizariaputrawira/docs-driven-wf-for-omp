#!/bin/sh
set -eu
usage() { echo 'Usage: doctor.sh [--check|--fix] [--home DIR]'; }
MODE=check
MODE_SET=0
HOME_OVERRIDE=''
while [ "$#" -gt 0 ]; do
  case "$1" in
    --check|--fix)
      next=${1#--}
      if [ "$MODE_SET" -eq 1 ] && [ "$MODE" != "$next" ]; then echo 'cannot combine --check and --fix' >&2; usage >&2; exit 2; fi
      MODE=$next; MODE_SET=1
      ;;
    --home)
      shift
      [ "$#" -gt 0 ] && [ -n "$1" ] || { echo 'missing --home value' >&2; usage >&2; exit 2; }
      case "$1" in -*) echo "invalid --home value: $1" >&2; usage >&2; exit 2 ;; esac
      HOME_OVERRIDE=$1
      ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done
SCRIPT_DIR=$(CDPATH= cd -P -- "$(dirname -- "$0")" && pwd) || { echo 'cannot resolve script directory' >&2; exit 2; }
REPO=$(dirname -- "$SCRIPT_DIR")
HOME_DIR=${HOME_OVERRIDE:-${HOME:-}}
[ -n "$HOME_DIR" ] && [ -d "$HOME_DIR" ] && [ ! -L "$HOME_DIR" ] || { echo 'home must be an existing real directory' >&2; exit 2; }
HOME_DIR=$(CDPATH= cd -P -- "$HOME_DIR" && pwd) || { echo 'unusable home directory' >&2; exit 2; }
TMP=$(mktemp -d) || { echo 'cannot create temporary directory' >&2; exit 2; }
trap 'rm -rf "$TMP"' EXIT HUP INT TERM
PLAN=$TMP/plan
sh "$SCRIPT_DIR/validate-inventory.sh" "$REPO" "$HOME_DIR" > "$PLAN"

if [ "$MODE" = fix ]; then
  if ! sh "$REPO/install.sh" --source "$REPO" --home "$HOME_DIR"; then
    echo 'managed summary: errors found'
    echo 'repair failed' >&2
    exit 2
  fi
fi
status=0
while IFS="$(printf '\t')" read -r template dest; do
  if [ ! -e "$dest" ]; then echo "missing: $dest"; status=1
  elif cmp -s "$template" "$dest"; then echo "pass: $dest matches canonical template"
  else
    result=$?
    if [ "$result" -eq 1 ]; then echo "drift: $dest differs from canonical template"; status=1
    else echo 'managed summary: errors found'; echo "error: cannot compare $dest" >&2; exit 2
    fi
  fi
done < "$PLAN"
if [ "$status" -eq 0 ]; then echo 'managed summary: healthy'; else echo 'managed summary: errors found'; fi
legacy=0
for base in .agent .agents; do
  parent="$HOME_DIR/$base"
  root="$parent/skills"
  if [ -L "$parent" ]; then echo "advisory: LEGACY skill root is a symlink, not traversed: $parent"; legacy=1
  elif [ -L "$root" ]; then echo "advisory: LEGACY skill root is a symlink, not traversed: $root"; legacy=1
  elif [ -d "$root" ]; then
    echo "advisory: LEGACY skill root present: $root"; legacy=1
    for entry in "$root"/* "$root"/.[!.]* "$root"/..?*; do
      [ -e "$entry" ] || [ -L "$entry" ] || continue
      if [ -L "$entry" ]; then echo "advisory: LEGACY symlink entry not traversed: $entry"
      else echo "advisory: LEGACY skill root entry: $entry"; fi
    done
  fi
done
native="$HOME_DIR/.omp/agent"
if [ -L "$HOME_DIR/.omp" ]; then
  echo "advisory: UNMANAGED native root is a symlink, not traversed: $HOME_DIR/.omp"
  legacy=1
elif [ ! -L "$native" ] && [ -d "$native" ]; then
  for entry in "$native"/* "$native"/.[!.]* "$native"/..?*; do
    [ -e "$entry" ] || [ -L "$entry" ] || continue
    [ -L "$entry" ] && continue
    name=${entry##*/}
    [ "$name" = skills ] && continue
    prefix=".omp/agent/$name"
    if ! awk -F '	' -v p="$prefix" '$2 == p || index($2,p "/") == 1 { found=1 } END { exit !found }' "$REPO/config/files.tsv"; then
      echo "advisory: UNMANAGED native entry: $entry"; legacy=1
    fi
  done
  skills="$native/skills"
  if [ ! -L "$skills" ] && [ -d "$skills" ]; then
    for entry in "$skills"/* "$skills"/.[!.]* "$skills"/..?*; do
      [ -e "$entry" ] || [ -L "$entry" ] || continue
      [ -L "$entry" ] && continue
      name=${entry##*/}
      if awk -v n="$name" '$0 == n { found=1 } END { exit !found }' "$SCRIPT_DIR/retired-skills.txt"; then
        echo "advisory: LEGACY retired skill: $entry"; legacy=1
      elif ! awk -F '	' -v p=".omp/agent/skills/$name/" 'index($2,p) == 1 { found=1 } END { exit !found }' "$REPO/config/files.tsv"; then
        echo "advisory: UNMANAGED native skill: $entry"; legacy=1
      fi
    done
  fi
fi
[ "$legacy" -eq 0 ] && echo 'advisory summary: no unmanaged observations'
exit "$status"
