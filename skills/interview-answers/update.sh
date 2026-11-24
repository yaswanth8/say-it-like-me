#!/usr/bin/env bash
# Use the newest copy of this skill, so friends get fixes without reinstalling.
#
#   bash <this skill's folder>/update.sh [scratch dir]
#
# Reads only the repo's VERSION file first (a few bytes). When the installed copy already has that version, nothing is
# downloaded. When GitHub has a newer one, it downloads the repo once per session into <scratch>/latest and prints one
# UPDATE line asking the user to reinstall the zip. When GitHub can't be reached, the installed copy is used.
# Last line, always:  SKILL_DIR=<dir> VERSION=<v> SOURCE=<installed|cached|downloaded>
set -u
REPO="yaswanth8/say-it-like-me"
SUB="skills/interview-answers"
HERE="$(cd "$(dirname "$0")" && pwd)"
SCRATCH="${1:-/tmp/interview-answers}"
DEST="$SCRATCH/latest"
TMP="$SCRATCH/tmp.$$"
LOG="$SCRATCH/update.log"
mkdir -p "$SCRATCH"; : > "$LOG"

INSTALLED=$(tr -d '[:space:]' < "$HERE/VERSION" 2>/dev/null || echo 0)
newer() { [ "$1" != "$2" ] && [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | tail -1)" = "$1" ]; }  # is $1 newer than $2
good() { [ -f "$1/$SUB/SKILL.md" ] && [ -f "$1/$SUB/VERSION" ]; }
done_with() { echo "SKILL_DIR=$1 VERSION=$(tr -d '[:space:]' < "$1/VERSION") SOURCE=$2"; exit 0; }

fetch() {  # fetch URL to stdout with curl or python
  if command -v curl >/dev/null 2>&1; then timeout 30 curl -fsSL -H "Accept: application/vnd.github.raw" "$1" 2>>"$LOG"
  else timeout 30 python3 -c "import sys,urllib.request as r; sys.stdout.buffer.write(r.urlopen(r.Request(sys.argv[1], headers={'Accept':'application/vnd.github.raw'}), timeout=25).read())" "$1" 2>>"$LOG"; fi
}

LATEST=""
for u in "https://raw.githubusercontent.com/$REPO/main/$SUB/VERSION" "https://api.github.com/repos/$REPO/contents/$SUB/VERSION?ref=main"; do
  LATEST=$(fetch "$u" | tr -d '[:space:]')
  echo "$LATEST" | grep -Eq '^[0-9]+(\.[0-9]+)+$' && break
  echo "version check failed: $u" >> "$LOG"; LATEST=""
done

[ -z "$LATEST" ] && done_with "$HERE" installed                     # offline: use what's installed
newer "$LATEST" "$INSTALLED" || done_with "$HERE" installed          # already the latest
if good "$DEST" && ! newer "$LATEST" "$(tr -d '[:space:]' < "$DEST/$SUB/VERSION")"; then done_with "$DEST/$SUB" cached; fi

for u in "https://codeload.github.com/$REPO/tar.gz/refs/heads/main" "https://api.github.com/repos/$REPO/tarball/main"; do
  rm -rf "$TMP"; mkdir -p "$TMP"
  if fetch "$u" | tar xz -C "$TMP" --strip-components=1 2>>"$LOG" && good "$TMP"; then
    rm -rf "$DEST"; mv "$TMP" "$DEST"
    echo "UPDATE: your installed interview-answers skill is $INSTALLED and the latest is $LATEST; this chat uses $LATEST. To install it, download https://github.com/$REPO/raw/main/dist/interview-answers.zip and upload it in Customize > Skills, replacing the old one."
    done_with "$DEST/$SUB" downloaded
  fi
  echo "download failed: $u" >> "$LOG"
done
rm -rf "$TMP"
if command -v git >/dev/null 2>&1 && timeout 120 git clone --depth 1 -q "https://github.com/$REPO" "$TMP" >>"$LOG" 2>&1 && good "$TMP"; then
  rm -rf "$DEST"; mv "$TMP" "$DEST"
  echo "UPDATE: your installed interview-answers skill is $INSTALLED and the latest is $LATEST; this chat uses $LATEST. To install it, download https://github.com/$REPO/raw/main/dist/interview-answers.zip and upload it in Customize > Skills, replacing the old one."
  done_with "$DEST/$SUB" downloaded
fi
rm -rf "$TMP"
done_with "$HERE" installed
