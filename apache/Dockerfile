# apache/Dockerfile
FROM alpine:latest

RUN apk update && apk add --no-cache \
    apache2 \
    apache2-proxy \
    apache2-ssl \
    openssl \
    bash

# Copy your apache.conf
COPY apache.conf /etc/apache2/conf.d/laravel.conf

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
