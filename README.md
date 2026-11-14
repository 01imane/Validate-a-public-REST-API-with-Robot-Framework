# REST API Testing with Robot Framework

This practice project shows how to test REST APIs with Robot Framework and RequestsLibrary. It uses the public JSONPlaceholder Users API and a local Books API built with FastAPI.

## Requirements

- Python 3.12
- uv

The project uses Robot Framework and RequestsLibrary for the API tests, FastAPI for the local Books API, and Uvicorn to run the API server.

## Setup

Install the project dependencies from the repository root:

```bash
uv sync
```

If you see `Failed to spawn: uvicorn`, check that `fastapi` and `uvicorn` are listed in `pyproject.toml`. If they are missing, add them with:

```bash
uv add fastapi uvicorn
```

Then start the local Books API:

```bash
uv run uvicorn app:app --reload
```

## Run the Users API tests

The Users API tests send requests to [JSONPlaceholder](https://jsonplaceholder.typicode.com). They require an internet connection.

```bash
uv run robot tests/users.robot
```

Example checks:

- `GET /users` returns HTTP `200`.
- At least one user lives in `Wisokyburgh`.
- A request for an unknown user returns HTTP `404`.

## Run the Books API tests

Start the local FastAPI server in one terminal:

```bash
uv run uvicorn app:app --reload
```

The API is available at [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs).

Keep the server running and execute the tests in a second terminal:

```bash
uv run robot tests/Books.robot
```

| Endpoint | Expected result |
| --- | --- |
| `GET /books` | `200` and a list of books |
| `GET /books/BOOK001` | `200` and the matching book |
| `GET /books/UNKNOWN` | `404` with `"detail": "Book not found"` |

## Test results

Robot Framework generates these files after each run:

| File | Contents |
| --- | --- |
| `report.html` | Overview of passed and failed tests |
| `log.html` | Details for each test step and any failure message |
| `output.xml` | Test results in a machine-readable format |

If a test fails, open `log.html` and expand the failed step to see what Robot Framework received and what it expected.