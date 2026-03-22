#!/usr/bin/env pwsh
# install.ps1 — ECC Master Installer Wrapper (Windows PowerShell) 🏯🛡️🌍

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptPath = $PSCommandPath
$scriptDir = Split-Path -Parent $scriptPath

# Delegate everything to the Node-based installer
$installerScript = Join-Path -Path $scriptDir -ChildPath "scripts\install-apply.js"

if ($args.Count -eq 0) {
    # Default to Korean rules and global target for convenience
    & node $installerScript ko
} else {
    & node $installerScript $args
}
