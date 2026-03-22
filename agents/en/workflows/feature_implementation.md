---
description: Standard process for planning and implementing new features
---

# 🚀 Feature Implementation Workflow

Standard procedure for implementing new features from requirements to deployment.

## 1. 📋 Requirements Analysis & Planning

- **Understand Goals**: Clarify user requirements.
- **Check Existing**: Search for similar or reusable code.
- **Draft Plan**: Create `implementation_plan.md` to outline the approach.
- **User Approval**: Get user sign-off on the plan.

## 2. 💻 Implementation (TDD)

- **Write Tests**: Create failing tests for the new feature (if applicable).
- **Implement**: Write code to pass the tests.
- **Refactor**: Improve code structure while keeping tests green.

## 3. 🔍 Review & Verification

- **Self-Review**: Check your own code against `code_quality.md`.
- **Peer Review**: Ask other agents (`FE`, `BE`) for feedback if needed.
- **QA**: Verify the feature meets requirements and quality standards.

## 4. 📦 Deployment

- **Commit**: Commit changes with clear messages.
- **Deploy**: Push to repository or deploy to environment.
