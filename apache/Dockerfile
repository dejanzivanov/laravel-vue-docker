# apache/Dockerfile
FROM alpine:latest

RUN apk update && apk add --no-cache \
    apache2 \
    apache2-proxy \
    apache2-ssl \
    openssl \
    bash

# Copy your apache.conf
RUN sed -i 's|#LoadModule rewrite_module modules/mod_rewrite.so|LoadModule rewrite_module modules/mod_rewrite.so|' /etc/apache2/httpd.conf

COPY apache.conf /etc/apache2/conf.d/laravel.conf

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
