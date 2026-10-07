#!/bin/sh
set -eu
home=$1
mode=$2
marker='# >>> omp telemetry opt-out >>>'
end='# <<< omp telemetry opt-out <<<'
source_line='[ -r "$HOME/.omp/telemetry.env" ] && . "$HOME/.omp/telemetry.env"'
case "$mode" in plan|check|apply|dry-run) ;; *) echo 'invalid profile mode' >&2; exit 2 ;; esac
files='.profile .bashrc'
for name in .bash_profile .bash_login .zshenv; do
  if [ -e "$home/$name" ] || [ -L "$home/$name" ]; then files="$files $name"; fi
done

profile_state() {
  if [ ! -e "$1" ]; then printf 'missing\n'; return; fi
  awk -v open_marker="$marker" -v end_marker="$end" -v source="$source_line" '
    $0 == open_marker { if (stage != 0) exit 2; stage=1; next }
    stage == 1 { if ($0 != source) exit 2; stage=2; next }
    stage == 2 { if ($0 != end_marker) exit 2; stage=3; next }
    $0 == end_marker { exit 2 }
    stage == 3 && $0 !~ /^[[:space:]]*(#.*)?$/ { exit 2 }
    END {
      if (stage == 1 || stage == 2) exit 2
      print stage == 3 ? "present" : "missing"
    }
  ' "$1"
}

# Validate every selected profile before installation can write any payload.
for name in $files; do
  path=$home/$name
  if [ -L "$path" ] || { [ -e "$path" ] && { [ ! -f "$path" ] || [ ! -r "$path" ]; }; }; then
    echo "unsafe shell profile: $path" >&2; exit 2
  fi
  if [ "$mode" != check ] && [ -e "$path" ] && [ ! -w "$path" ]; then
    echo "unwritable shell profile: $path" >&2; exit 2
  fi
  profile_state "$path" >/dev/null || { echo "invalid managed shell profile stanza: $path" >&2; exit 2; }
done
[ "$mode" != plan ] || exit 0

status=0
for name in $files; do
  path=$home/$name
  state=$(profile_state "$path")
  if [ "$mode" = check ]; then
    if [ "$state" = present ]; then echo "pass telemetry profile stanza: $path"
    else echo "missing telemetry profile stanza: $path"; status=1
    fi
    continue
  fi
  [ "$state" != present ] || continue
  if [ "$mode" = dry-run ]; then echo "would update shell profile: $path"; continue; fi
  if [ -f "$path" ]; then
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    backup=$path.bak.$stamp
    n=0
    while [ -e "$backup" ] || [ -L "$backup" ]; do n=$((n + 1)); backup=$path.bak.$stamp.$n; done
    cp -p "$path" "$backup" || { echo "cannot back up shell profile: $path" >&2; exit 1; }
    printf '\n' >> "$path"
    echo "backup: $backup"
  else
    : > "$path"
  fi
  printf '%s\n' "$marker" "$source_line" "$end" >> "$path"
  echo "updated shell profile: $path"
done
exit "$status"
