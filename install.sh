#!/bin/sh
set -eu

usage() { echo 'Usage: install.sh [--dry-run] [--source DIR|URL] [--home DIR]'; }
DRY_RUN=0
SOURCE=''
HOME_OVERRIDE=''
while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --source|--home)
      option=$1
      shift
      [ "$#" -gt 0 ] && [ -n "$1" ] || { echo "missing $option value" >&2; usage >&2; exit 2; }
      case "$1" in -*) echo "invalid $option value: $1" >&2; usage >&2; exit 2 ;; esac
      if [ "$option" = --source ]; then SOURCE=$1; else HOME_OVERRIDE=$1; fi
      ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

TMP=''
cleanup() { [ -z "$TMP" ] || rm -rf "$TMP"; }
trap cleanup 0
trap 'cleanup; exit 2' HUP INT TERM
SCRIPT_DIR=$(CDPATH= cd -P -- "$(dirname -- "$0")" && pwd)
[ -n "$SOURCE" ] || SOURCE=$SCRIPT_DIR
case "$SOURCE" in
  http://*|https://*)
    command -v curl >/dev/null 2>&1 || { echo 'curl is required for remote installation' >&2; exit 2; }
    command -v unzip >/dev/null 2>&1 || { echo 'unzip is required for remote installation' >&2; exit 2; }
    TMP=$(mktemp -d) || { echo 'cannot create temporary directory' >&2; exit 2; }
    curl --fail --location --silent --show-error "$SOURCE" -o "$TMP/archive.zip" || { echo 'cannot download source archive' >&2; exit 2; }
    mkdir "$TMP/extracted"
    unzip -q "$TMP/archive.zip" -d "$TMP/extracted" || { echo 'invalid source archive' >&2; exit 2; }
    ROOT_COUNT=0; ROOT=''
    for entry in "$TMP"/extracted/* "$TMP"/extracted/.[!.]* "$TMP"/extracted/..?*; do
      [ -e "$entry" ] || [ -L "$entry" ] || continue
      ROOT_COUNT=$((ROOT_COUNT + 1))
      [ -d "$entry" ] && [ ! -L "$entry" ] || { echo 'archive must contain exactly one root directory' >&2; exit 2; }
      ROOT=$entry
    done
    [ "$ROOT_COUNT" -eq 1 ] || { echo 'archive must contain exactly one root directory' >&2; exit 2; }
    SOURCE=$ROOT
    ;;
esac
[ -d "$SOURCE" ] && [ ! -L "$SOURCE" ] || { echo 'source must be a real directory' >&2; exit 2; }
SOURCE=$(CDPATH= cd -P -- "$SOURCE" && pwd) || { echo 'unusable source directory' >&2; exit 2; }
INVENTORY=$SOURCE/config/files.tsv
[ -f "$INVENTORY" ] && [ ! -L "$INVENTORY" ] && [ -r "$INVENTORY" ] || { echo "unusable inventory: $INVENTORY" >&2; exit 2; }

HOME_DIR=${HOME_OVERRIDE:-${HOME:-}}
[ -n "$HOME_DIR" ] && [ -d "$HOME_DIR" ] && [ ! -L "$HOME_DIR" ] || { echo 'home must be an existing real directory' >&2; exit 2; }
HOME_DIR=$(CDPATH= cd -P -- "$HOME_DIR" && pwd) || { echo 'unusable home directory' >&2; exit 2; }
TMP=${TMP:-$(mktemp -d)} || { echo 'cannot create temporary directory' >&2; exit 2; }
PLAN=$TMP/plan
sh "$SCRIPT_DIR/scripts/validate-inventory.sh" "$SOURCE" "$HOME_DIR" > "$PLAN"

# All sources and targets are validated before any writes.
while IFS="$(printf '\t')" read -r template dest; do
  if [ -e "$dest" ]; then
    if cmp -s "$template" "$dest"; then echo "unchanged: $dest"; continue
    else result=$?; [ "$result" -eq 1 ] || { echo "comparison failed: $dest" >&2; exit 2; }
    fi
  fi
  if [ "$DRY_RUN" -eq 1 ]; then echo "would install: $dest"; continue; fi
  mkdir -p "$(dirname -- "$dest")" || { echo "cannot create destination directory: $dest" >&2; exit 1; }
  if [ -e "$dest" ]; then
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    backup=$dest.bak.$stamp
    n=0
    while [ -e "$backup" ] || [ -L "$backup" ]; do n=$((n + 1)); backup=$dest.bak.$stamp.$n; done
    cp -p "$dest" "$backup" || { echo "cannot back up: $dest" >&2; exit 1; }
    echo "backup: $backup"
  fi
  cp "$template" "$dest" || { echo "cannot install: $dest" >&2; exit 1; }
  echo "installed: $dest"
done < "$PLAN"
