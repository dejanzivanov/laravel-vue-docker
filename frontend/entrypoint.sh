#!/usr/bin/env sh
set -e

APP_DIR="/"

if [ -z "$(ls -A "$APP_DIR/frontend" 2>/dev/null)" ]; then

  apk add --update nodejs npm

  npm create vue@latest "frontend" -- --default

  cd "$APP_DIR"frontend
  npm install

else
  echo "==> Frontend folder contains files. Skipping Vue creation."
fi

exec "$@"