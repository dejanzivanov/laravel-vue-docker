# backend/Dockerfile
FROM php:8.2-fpm-alpine

RUN set -eux; \
    apk update && apk add --no-cache \
        bash \
        git \
        nodejs \
        npm \
        # For building PHP extensions:
        $PHPIZE_DEPS \
    && docker-php-ext-install pdo_mysql mysqli

# Install Composer manually
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm", "-F"]
