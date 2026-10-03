Start the OpenDesign daemon so OMP's `open-design` MCP server can connect. This is an explicitly user-invoked POSIX shell recipe; Windows PowerShell installation does not make this shell recipe native to Windows.

Run this command and report whether the daemon was already running or started. Do not open a browser window.

```sh
set -eu
health_url=http://127.0.0.1:7456/api/health
if curl -fsS "$health_url" >/dev/null 2>&1; then
  echo "OpenDesign is already running."
  exit 0
fi
if [ -z "${OMP_OPEN_DESIGN_LAUNCHER:-}" ] || [ ! -x "$OMP_OPEN_DESIGN_LAUNCHER" ]; then
  echo "Set OMP_OPEN_DESIGN_LAUNCHER to the installed executable OpenDesign launcher before starting the daemon." >&2
  exit 1
fi
mkdir -p "$HOME/.local/state/open-design"
nohup "$OMP_OPEN_DESIGN_LAUNCHER" --no-open >"$HOME/.local/state/open-design/daemon.log" 2>&1 </dev/null &
for attempt in $(seq 1 20); do
  if curl -fsS "$health_url" 2>/dev/null; then
    echo
    echo "OpenDesign daemon is ready for OMP MCP."
    exit 0
  fi
  sleep 1
done
echo "OpenDesign daemon did not become healthy; startup log follows:" >&2
cat "$HOME/.local/state/open-design/daemon.log" >&2
exit 1
```
