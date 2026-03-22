---
description: Standard process for systematic root cause analysis and resolution of issues
---

# 🐞 Systematic Debugging Process

Follow this process when an error occurs to solve the problem logically and efficiently.

## 1. 🔍 Analyze (Analyze)

- **Read Error Logs**: Precise analysis of error messages and stack traces. (Use `grep` or `read_file`)
- **Reproduce**: Identify the conditions under which the issue occurs.
- **Isolate**: Narrow down the scope of the problem (e.g., specific component, API, database).

## 2. 🧠 Hypothesize (Hypothesize)

- **List Possibilities**: List expected causes based on analysis.
- **Prioritize**: Sort by likelihood.
- **Plan Verification**: Decide how to verify each hypothesis (e.g., add logs, check DB, inspect network tab).

## 3. 🛠️ Fix & Verify (Fix & Verify)

- **Minimal Change**: Apply the smallest possible change to fix the issue.
- **Verify**: Confirm the fix works and hasn't introduced regressions.
- **Test Edge Cases**: Verify behavior in boundary conditions.

## 4. 📝 Post-Mortem (Post-Mortem)

- **Document**: Record the cause and solution in `task.md` or a separate valid artifact.
- **Prevent Recurrence**: Propose architectural improvements or adding test cases to prevent the same issue from happening again.
