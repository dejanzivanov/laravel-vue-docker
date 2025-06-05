FROM node:18-alpine

WORKDIR /

COPY entrypoint.sh /entrypoint.sh

RUN chmod +xrw /entrypoint.sh

RUN apk add --no-cache dos2unix && \
    dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

EXPOSE 5173
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "run", "dev"]
