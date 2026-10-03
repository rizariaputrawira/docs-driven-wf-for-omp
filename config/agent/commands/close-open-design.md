Gracefully stop the OpenDesign daemon. This only stops OpenDesign; do not stop WSL or other processes. This is an explicitly user-invoked POSIX shell recipe; Windows PowerShell installation does not make it native to Windows.

Run this command and report the result:

```sh
set -eu
health_url=http://127.0.0.1:7456/api/health
if ! curl -fsS "$health_url" >/dev/null 2>&1; then
  echo "OpenDesign is already stopped."
  exit 0
fi
if [ -z "${OMP_OPEN_DESIGN_LAUNCHER:-}" ] || [ ! -x "$OMP_OPEN_DESIGN_LAUNCHER" ]; then
  echo "Set OMP_OPEN_DESIGN_LAUNCHER to the installed executable OpenDesign launcher before stopping the daemon." >&2
  exit 1
fi
"$OMP_OPEN_DESIGN_LAUNCHER" daemon stop
for attempt in $(seq 1 20); do
  if ! curl -fsS "$health_url" >/dev/null 2>&1; then
    echo "OpenDesign daemon stopped."
    exit 0
  fi
  sleep 1
done
echo "OpenDesign still responds to health checks after the graceful-stop request." >&2
exit 1
```
