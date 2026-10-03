#!/usr/bin/env python3
"""Integration checks for the inventory-driven POSIX installer and doctor."""
from __future__ import annotations

import datetime as dt
import http.server
import os
from pathlib import Path
import shutil
import socketserver
import subprocess
import tempfile
import threading
import zipfile

ROOT = Path(__file__).resolve().parents[1]
INSTALL = ROOT / "install.sh"
DOCTOR = ROOT / "scripts" / "doctor.sh"
INVENTORY = ROOT / "config" / "files.tsv"


def run(*args: str, env: dict[str, str] | None = None, expected: int = 0) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(args, cwd=ROOT, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    assert result.returncode == expected, (args, result.returncode, result.stdout[-1200:], result.stderr[-1200:])
    return result


def mappings(inventory: Path = INVENTORY) -> list[tuple[str, str]]:
    rows = []
    for line in inventory.read_text(encoding="utf-8").splitlines():
        fields = line.split("\t")
        assert len(fields) == 2 and all(fields)
        rows.append((fields[0], fields[1]))
    assert rows
    return rows


def make_fixture(directory: Path) -> Path:
    fixture = directory / "source fixture"
    (fixture / "config").mkdir(parents=True)
    shutil.copy2(INVENTORY, fixture / "config/files.tsv")
    for source, _ in mappings():
        src = ROOT / source
        dst = fixture / source
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
    return fixture


def assert_install(home: Path, rows: list[tuple[str, str]]) -> None:
    for source, destination in rows:
        assert (home / destination).read_bytes() == (ROOT / source).read_bytes(), destination


def doctor(home: Path, *args: str, expected: int = 0) -> subprocess.CompletedProcess[str]:
    return run("sh", str(DOCTOR), *args, "--home", str(home), expected=expected)


class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *_: object) -> None:
        pass


def archive(root: Path, path: Path, roots: tuple[str, ...] = ("repo",), hidden_root: bool = False, root_file: bool = False) -> None:
    with zipfile.ZipFile(path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        if root_file:
            zf.writestr("top.txt", "x")
            return
        for prefix in roots:
            for item in root.rglob("*"):
                if item.is_file():
                    zf.write(item, f"{prefix}/{item.relative_to(root).as_posix()}")
        if hidden_root:
            zf.writestr(".extra", "hidden root entry")


def main() -> None:
    rows = mappings()
    with tempfile.TemporaryDirectory(prefix="omp install tests ") as tmp_name:
        tmp = Path(tmp_name)
        source = make_fixture(tmp)
        home = tmp / "home with spaces"
        home.mkdir()

        # Dry-run leaves destination trees untouched; explicit source/home path handling.
        result = run("sh", str(INSTALL), "--dry-run", "--source", str(source), "--home", str(home))
        assert len(result.stdout.splitlines()) == len(rows)
        assert not (home / ".omp").exists() and not (home / ".agents").exists()

        # Default HOME and explicit home both install the complete inventory.
        default_home = tmp / "default-home"
        default_home.mkdir()
        run("sh", str(INSTALL), "--source", str(source), env={**os.environ, "HOME": str(default_home)})
        assert_install(default_home, rows)
        run("sh", str(INSTALL), "--source", str(source), "--home", str(home))
        assert_install(home, rows)

        # Identical installs preserve mtimes and create no backups.
        target = home / ".omp/agent/config.yml"
        before = target.stat().st_mtime_ns
        backup_count = len(list(target.parent.glob("config.yml.bak.*")))
        run("sh", str(INSTALL), "--source", str(source), "--home", str(home))
        assert target.stat().st_mtime_ns == before
        assert len(list(target.parent.glob("config.yml.bak.*"))) == backup_count

        # Read-only check leaves contents and mtimes alone; missing and drifted nested files are detected.
        target_paths = [home / dest for _, dest in rows]
        state = [(p.stat().st_mtime_ns, p.read_bytes()) for p in target_paths]
        doctor(home, "--check")
        assert state == [(p.stat().st_mtime_ns, p.read_bytes()) for p in target_paths]
        cmp_bin = tmp / "cmp-bin"
        cmp_bin.mkdir()
        cmp_command = cmp_bin / "cmp"
        cmp_command.write_text("#!/bin/sh\nexit 2\n", encoding="utf-8")
        cmp_command.chmod(0o755)
        run("sh", str(DOCTOR), "--home", str(home), env={**os.environ, "PATH": f"{cmp_bin}{os.pathsep}{os.environ['PATH']}"}, expected=2)
        nested_agent = home / ".omp/agent/agents/task.md"
        nested_skill = home / ".agents/skills/tdd/SKILL.md"
        nested_agent.unlink()
        assert "missing:" in doctor(home, expected=1).stdout
        doctor(home, "--fix")
        assert nested_agent.read_bytes() == (ROOT / "config/agent/agents/task.md").read_bytes()
        nested_skill.write_bytes(b"drift\n")
        assert "drift:" in doctor(home, expected=1).stdout
        doctor(home, "--fix")
        assert nested_skill.read_bytes() == (ROOT / "config/skills-agents/tdd/SKILL.md").read_bytes()

        # Changed files get a collision-safe backup preserving old content.
        target.write_bytes(b"prior user bytes\n")
        collision_stamps = []
        now = dt.datetime.now(dt.timezone.utc)
        for offset in range(11):
            stamp = (now + dt.timedelta(seconds=offset)).strftime("%Y%m%dT%H%M%SZ")
            collision = Path(f"{target}.bak.{stamp}")
            collision.write_bytes(b"pre-existing backup\n")
            collision_stamps.append(collision)
        result = run("sh", str(INSTALL), "--source", str(source), "--home", str(home))
        assert target.read_bytes() == (ROOT / "config/agent/config.yml").read_bytes()
        backup_lines = [line[len("backup: "):] for line in result.stdout.splitlines() if line.startswith(f"backup: {target}.bak.")]
        assert len(backup_lines) == 1 and backup_lines[0].endswith(".1")
        assert Path(backup_lines[0]).read_bytes() == b"prior user bytes\n"
        assert all(path.read_bytes() == b"pre-existing backup\n" for path in collision_stamps)

        # Failures in late payload or unsafe inventory are rejected before early writes.
        run("sh", str(INSTALL), "--source", str(source / "not-a-source"), "--home", str(home), expected=2)
        run("sh", str(INSTALL), "--source", str(source), "--home", str(tmp / "missing-home"), expected=2)
        bad_source = tmp / "bad source"
        shutil.copytree(source, bad_source)
        (bad_source / rows[-1][0]).unlink()
        untouched = tmp / "untouched"
        untouched.mkdir()
        run("sh", str(INSTALL), "--source", str(bad_source), "--home", str(untouched), expected=2)
        assert not (untouched / ".omp").exists()
        malformed = tmp / "malformed source"
        shutil.copytree(source, malformed)
        inv = malformed / "config/files.tsv"
        original = inv.read_text(encoding="utf-8")
        inv.write_text(original + original.splitlines()[0] + "\n", encoding="utf-8")
        run("sh", str(INSTALL), "--source", str(malformed), "--home", str(untouched), expected=2)
        inv.write_text("../escape\t.omp/agent/escape\n" + original, encoding="utf-8")
        run("sh", str(INSTALL), "--source", str(malformed), "--home", str(untouched), expected=2)
        assert not (untouched / ".omp").exists()

        # Unsafe target directories and symlink parents are rejected without partial writes.
        bad_home = tmp / "bad-home"
        bad_home.mkdir()
        (bad_home / ".omp").mkdir()
        (bad_home / ".omp/agent").mkdir()
        (bad_home / ".omp/agent/config.yml").mkdir()
        run("sh", str(INSTALL), "--source", str(source), "--home", str(bad_home), expected=2)
        assert not (bad_home / ".agents").exists()
        link_home = tmp / "link-home"
        link_home.mkdir()
        outside = tmp / "outside"
        outside.mkdir()
        (link_home / ".omp").symlink_to(outside, target_is_directory=True)
        run("sh", str(INSTALL), "--source", str(source), "--home", str(link_home), expected=2)
        assert not list(outside.iterdir())

        for argv in (("--check", "--fix"), ("--home",), ("--home", ""), ("--home", "--fix"), ("--bogus",)):
            run("sh", str(DOCTOR), *argv, "--home", str(home), expected=2)
        run("sh", str(INSTALL), "--source", "--dry-run", "--home", str(home), expected=2)

        # Exercise ZIP acceptance and exact-one-root rejection through a local HTTP server.
        zip_root = tmp / "zip-source"
        shutil.copytree(source, zip_root)
        archives = tmp / "archives"
        archives.mkdir()
        valid = archives / "valid.zip"
        archive(zip_root, valid)
        class Handler(QuietHandler):
            directory = str(archives)
            def __init__(self, *args: object, **kwargs: object) -> None:
                super().__init__(*args, directory=self.directory, **kwargs)
        server = socketserver.TCPServer(("127.0.0.1", 0), Handler)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        try:
            zip_home = tmp / "zip-home"
            zip_home.mkdir()
            url = f"http://127.0.0.1:{server.server_address[1]}/valid.zip"
            run("sh", str(INSTALL), "--source", url, "--home", str(zip_home))
            assert_install(zip_home, rows)
            for name, kwargs in (("two.zip", {"roots": ("one", "two")}), ("hidden.zip", {"hidden_root": True}), ("file.zip", {"root_file": True})):
                archive(zip_root, archives / name, **kwargs)
                reject_home = tmp / f"reject-{name}"
                reject_home.mkdir()
                run("sh", str(INSTALL), "--source", f"http://127.0.0.1:{server.server_address[1]}/{name}", "--home", str(reject_home), expected=2)
                assert not list(reject_home.iterdir())
        finally:
            server.shutdown()
            server.server_close()
            thread.join()

    for runtime in ("pwsh", "powershell"):
        if shutil.which(runtime):
            print(f"PowerShell runtime available ({runtime}); PowerShell scenarios are not yet automated by this runner.")
    if not shutil.which("pwsh") and not shutil.which("powershell"):
        print("PowerShell execution unverified: neither pwsh nor Windows PowerShell is available.")
    print(f"POSIX installer/doctor integration checks passed for {len(rows)} inventory entries.")


if __name__ == "__main__":
    main()
