# Ocean Pool

 Ocean Pool is a Database-as-a-Service (DBaaS) control plane, similar in spirit to Amazon RDS. Users request a PostgreSQL or MySQL database by choosing an engine, a size (flavor) and a storage volume, and Ocean Pool takes care of the rest: it records the request, provisions the database, and moves each instance through its lifecycle (pending, active, resizing, deleting) through a background reconciler. It exposes a REST API and a command-line tool, and is designed to run on Kubernetes, where a custom operator provisions real database instances.

## Requirements

- Go 1.27+
- [golangci-lint](https://golangci-lint.run/) (only needed for `make lint`)

## Project layout

```
cmd/
  api/          HTTP API server (entry point)
  oceanpool/    Command-line tool (entry point)
internal/
  httpapi/      HTTP handlers and routing
  instance/     Instance model and logic
  store/        Persistence
  worker/       Background workers
bin/            Build output (git-ignored)
```

Code under `internal/` can only be imported by this module.

## Usage

| Command      | What it does                                            |
|--------------|---------------------------------------------------------|
| `make build` | Compiles both binaries into `bin/api` and `bin/oceanpool` |
| `make run`   | Runs the API server                                     |
| `make test`  | Runs all tests with the race detector and coverage      |
| `make lint`  | Runs `golangci-lint`                                    |
| `make clean` | Removes `bin/`                                          |

## License

See [LICENSE](LICENSE).
