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
REPO=$SCRIPT_DIR
[ -n "$SOURCE" ] || SOURCE=$REPO
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
  src=$SOURCE/$relative
  # Reject symlink components, non-regular files, and paths that escape the selected source tree.
  part=''; rest=$relative
  while [ -n "$rest" ]; do
    component=${rest%%/*}
    if [ "$rest" = "$component" ]; then rest=''; else rest=${rest#*/}; fi
    part=${part:+$part/}$component
    [ ! -L "$SOURCE/$part" ] || { echo "symlink source rejected: $src" >&2; exit 2; }
  done
  [ -f "$src" ] && [ -r "$src" ] || { echo "missing or unreadable regular source: $src" >&2; exit 2; }
  case "$relative" in config/agent/AGENTS.md|config/agent/config.yml) [ -s "$src" ] || { echo "required source is empty: $src" >&2; exit 2; } ;; esac
  dest=$HOME_DIR/$destination
  # Inspect every existing path component below the already-canonical home.
  walk=$HOME_DIR
  rest=${destination%/*}
  if [ "$rest" != "$destination" ]; then
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
