# Agent Orchestration

## Available Agents

Located in `~/.claude/agents/`:

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| planner | Implementation planning | Complex features, refactoring |
| architect | System design | Architectural decisions |
| tdd-guide | Test-driven development | New features, bug fixes |
| code-reviewer | Code review | After writing code |
| security-reviewer | Security analysis | Before commits |
| build-error-resolver | Fix build errors | When build fails |
| e2e-runner | E2E testing | Critical user flows |
| refactor-cleaner | Dead code cleanup | Code maintenance |
| doc-updater | Documentation | Updating docs |
| rust-reviewer | Rust code review | Rust projects |

## Immediate Agent Usage

No user prompt needed:
1. Complex feature requests - Use **planner** agent
2. Code just written/modified - Use **code-reviewer** agent
3. Bug fix or new feature - Use **tdd-guide** agent
4. Architectural decision - Use **architect** agent

## Parallel Task Execution

ALWAYS use parallel Task execution for independent operations:

```markdown
# GOOD: Parallel execution
Launch 3 agents in parallel:
1. Agent 1: Security analysis of auth module
2. Agent 2: Performance review of cache system
3. Agent 3: Type checking of utilities

# BAD: Sequential when unnecessary
First agent 1, then agent 2, then agent 3
```

## Multi-Perspective Analysis

For complex problems, use split role sub-agents:
- Factual reviewer
- Senior engineer
- Security expert
- Consistency reviewer
- Redundancy checker

## Anti-Loop & Conciseness Guidelines

1. **No Redundant Filler**: Skip phrases like "Executing now," "Please wait," or "Starting search..." before calling a tool. Call the tool immediately without unnecessary confirmation.
2. **Direct Action**: If you detect the same reasoning or output looping more than twice, stop immediately and ask for user intervention or pivot to a different strategy.
3. **Minimize Icons & Fluff**: Use emojis, flowery language, and complex formatting sparingly. Focus on delivering clear, actionable technical data.
4. **Tool-First Response**: Prioritize showing tool results over explaining what you are *about* to do multiple times.
5. **Context Management**: Avoid repeating previous thoughts or instructions that are already visible in the conversation history.
