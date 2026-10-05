#!/bin/sh
set -eu
SOURCE=$1
HOME_DIR=$2
INVENTORY=$SOURCE/config/files.tsv
[ -f "$INVENTORY" ] && [ ! -L "$INVENTORY" ] && [ -r "$INVENTORY" ] || { echo "unusable inventory: $INVENTORY" >&2; exit 2; }

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
  printf '%s\t%s\n' "$src" "$dest"
done < "$INVENTORY"
