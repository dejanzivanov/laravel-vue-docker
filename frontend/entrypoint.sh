#!/usr/bin/env sh
# set -e

# APP_DIR="/"

# if [ -z "$(ls -A "$APP_DIR/frontend" 2>/dev/null)" ]; then

#   apk add --update nodejs npm

#   npm create vue@latest "frontend" -- --default

#   cd "$APP_DIR"frontend
#   npm install
#   npm install vue-router
#   # npm run watch --poll=1000
#   npx vite build --watch

# else
#   echo "==> Frontend folder contains files. Skipping Vue creation."
# fi

# exec "$@"




# set -e

# APP_DIR="/"

# if [ -z "$(ls -A "$APP_DIR/frontend" 2>/dev/null)" ]; then
#   echo "==> frontend/ is empty; creating a new Vue project."

#   # Install Node/NPM in Alpine (if needed)
#   apk add --update nodejs npm

#   # Create the Vue app (default settings)
#   npm create vue@latest "frontend" -- --default

#   cd "$APP_DIR/frontend"
#   npm install
#   npm install vue-router

#   # Insert router setup code right after "import App from './App.vue'"
#   sed -i "/import App from '.\/App.vue'/a\\
# import { createRouter, createWebHistory } from 'vue-router';\\
# \\
# const router = createRouter({\\
#   history: createWebHistory(),\\
#   routes: [\\
#     {\\
#       path: '/',\\
#       component: { template: '<h1>Welcome Home!</h1>' },\\
#     },\\
#   ],\\
# });\\
# " src/main.js

#   # Replace "createApp(App).mount('#app')" with code that uses the router
#   sed -i "s|createApp(App).mount('#app')|const app = createApp(App)\\
# app.use(router)\\
# app.mount('#app')|" src/main.js

#   # Build in watch mode
#   npx vite build --watch

# else
#   echo "==> Frontend folder contains files. Skipping Vue creation."
# fi

# exec "$@"



set -e

APP_DIR="/"

if [ -z "$(ls -A "$APP_DIR/frontend" 2>/dev/null)" ]; then
  echo "==> frontend/ is empty; creating a new Vue project."

  # Install Node/NPM in Alpine (if needed)
  apk add --update nodejs npm

  # Create the Vue app (default settings)
  npm create vue@latest "frontend" -- --default

  cd "$APP_DIR/frontend"
  npm install
  npm install vue-router

  echo "==> Creating routes directory..."
  mkdir -p src/routes

  echo "==> Creating src/routes/index.js..."
  cat << 'EOF' > src/routes/index.js
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    component: { template: '<h1>Welcome Home!</h1>' },
  },
  // Additional routes can be added here by developers
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
EOF

  echo "==> Injecting router import and usage into main.js..."

  # 1) Import router from our new file immediately after 'import App from ...'
  sed -i "/import App from '.\/App.vue'/a\\
import router from '.\/routes\/index.js'\\
" src/main.js

  # 2) Replace createApp(App).mount('#app') with code that uses the router
  sed -i "s|createApp(App).mount('#app')|createApp(App).use(router).mount('#app')|" src/main.js

  echo "==> Starting Vite build in watch mode..."
  npx vite build --watch

else
  echo "==> Frontend folder contains files. Skipping Vue creation."
fi

exec "$@"


