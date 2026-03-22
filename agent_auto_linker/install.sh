#!/bin/bash

# Agent Auto Linker - Extreme Robust Installer (Linux/WSL)
# [Final Version] Clean Physical Replication Mode 🛡️🧹

# 1. Extract version from package.json
VERSION=$(grep '"version":' package.json | head -1 | cut -d '"' -f 4)
if [ -z "$VERSION" ]; then echo "❌ Error: package.json version missing!"; exit 1; fi

EXT_NAME="kevinj.agent-auto-linker-$VERSION"

# 2. Detect Antigravity Extension Home
if [ -d "$HOME/.antigravity-server/extensions" ]; then
    EXT_HOME="$HOME/.antigravity-server/extensions"
elif [ -d "$HOME/.antigravity/extensions" ]; then
    EXT_HOME="$HOME/.antigravity/extensions"
else
    EXT_HOME="$HOME/.antigravity-server/extensions"
    mkdir -p "$EXT_HOME"
fi

EXT_DIR="$EXT_HOME/$EXT_NAME"
SOURCE_DIR=$(pwd)

echo "🚀 Installing Agent Auto Linker v$VERSION (Clean Physical Mode)..."

# 🛡️ PROTECTING SOURCE: Ensure we never accidentally target the source folder!
if [ "$EXT_DIR" == "$SOURCE_DIR" ]; then
    echo "❌ CRITICAL ERROR: Target path equals Source path! Installation aborted."
    exit 1
fi

# 3. Precise Purge of the Target
echo "🧹 Purging any current target ($EXT_DIR)..."
if [ -L "$EXT_DIR" ]; then rm -f "$EXT_DIR"; fi
if [ -d "$EXT_DIR" ]; then rm -rf "$EXT_DIR"; fi

# 4. [REPLICATION] Copy the Entire Folder (Preserving Structure)
echo "📦 Replicating folder $SOURCE_DIR to $EXT_DIR..."
cp -rp "$SOURCE_DIR" "$EXT_DIR"

# 🛡️ 5. [CLEANUP TARGET] Remove ONLY redundant files from the TARGET folder
echo "✨ Cleaning up meta files from target installation..."
rm -rf "$EXT_DIR/.git" "$EXT_DIR/.gitignore" 2>/dev/null
# Remove installers from target only (Source PROTECTED)
rm -f "$EXT_DIR/install.sh" "$EXT_DIR/install.ps1" 2>/dev/null

echo "✅ [SUCCESS] Agent Auto Linker v$VERSION is now Cleanly Installed."
echo "   New Folder Path: $EXT_DIR"
echo "   (Checked: Source folder is completely safe and untouched! 🛡️)"
