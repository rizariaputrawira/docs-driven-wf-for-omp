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
INVENTORY=$REPO/config/files.tsv
[ -f "$INVENTORY" ] && [ ! -L "$INVENTORY" ] && [ -r "$INVENTORY" ] || { echo "unusable inventory: $INVENTORY" >&2; exit 2; }
TMP=$(mktemp -d) || { echo 'cannot create temporary directory' >&2; exit 2; }
trap 'rm -rf "$TMP"' EXIT HUP INT TERM
PLAN=$TMP/plan
: > "$PLAN"
awk -F '\t' '
  NF != 2 || $1 == "" || $2 == "" { exit 1 }
  { for (i=1; i<=2; i++) if ($i ~ /^\// || $i ~ /(^|\/)\.\.(\/|$)/ || $i ~ /(^|\/)\.($|\/)/ || $i ~ /(^|\/)($|\/)/) exit 1 }
  seen[$2]++ { exit 1 }
  $1 == "config/agent/AGENTS.md" { agents=1 }
  $1 == "config/agent/config.yml" { config=1 }
  END { if (NR == 0 || !agents || !config) exit 1 }
' "$INVENTORY" || { echo 'malformed, incomplete, or empty config/files.tsv' >&2; exit 2; }
while IFS="$(printf '\t')" read -r relative destination; do
  src=$REPO/$relative
  part=''; rest=$relative
  while [ -n "$rest" ]; do
    component=${rest%%/*}
    if [ "$rest" = "$component" ]; then rest=''; else rest=${rest#*/}; fi
    part=${part:+$part/}$component
    [ ! -L "$REPO/$part" ] || { echo "symlink source rejected: $src" >&2; exit 2; }
  done
  [ -f "$src" ] && [ -r "$src" ] || { echo "missing or unreadable regular source: $src" >&2; exit 2; }
  case "$relative" in config/agent/AGENTS.md|config/agent/config.yml) [ -s "$src" ] || { echo "required source is empty: $src" >&2; exit 2; } ;; esac
  dest=$HOME_DIR/$destination
  rest=${destination%/*}
  if [ "$rest" != "$destination" ]; then
    walk=$HOME_DIR
    while [ -n "$rest" ]; do
      component=${rest%%/*}
      if [ "$rest" = "$component" ]; then rest=''; else rest=${rest#*/}; fi
      walk=$walk/$component
      if [ -L "$walk" ] || { [ -e "$walk" ] && [ ! -d "$walk" ]; }; then echo "unsafe destination parent: $walk" >&2; exit 2; fi
    done
  fi
  if [ -L "$dest" ] || { [ -e "$dest" ] && [ ! -f "$dest" ]; }; then echo "unsafe destination: $dest" >&2; exit 2; fi
  printf '%s\t%s\n' "$src" "$dest" >> "$PLAN"
done < "$INVENTORY"

if [ "$MODE" = fix ]; then
  if ! sh "$REPO/install.sh" --source "$REPO" --home "$HOME_DIR"; then
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
    else echo "error: cannot compare $dest" >&2; exit 2
    fi
  fi
done < "$PLAN"
exit "$status"
