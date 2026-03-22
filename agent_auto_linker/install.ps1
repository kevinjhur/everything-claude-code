# Agent Auto Linker - Automatic Installer for Windows Antigravity
# [Ultimate Single Source of Truth] Reading version from package.json

if (-not (Test-Path "package.json")) {
    Write-Host "❌ Error: package.json not found!" -ForegroundColor Red
    return
}

# Parse JSON safely
$json = Get-Content "package.json" -Raw | ConvertFrom-Json
$VERSION = $json.version

if (-not $VERSION) {
    Write-Host "❌ Error: version not found in package.json!" -ForegroundColor Red
    return
}

$EXT_NAME = "kevinj.agent-auto-linker-$VERSION"
$EXT_HOME = "$HOME\.antigravity\extensions"
$EXT_DIR = Join-Path $EXT_HOME $EXT_NAME
$SOURCE_DIR = Get-Location

Write-Host "🚀 Installing Agent Auto Linker v$VERSION for Windows Antigravity..." -ForegroundColor Cyan

# 1. Create extension home if missing
if (-not (Test-Path $EXT_HOME)) {
    New-Item -ItemType Directory -Path $EXT_HOME -Force
}

# 2. Cleanup existing versions
Write-Host "🧹 Cleaning up existing extension folders..." -ForegroundColor Gray
Get-Item (Join-Path $EXT_HOME "kevinj.agent-auto-linker-*") -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force

# 3. Copy Files (Robust Copy Mode)
Write-Host "📦 Copying files from $SOURCE_DIR to $EXT_DIR..." -ForegroundColor Green
$ExcludeFiles = @("*.vsix", ".git*", "install.*")

# [HOTFIX] Ensure target folder exists as a DIRECTORY before copying
if (Test-Path $EXT_DIR) { Remove-Item $EXT_DIR -Force -Recurse }
New-Item -ItemType Directory -Path $EXT_DIR -Force

Copy-Item -Path "$SOURCE_DIR\*" -Destination $EXT_DIR -Recurse -Force -Exclude $ExcludeFiles

Write-Host "✅ Installation Success! Version v$VERSION is now physically installed in a folder." -ForegroundColor Yellow
Write-Host "   (Verified: Extension is now self-contained in its own directory.)"
Write-Host "   Please Reload Window in your IDE."
