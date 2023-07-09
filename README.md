# Set up

1. Copy / create `.env` file, see `.env.development.sample` or `.env.production.sample` for more details.
2. Optional: update `RAILS_MASTER_KEY` in `.env` and `docker-compose.yml` if you want to use your own master key.
3. Run `docker-compose up -d --build` (or `docker compose up -d --build` on ) to start.

# Configuration

1. Environment files - `.env` | `.env.development.sample` | `.env.production.sample`.
2. `.gitignore` - update to ignore env files.
3. `Dockerfile.env` - a clone from `Dockerfile` with updated argument `RAILS_ENV`.
4. `docker-compose.yml` - docker configuration to start with.

# Problems

1. Cannot install `pg`.

```zsh
sudo apt-get install libpq-dev
```

2. Assets pipeline error (production only).

```zsh
ActionView::Template::Error (The asset "application.css" is not present in the asset pipeline.):
```

Go to the root folder, run:

```zsh
bundle exec rails assets:precompile
```

3. Fail to run `RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile`?

```
chmod u+x bin/rails
```

4. Fail to start container?
   Error

```
Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "/rails/bin/docker-entrypoint": permission denied: unknown
```

Run this

```
chmod u+x bin/docker-entrypoint
```

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
