#!/usr/bin/env python3
"""Check and package the skills in this repo.

Usage: python3 tools/build.py [--check]   (--check: checks only, don't rebuild dist/)

For every folder in skills/:
1. SKILL.md has front matter with name (matching the folder) and description.
2. VERSION matches the "Version:" line in SKILL.md, and CHANGELOG.md has a "## <skill> <version>" entry.
3. Every references/... file SKILL.md mentions exists; shell scripts parse.
4. Rebuilds dist/<skill>.zip (top-level folder = skill name; evals/ stay in the repo).
"""
import re
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def fail(msg):
    sys.exit(f"build: {msg}")


def check(skill: Path):
    text = (skill / "SKILL.md").read_text()
    fm = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not fm:
        fail(f"{skill.name}: SKILL.md has no front matter")
    name = re.search(r"^name:\s*\"?([\w-]+)\"?", fm.group(1), re.M)
    if not name or name.group(1) != skill.name:
        fail(f"{skill.name}: front matter name must be '{skill.name}'")
    desc = re.search(r"^description:\s*(.+)$", fm.group(1), re.M)
    if not desc or len(desc.group(1)) > 1024:
        fail(f"{skill.name}: description missing or over 1024 characters")

    version = (skill / "VERSION").read_text().strip()
    m = re.search(r"^Version:\s*([0-9.]+)", text, re.M)
    if not m or m.group(1) != version:
        fail(f"{skill.name}: VERSION {version} does not match the SKILL.md Version line ({m.group(1) if m else 'missing'})")
    if f"## {skill.name} {version}" not in (ROOT / "CHANGELOG.md").read_text():
        fail(f"CHANGELOG.md has no '## {skill.name} {version}' entry")
    if "__REPO__" in text or any("__REPO__" in f.read_text() for f in skill.glob("*.sh")):
        fail(f"{skill.name}: the repo name placeholder __REPO__ was never filled in")

    for ref in set(re.findall(r"references/[\w.-]+\.md", text)):
        if not (skill / ref).exists():
            fail(f"{skill.name}: SKILL.md mentions {ref}, which doesn't exist")
    for sh in skill.glob("*.sh"):
        if subprocess.run(["bash", "-n", str(sh)]).returncode:
            fail(f"{sh.relative_to(ROOT)} does not parse")
    print(f"{skill.name} {version}: ok")


def package(skill: Path):
    out = ROOT / "dist" / f"{skill.name}.zip"
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
        for f in sorted(skill.rglob("*")):
            rel = f.relative_to(skill)
            if not f.is_file() or "__pycache__" in f.parts or rel.parts[0] == "evals" or f.name == ".DS_Store":
                continue
            info = zipfile.ZipInfo(f"{skill.name}/{rel.as_posix()}", date_time=(2026, 1, 1, 0, 0, 0))
            info.external_attr = (0o100755 if f.suffix == ".sh" else 0o100644) << 16
            info.compress_type = zipfile.ZIP_DEFLATED
            z.writestr(info, f.read_bytes())
    print(f"built {out.relative_to(ROOT)} ({out.stat().st_size // 1024 or 1} KB)")


def main():
    skills = sorted(p for p in (ROOT / "skills").iterdir() if (p / "SKILL.md").exists())
    for s in skills:
        check(s)
    if "--check" in sys.argv:
        return
    (ROOT / "dist").mkdir(exist_ok=True)
    for s in skills:
        package(s)


if __name__ == "__main__":
    main()
