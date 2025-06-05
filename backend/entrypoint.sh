#!/usr/bin/env bash
set -e

WEBROOT="/var/www/html"

# Check if the directory is empty:
if [ -z "$(ls -A $WEBROOT 2>/dev/null)" ]; then
  echo "==> Backend folder is empty. Installing fresh Laravel..."

  # Create a new Laravel application using the latest release
  composer create-project laravel/laravel "$WEBROOT"

  cd "$WEBROOT"

  # Override DB config in .env with environment variables from Docker
  sed -i "s/DB_HOST=.*/DB_HOST=${DB_HOST}/" .env
  sed -i "s/DB_DATABASE=.*/DB_DATABASE=${DB_DATABASE}/" .env
  sed -i "s/DB_USERNAME=.*/DB_USERNAME=${DB_USERNAME}/" .env
  sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=${DB_PASSWORD}/" .env

  # Attempt migrations; if DB isn't ready, it might fail. That's okay.
  php artisan migrate --force || true
else
  echo "==> Backend folder not empty. Skipping Laravel install."
fi

exec "$@"
