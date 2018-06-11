# See https://github.com/docker-library/php/blob/master/7.1/fpm/Dockerfile
FROM ddall/docker-php-base

RUN apt-get update && apt-get install -y \
    libmemcached11 \
    libmemcachedutil2 \
    libmemcached-dev \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install memcached --with-libmemcached-dir=/usr/include/libmemcached && docker-php-ext-enable memcached
RUN composer global require hirak/prestissimo

WORKDIR /var/www/symfony
