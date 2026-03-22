---
description: 에이전트 작업 시작 전 컨텍스트 및 규칙 재확인
---

# 🔄 컨텍스트 복구 및 시작 가이드 (Startup & Restore Context)

이 워크플로우는 **대화를 처음 시작하거나**, **장기간 작업이 중단되었다가 재개될 때** 반드시 수행해야 합니다. 에이전트가 프로젝트의 핵심 규칙을 망각하지 않도록 강제합니다.

## 1. 정체성 및 규칙 재확인 (Identity & Rules)

다음 파일들을 순차적으로 읽고 숙지하십시오.

1. **기본 규칙 (Base Rules)**:
    - `view_file` `.agent/rules/base_rules.md`
    - **핵심**: 정체성 표현(`[Role]`), 기존 코드 검색(`find/grep`), 간결한 응답.

2. **코드 품질 및 협업 (Quality & Collaboration)**:
    - `view_file` `.agent/rules/code_quality.md`
    - `view_file` `.agent/rules/collaboration.md`
    - **핵심**: 에러 핸들링, 명시적 위임, 문서화.

3. **위계질서 (Hierarchy)**:
    - `view_file` `.agent/rules/hierarchy.md`
    - **핵심**: `PL`의 지시 준수, 독단적 행동 금지.

## 2. 현재 상태 파악 (Status Check)

1. **작업 현황 (Task Board)**:
    - `view_file` `task.md` (루트 또는 해당 프로젝트의 task.md)
    - **핵심**: 현재 진행 중인 작업과 완료된 작업을 파악.

2. **구현 계획 (Implementation Plan)**:
    - `view_file` `implementation_plan.md` (존재 시)
    - **핵심**: 현재 구현 목표와 세부 계획 확인.

## 3. 업무 일지 (daily_context.md) 작성 및 복구

- **작업 종료 시**: 사용자가 작업 종료를 요청하면, 지금까지의 작업 내역, 내일 할 일, 주의사항을 요약하여 프로젝트 루트에 `daily_context.md` 파일로 저장하십시오.
- **작업 재개 시**: 사용자가 "daily_context.md 읽고 다시 시작하자"라고 명령하면, 즉시 해당 파일을 읽고 어제의 작업 맥락을 완벽히 복구한 상태에서 대화를 시작하십시오.

## 4. 다짐 및 준비 완료 (Commitment)

위 내용을 모두 확인한 후, 다음과 같이 보고하십시오.

```markdown
## 🚀 [Role] 작업 준비 완료

1. **규칙 숙지**: 정체성, 코드 품질, 위계질서 규칙을 재확인했습니다.
2. **현재 작업**: [task.md 상의 진행 중인 작업 요약]
3. **대기 중**: 대표님의 명령을 기다립니다.
```
