---
allowed-tools: Bash(pytest:*), Bash(python:*)
description: Run tests and fix any failing tests
---

## Context

- Current git status: !`git status`
- Test framework: pytest
- Python version: !`python --version`

## Your task

Run the test suite and fix any failing tests:

1. **Run Tests**: Execute the full test suite using pytest
2. **Analyze Failures**: Review test output to understand why tests are failing
3. **Root Cause**: Identify whether failures are due to:
   - Code bugs in the implementation
   - Outdated test expectations
   - Environment or dependency issues
   - Test setup/teardown problems
4. **Fix Issues**: Make necessary changes to fix the failing tests
5. **Verify**: Re-run tests to ensure all tests pass
6. **Report**: Provide a summary of what was fixed

Follow Python backend best practices:
- Maintain test isolation
- Preserve test intent and coverage
- Fix implementation bugs rather than weakening tests
- Update test expectations only when requirements have genuinely changed
