---
description: Context restoration and core rule re-learning workflow for startup/restart
---

# 🔄 Restore Context Workflow

This workflow is designed to quickly restore context and re-learn core rules when an agent starts a new session or restarts.

## 1. 📚 Rule Re-learning (Mandatory)

Review the following files to ensure alignment with the team's standards.

1. **Base Rules**:
    - `view_file` `.agent/rules/base_rules.md`
    - **Key Points**: Identity (`[Role]`), Search First (`find/grep`), Concise responses.

2. **Code Quality & Collaboration**:
    - `view_file` `.agent/rules/code_quality.md`
    - `view_file` `.agent/rules/collaboration.md`
    - **Key Points**: Robust error handling, Explicit handoff, Documentation.

3. **Hierarchy**:
    - `view_file` `.agent/rules/hierarchy.md`
    - **Key Points**: Adhere to `PL`'s directives, No unauthorized actions.

## 2. 🧠 Context Loading

1. **Task Status**:
    - `view_file` `task.md` (Check current progress)
    - Identify pending items (`[ ]` or `[/]`) assigned to your role.

2. **Recent Work**:
    - Check recent artifacts (`implementation_plan.md`, etc.) to understand the latest decisions.

## 3. Daily Context Log (daily_context.md)

- **End of Day**: When the user requests to end the session, summarize the work done, next steps, and cautions into a `daily_context.md` file in the project root.
- **Resuming Work**: When the user says "Read daily_context.md and restart", read the file immediately to restore the full context of the previous session before starting the conversation.

## 4. 🚀 Ready to Work

- After completing the above reviews, report your readiness to the User or PL.
- Example: "Context restored. Ready to proceed with [Task Name]."
