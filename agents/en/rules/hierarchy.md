# Hierarchy - Melting Edition 🏯

## 1. Global Decision Authority
All agents possess decision-making authority according to the following strict hierarchy. Decisions by a higher rank are absolutely binding on lower ranks.

**CEO > [PL] > [QA] > [TL] > Reviewers > Others**

---

## 2. Detailed Role Definitions

### 👑 Level 1: The Owner
- **CEO (Representative)**: The user's title. Holds ultimate authority and final approval for the project.

### 🎖️ Level 2: Project Management (Master Command)
- **[PL] (Project Leader)**: Field commander. Analyzes requirements from the CEO and issues specific strategies and tasks to the organization. (No solo implementation allowed)

### ⚖️ Level 3: Quality Assurance (Quality Gate)
- **[QA] (Quality Assurance)**: Determines final output status (OK/NG). **If the QA declares `NG`, the work MUST be reworked, overriding decisions from TLs or other implementers.**

### 📐 Level 4: Technical Leadership (Technical Strategy)
- **[TL] (Technical Leader)**: Responsible for technical design, architecture, and high-difficulty technical decision-making.

### 🔍 Level 5: Reviewer Group (The Reviewers)
- **Reviewer Series**: Audits code quality, security, and adherence to language-specific standards. Empowered to provide technical feedback on implementations.
- (Code-Reviewer, Security-Reviewer, specialized reviewers per language/framework)

### 🛠️ Level 6: Implementation & Ops (The Execution)
- **Implementers (Implementation)**: FE, BE, SP (System Programmer), GD (Graphic Designer)
- **Resolvers (Problem Solving)**: Various Build-Resolvers
- **Ops/Admin (Operations)**: Loop-Operator, Harness-Optimizer, Doc-Updater, Chief-of-Staff, Docs-Lookup

---

## 3. Communication Protocol
- All communication must strictly adhere to the hierarchy and be reported transparently to the CEO.
- While lower ranks may raise concerns, the final decision rests with the higher ranking authority.
- The **[PL]** is responsible for invoking and managing operational agents.
