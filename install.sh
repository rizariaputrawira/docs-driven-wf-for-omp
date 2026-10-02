#!/bin/sh
set -eu

DRY_RUN=0
SOURCE=''
HOME_OVERRIDE=''
while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --source) shift; [ "$#" -gt 0 ] || { echo 'missing --source value' >&2; exit 2; }; SOURCE=$1 ;;
    --home) shift; [ "$#" -gt 0 ] || { echo 'missing --home value' >&2; exit 2; }; HOME_OVERRIDE=$1 ;;
    -h|--help) echo 'Usage: install.sh [--dry-run] [--source DIR|URL] [--home DIR]'; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done

TMP=''
cleanup() { [ -z "$TMP" ] || rm -rf "$TMP"; }
trap cleanup EXIT HUP INT TERM
if [ -z "$SOURCE" ]; then SOURCE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd); fi
case "$SOURCE" in
  http://*|https://*)
    command -v curl >/dev/null 2>&1 || { echo 'curl is required for remote installation' >&2; exit 1; }
    command -v unzip >/dev/null 2>&1 || { echo 'unzip is required for remote installation' >&2; exit 1; }
    TMP=$(mktemp -d)
    curl --fail --location --silent --show-error "$SOURCE" -o "$TMP/archive.zip"
    unzip -q "$TMP/archive.zip" -d "$TMP/extracted"
  set -- "$TMP"/extracted/*
  [ "$#" -eq 1 ] && [ -d "$1" ] || { echo 'archive must contain exactly one root directory' >&2; exit 1; }
  SOURCE=$1
    ;;
esac
TEMPLATE=$SOURCE/config/agent/AGENTS.md
[ -f "$TEMPLATE" ] || { echo "missing template: $TEMPLATE" >&2; exit 1; }
# Validate source before touching the destination.
[ -s "$TEMPLATE" ] || { echo 'template is empty' >&2; exit 1; }
DEST=${HOME_OVERRIDE:-${HOME:?HOME is not set}}/.omp/agent/AGENTS.md
if [ -f "$DEST" ] && cmp -s "$TEMPLATE" "$DEST"; then
  echo "unchanged: $DEST"
  exit 0
fi
if [ "$DRY_RUN" -eq 1 ]; then echo "would install: $DEST"; exit 0; fi
mkdir -p "$(dirname "$DEST")"
if [ -e "$DEST" ]; then
  BACKUP="$DEST.bak.$(date -u +%Y%m%dT%H%M%SZ)"
  n=0
  while [ -e "$BACKUP" ]; do n=$((n + 1)); BACKUP="$DEST.bak.$(date -u +%Y%m%dT%H%M%SZ).$n"; done
  cp -p "$DEST" "$BACKUP"
  echo "backup: $BACKUP"
fi
cp "$TEMPLATE" "$DEST"
echo "installed: $DEST"
