#!/bin/sh
set -eu
MODE=check
HOME_OVERRIDE=''
while [ "$#" -gt 0 ]; do
  case "$1" in
    --check) MODE=check ;;
    --fix) MODE=fix ;;
    --home) shift; [ "$#" -gt 0 ] && [ -n "$1" ] || { echo 'missing --home value' >&2; exit 2; }; HOME_OVERRIDE=$1 ;;
    -h|--help) echo 'Usage: doctor.sh [--check|--fix] [--home DIR]'; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO=$(dirname "$SCRIPT_DIR")
TEMPLATE=$REPO/config/agent/AGENTS.md
[ -f "$TEMPLATE" ] && [ -s "$TEMPLATE" ] || { echo "unusable source template: $TEMPLATE" >&2; exit 2; }
HOME_DIR=${HOME_OVERRIDE:-${HOME:-}}
[ -n "$HOME_DIR" ] && [ -d "$HOME_DIR" ] || { echo 'home must name an existing directory' >&2; exit 2; }
DEST=$HOME_DIR/.omp/agent/AGENTS.md
if [ "$MODE" = fix ]; then
  sh "$REPO/install.sh" --source "$REPO" --home "$HOME_DIR"
  exit $?
fi
if [ ! -f "$DEST" ]; then echo "missing: $DEST"; exit 1; fi
if cmp -s "$TEMPLATE" "$DEST"; then echo "pass: $DEST matches canonical template"; exit 0; fi
echo "drift: $DEST differs from canonical template"
exit 1
