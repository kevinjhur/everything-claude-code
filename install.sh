#!/usr/bin/env bash
# install.sh — ECC Master Installer (Multi-Lang & 32 Agents Sync) 🏯🛡️🌍

set -euo pipefail

SCRIPT_PATH="$0"
while [ -L "$SCRIPT_PATH" ]; do
    link_dir="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
    SCRIPT_PATH="$(readlink "$SCRIPT_PATH")"
    [[ "$SCRIPT_PATH" != /* ]] && SCRIPT_PATH="$link_dir/$SCRIPT_PATH"
done
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

# 🗣️ 1. Language Selection Prompt
echo "🌐 Choose your Agent Language / 에이전트 언어를 선택하세요:"
echo "1) English (en)"
echo "2) Korean (ko) - [Recommended/추천]"
read -p "Selection (1/2) [Default: 2]: " LANG_CHOICE

if [[ "$LANG_CHOICE" == "1" ]]; then
    LANG="en"
else
    LANG="ko"
fi

echo "🚀 Using $LANG agents for installation..."

# 🌍 2. [GLOBAL MASTER SYNC]
AGENT_MASTER="$HOME/.claude/.agent"
echo "🏛️ Global: Syncing Master Agents ($LANG) to $AGENT_MASTER..."
mkdir -p "$AGENT_MASTER"
rm -rf "$AGENT_MASTER"/*
cp -rp "$SCRIPT_DIR/agents/$LANG"/* "$AGENT_MASTER/"
echo "✅ [SUCCESS] Global Agent Sync Complete!"

# 🏢 3. [LOCAL PROJECT SYNC]
LOCAL_AGENT="$SCRIPT_DIR/.agent"
echo "🏙️ Local: Syncing Agents ($LANG) to $LOCAL_AGENT..."
mkdir -p "$LOCAL_AGENT"
rm -rf "$LOCAL_AGENT"/*
cp -rp "$SCRIPT_DIR/agents/$LANG"/* "$LOCAL_AGENT/"
echo "✅ [SUCCESS] Local Agent Sync Complete!"

# 📦 4. Delegate to legacy Node-based installer
if [ $# -gt 0 ]; then
    ARGS=("$@")
    NEW_ARGS=()
    for arg in "${ARGS[@]}"; do
        if [ "$arg" == "all" ]; then
            NEW_ARGS+=("go" "java" "javascript" "kotlin" "python" "swift" "typescript")
        else
            NEW_ARGS+=("$arg")
        fi
    done
    echo "📦 Running legacy installer with parameters: ${NEW_ARGS[*]}"
    node "$SCRIPT_DIR/scripts/install-apply.js" "${NEW_ARGS[@]}"
else
    echo "💡 Core Omni-Sync finished."
fi
