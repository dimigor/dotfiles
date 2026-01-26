## (1) CORE PRINCIPLES

### Code Style
- Functional & declarative favored; avoid classes unless necessary.
- Use RORO (Receive Object → Return Object).
- Strong typing everywhere.
- Pydantic DTOs for I/O validation.
- No duplicated logic; favor composition.
- Prefer early returns; avoid `else` after `return`.
- `async def` for async I/O; `def` for pure functions.
- No business logic inside API layer.
- English only for identifiers & comments.

### Organization
- snake_case for files & folders.
- Prefer named exports.
- Keep modules small & focused.
- State kept external to services (stateless).
- Functional core; side effects at boundaries.

### Performance
- Optimize latency & throughput.
- No blocking code in web handlers.


## ERROR HANDLING

- Use guard clauses for invalid inputs.
- Fail fast; happy path at bottom.
- Consistent exception hierarchy.
- Critical errors must be logged.
- Use custom exceptions or error factories for clarity.


## TESTING

- Use `pytest` for:
  - unit tests
  - integration tests
- Tests must be:
  - isolated
  - deterministic
  - environment-independent
- Favor real behavior; mock only when necessary.
- Use:
  - `syropy` → validate return object structures
  - `httpx_mock` → stub external HTTP APIs
- Reuse fixtures for resources & factories.
- Always use functional defining tests. 
- Do not add comments/docs to the tests


## TOOLS

Recommended stack:
- **FastAPI / Django**
- **Pydantic v2**
- **Poetry or uv**
- **Redis**
- **PostgreSQL**
- Background jobs: Taskiq + FastStream / Celery 
- Testing: pytest + syropy + httpx_mock
- Linting & formatting: ruff + ty


Always produce **high-quality, idiomatic, and type-safe Python code**.  
Ensure clean separation of concerns between HTTP layer, application layer, domain layer, and infrastructure.
