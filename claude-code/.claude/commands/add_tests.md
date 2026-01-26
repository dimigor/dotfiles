---
allowed-tools: Bash(git diff:*), Bash(git log:*)
description: Add tests for new functionality
---

## Context

- Current git status: !`git status`
- Recent changes: !`git diff HEAD~1`
- Recent commits: !`git log --oneline -5`
- Current branch: !`git branch --show-current`

## Your task

Analyze recent changes and add comprehensive tests for new functionality:

1. **Identify Changes**: Review the recent code changes to understand new functionality
2. **Test Coverage**: Analyze existing test coverage for the changed code
3. **Design Tests**: Design test cases covering:
   - **Happy path**: Normal successful execution
   - **Edge cases**: Boundary conditions and special inputs
   - **Error cases**: Invalid inputs, exceptions, and error handling
   - **Integration**: Interaction with other components
4. **Implementation**: Write tests following project conventions:
   - Use pytest framework
   - Follow AAA pattern (Arrange, Act, Assert)
   - Use appropriate fixtures and mocks
   - Ensure test isolation
   - Add descriptive test names and docstrings
5. **Run Tests**: Execute new tests to verify they work
6. **Coverage**: Ensure high test coverage for new code

Follow Python backend best practices:
- Unit tests for business logic
- Integration tests for API endpoints
- Test both success and failure scenarios
- Use factories/fixtures for test data
- Mock external dependencies appropriately
