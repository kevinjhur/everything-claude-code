# Agent Auto Linker (Smart & Safe Master Sync)

A VS Code / Antigravity extension that automatically links your master `.agent` configuration folder to your current project workspaces.

## 🚀 How to Install

### 🍏 Linux / Mac / WSL
Open your terminal inside the `agent_auto_linker` folder and run:
```bash
chmod +x install.sh && ./install.sh
```

### 💻 Windows (PowerShell)
Open PowerShell as administrator inside the `agent_auto_linker` folder and run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

> [!NOTE]
> The version is automatically managed via `package.json`. No separate version file is needed! 🎉

## 🛠️ Key Features
- **Single Source of Truth**: Managed entirely via `package.json`. No more hardcoded versions in multiple files.
- **Source Repository Protection**: Never runs inside the master folder or its parents (Do No Harm logic).
- **Respect Existing Assets**: If a `.agent` folder, file, or link already exists, it is untouched.
- **Smart Gitignore Integration**: Automatically adds `.agent` to your `.gitignore` with duplicate detection and tilde (~) path support.
- **Remote & Local UI Support**: Uses relative paths for symlinks to ensure they are visible and valid in both WSL-Remote and local Windows UI.
- **Developer Mode**: Enabled by default via the installer (uses symlinks to the source folder).

## ⚙️ Configuration
1. Find `agentAutoLinker.masterAgentPath` in VS Code/Antigravity settings and enter the absolute path to your master `.agent` folder (e.g., `~/.claude`).
2. When you open a new project folder, a symbolic link (Junction on Windows, Dir Symlink on Linux/Mac) is created within seconds.
