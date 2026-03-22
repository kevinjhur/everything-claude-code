# 👽 Antigravity Agent Setup for Beginners

This folder is a standard template for those who want to start **multi-agent vibe coding** using Antigravity.

## 🚀 Quick Start Guide

1. **Copy**: Copy this `.agent` folder to the root of your project.
2. **Check Configuration**: Read the rules defined in `.agent/rules/base_rules.md`.
3. **First Command**: Start by commanding the agent as follows:
   > "Understand the project structure and create a task.md to organize current tasks."

## 📂 Folder Structure & Collaboration System

- `rules/`: Project operation rules and hierarchy (`hierarchy.md`).
- `workflows/`: Standard operating procedures and feature implementation processes.
- `agents/`: Granular specialized personas.

  - **PL (Project Leader)**: Overall management and task distribution. (Solo work prohibited)
  - **QA**: Quality assurance and authority to request rework.
  - **BE-Coder**: Backend development expert.
  - **FE-Coder**: Frontend development expert.
  - **SP-Coder**: System/Embedded development expert.

## 👑 Strict Hierarchy

Beginners should remember that these agents follow a hierarchy of **CEO (User) > PL > QA > Developers**.

1. **Coordination**: When agents have differing opinions, they follow the decision of the superior according to this structure.
2. **Quality Verification**: Code written by developers must go through QA review. If QA gives `NG`, the developer must rework it.
3. **Role of PL**: The PL determines technical direction and coordinates tasks rather than coding directly.

## 🤖 Multi-Agent Operation Example

1. **Summon PL**: "I want to create a new sign-up feature. Make a plan."
2. **Task Distribution**: PL instructs `BE` and `FE` to work on API and UI respectively.
3. **Rework Loop**: If there are defects in the work, `QA` instructs the developer to fix them.
4. **Final Report**: After all verification is complete, `PL` reports to the CEO (User).

## 💡 Tips

- If the agent behaves erratically, check and modify the instructions within the `.agent` folder.
- **Role Check**: Ensure the agent explicitly states their role (like `[FE]`, `[BE]`) in their response. If not, ask "What is your role?".
- Modifying rules changes agent behavior immediately.
