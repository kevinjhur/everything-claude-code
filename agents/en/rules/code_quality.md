# 💎 Code Quality Standards

All code must meet "Senior Engineer" standards.

## 1. Robustness

- **Error Handling**: Use try-catch blocks and handle edge cases gracefully. Never let the app crash silently.
- **Input Validation**: Validate all inputs at the boundary (API endpoints, public methods).

## 2. Maintainability

- **No Hardcoding**: Use constants or configuration files for magic numbers/strings.
- **SRP (Single Responsibility Principle)**: Functions and classes should do one thing well.
- **Size Limit**: Keep files under 300 lines. Refactor if they grow too large.
- **Comments**: Explain "Why", not "What". Code tells what; comments tell why.

## 3. Security

- **No Secrets**: Never commit API keys or passwords. Use environment variables.
- **Sanitization**: Prevent SQL injection and XSS by sanitizing inputs.

## 4. Reusability & Modularity

- **DRY (Don't Repeat Yourself)**: Extract common logic into utility functions.
- **Modularity**: Components should be loosely coupled.
- **Cohesion**: Related functions should stay together.

## 5. Testing

- **Writing Tests**: Code without tests is tech debt. Write unit/integration tests.
- **Mocking**: Mock external dependencies to ensure fast and reliable tests.
