# # frontend/Dockerfile
# FROM node:18-alpine

# WORKDIR /app

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# EXPOSE 5173

# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["npm", "run", "dev"]

FROM node:18-alpine

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
# givee root permission to entrypoint.sh
RUN chmod +xrw /entrypoint.sh

# Convert line endings and make executable
RUN apk add --no-cache dos2unix && \
    dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

EXPOSE 5173
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "run", "dev"]