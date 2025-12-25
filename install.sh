#!/usr/bin/env bash
set -euo pipefail

REPO_ZIP_URL="https://raw.githubusercontent.com/ocean-sudo/MS-to-Linux-WPS-Fonts/main/Linux_WPS_Fonts.zip"
ZIP_URL="${ZIP_URL:-$REPO_ZIP_URL}"
FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/ms-wps"

tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "$tmp_dir"; }
trap cleanup EXIT

script_source="${BASH_SOURCE[0]-}"
if [[ -n "$script_source" ]]; then
  local_zip_dir="$(cd "$(dirname "$script_source")" && pwd)"
  if [[ -f "$local_zip_dir/Linux_WPS_Fonts.zip" ]]; then
    cp "$local_zip_dir/Linux_WPS_Fonts.zip" "$tmp_dir/fonts.zip"
  else
    curl -fsSL "$ZIP_URL" -o "$tmp_dir/fonts.zip"
  fi
else
  curl -fsSL "$ZIP_URL" -o "$tmp_dir/fonts.zip"
fi

mkdir -p "$FONT_DIR"
if command -v bsdtar >/dev/null 2>&1; then
  bsdtar -xf "$tmp_dir/fonts.zip" -C "$FONT_DIR"
elif command -v unzip >/dev/null 2>&1; then
  unzip -q "$tmp_dir/fonts.zip" -d "$FONT_DIR"
elif command -v python3 >/dev/null 2>&1; then
  ZIP_PATH="$tmp_dir/fonts.zip" DEST_DIR="$FONT_DIR" python3 - <<'PY'
import os
import zipfile

zip_path = os.environ["ZIP_PATH"]
dest_dir = os.environ["DEST_DIR"]
with zipfile.ZipFile(zip_path, "r") as zf:
    zf.extractall(dest_dir)
PY
else
  printf 'Missing extractor: install bsdtar or unzip, or python3 to extract the zip.\n' >&2
  exit 1
fi

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -f "$FONT_DIR" >/dev/null
  printf 'Installed fonts into %s and refreshed font cache.\n' "$FONT_DIR"
else
  printf 'Installed fonts into %s. Run "fc-cache -f %s" to refresh.\n' "$FONT_DIR" "$FONT_DIR"
fi
