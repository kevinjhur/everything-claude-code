#!/usr/bin/env bash
# install.sh — ECC Master Installer Wrapper 🏯🛡️🌍

set -euo pipefail

SCRIPT_PATH="$0"
while [ -L "$SCRIPT_PATH" ]; do
    link_dir="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
    SCRIPT_PATH="$(readlink "$SCRIPT_PATH")"
    [[ "$SCRIPT_PATH" != /* ]] && SCRIPT_PATH="$link_dir/$SCRIPT_PATH"
done
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

# Delegate everything to the Node-based installer
# Usage: ./install.sh [language] [--target target] [--dry-run]
node "$SCRIPT_DIR/scripts/install-apply.js" "$@"
