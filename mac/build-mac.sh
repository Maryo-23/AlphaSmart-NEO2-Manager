#!/bin/bash
# Build the NEO2 Mac Manager (.app + .dmg) locally on a Mac.
# Useful if you want to build it yourself instead of using GitHub Actions.
# Requires: Homebrew (https://brew.sh). Run from anywhere: bash mac/build-mac.sh
set -e

echo "=== NEO2 Mac Manager local build ==="
command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }

for pkg in python@3.12 pandoc create-dmg; do
    brew list "$pkg" >/dev/null 2>&1 || brew install "$pkg"
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

python3.12 -m venv /tmp/neo2mac-venv
source /tmp/neo2mac-venv/bin/activate
pip install --quiet --upgrade pip
pip install --quiet pyinstaller neotools libusb1

pyinstaller --noconfirm --windowed --name "NEO Sender" neo-sender-gui
pyinstaller --noconfirm --onefile --name neotools-cli neotools_cli.py
pyinstaller --noconfirm --onefile --name neo-format-neo2 neo-format-neo2

# Bundle the helper tools inside the .app
cp dist/neotools-cli dist/neo-format-neo2 "$(brew --prefix pandoc)/bin/pandoc" \
    "dist/NEO Sender.app/Contents/MacOS/"

create-dmg --volname "NEO2 Mac Manager" "NEO2-Mac-Manager.dmg" "dist/NEO Sender.app" || \
    hdiutil create -volname "NEO2 Mac Manager" -srcfolder "dist/NEO Sender.app" \
        -ov -format UDZO "NEO2-Mac-Manager.dmg"

echo ""
echo "=== Done: $SCRIPT_DIR/NEO2-Mac-Manager.dmg ==="
