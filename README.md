# Laravel Vue Docker

This repository provides a minimal Docker-based development environment that bundles **Laravel**, **Vue.js**, and **MariaDB**. Each component runs in its own container so you can experiment with the stack without installing PHP or Node on your host machine.

The stack consists of four services defined in `docker-compose.yml`:

- **mariadb** – MariaDB database with a persistent volume.
- **backend** – PHP 8.2 FPM container that installs a fresh Laravel application on first run.
- **apache** – Lightweight Apache HTTP server serving the Laravel `public` directory.
- **frontend** – Node container running the Vue application via Vite.

## Usage

1. **Clone the repository**

   ```bash
   git clone <repo-url>
   cd laravel-vue-docker
   ```

2. **Configure environment**

   Copy the example environment file and adjust values if necessary:

   ```bash
   cp env.example .env
   ```

3. **Build and start the containers**

   Use Docker Compose directly or the convenience `Makefile`:

   ```bash
   docker compose up --build
   # or simply
   make
   ```

   The first launch installs Laravel into `backend/` and creates a Vue project in `frontend/` if those directories are empty.

4. **Access the applications**

   - Laravel backend via Apache: [http://localhost:8080](http://localhost:8080)
   - Vue dev server (Vite): [http://localhost:5173](http://localhost:5173)

   To stop everything run:

   ```bash
   docker compose down
   # or
   make clean
   ```

## Development notes

- Laravel sources live in the `backend/` directory.
- Vue sources live in the `frontend/` directory.
- GitHub Actions in `.github/workflows/` provide linting and basic test scaffolding.

Feel free to extend this setup however you see fit. Happy coding!

## License

This project is released under the MIT License.
