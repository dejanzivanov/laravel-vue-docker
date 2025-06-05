# Laravel Vue Docker

This repository provides a simple development environment for a Laravel backend and a Vue.js frontend running in separate Docker containers with MariaDB and Apache. It aims to let you start coding right away without setting up PHP, Node.js or a web server on your host machine.

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/) (v2 or included with Docker Desktop)
- [GNU Make](https://www.gnu.org/software/make/) (optional, for the provided `Makefile` shortcuts)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourname/laravel-vue-docker.git
   cd laravel-vue-docker
   ```
2. **Create the `.env` file**
   ```bash
   cp env.example .env
   ```
   Adjust any variables if necessary (ports, database credentials, etc.).
3. **Build and run the stack**
   ```bash
   docker compose up --build
   ```
   The first run will generate Laravel and Vue projects in `../backend` and `../frontend` on your host. Subsequent runs reuse these directories so your work persists.

Once the containers are up:

- The Laravel application is served through Apache at [http://localhost:8080](http://localhost:8080).
- The Vue development server listens on [http://localhost:5173](http://localhost:5173) and reloads on changes.

Stop the stack with `docker compose down` or use the `Makefile` commands described below.

## Directory Layout

```
backend/   # Dockerfile and entrypoint for the Laravel container
frontend/  # Dockerfile and entrypoint for the Vue container
apache/    # Dockerfile and Apache configuration
docker-compose.yml
Makefile   # Convenience targets
```

During the first startup, the entrypoint scripts check whether `../backend` or `../frontend` exist. If not, they create fresh Laravel and Vue projects for you.

## Development Workflow

- Edit the generated source in `../backend` and `../frontend` on your host machine.
- Changes to PHP or Vue files are reflected inside the running containers thanks to the mounted volumes.
- Database data is stored in a Docker volume (`mariadb_data`), so your database persists between runs.

### Makefile Targets

- `make all` – build the images and start the stack (equivalent to `docker compose up --build`).
- `make clean` – stop the containers (`docker compose down`).
- `make fclean` – remove containers, networks and volumes.
- `make re` – full clean followed by a fresh build and start.

## CI / CD

GitHub Actions workflows are included to lint the backend and frontend, run unit tests, and check shell scripts. They execute on every push and pull request.

To enforce these checks before merging to `main`, enable branch protection rules in your repository settings and require the following statuses:

- **Lint Backend**
- **Lint Frontend**
- **Test Backend**
- **Shellcheck**

## License

This project is provided under the [MIT License](https://opensource.org/licenses/MIT). Feel free to use it as a starting point for your own applications.

