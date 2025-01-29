#!/usr/bin/env sh
set -e

APP_DIR="/app"

echo "1. Current directory: $(pwd)"

if [ -z "$(ls -A "$APP_DIR" 2>/dev/null)" ]; then
  echo "==> Frontend folder is empty. Creating new Vue app..."
  
  # Create Vue project with defaults in /app directory
  apk add --update nodejs npm

  echo "2. Generating Vue project..."
  npm create vue@latest "frontend" -- --default
  ls -lah
  pwd
  echo "3.432432423432432. Generating Vue project..."


  # Move into app directory and install dependencies
  cd "$APP_DIR"/frontend
  pwd
  echo "3. Installing dependencies in: $(pwd)"
  npm install

else
  echo "==> Frontend folder contains files. Skipping Vue creation."
fi

exec "$@"