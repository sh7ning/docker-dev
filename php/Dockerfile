FROM php:7.2-fpm-stretch

# debug:
# docker run --rm -it -e "TERM=xterm-256color" php:7.2-fpm-stretch /bin/bash

# RUN curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie
ADD sources.list /etc/apt/sources.list

# zip: configure: WARNING: Libzip >= 1.2.0 needed for encryption support
# see: https://stackoverflow.com/questions/48700453/docker-image-build-with-php-zip-extension-shows-bundled-libzip-is-deprecated-w
RUN apt-get update \
        && apt-get install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd \
        && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql \
        && pecl update-channels \
        && pecl install redis && docker-php-ext-enable redis \
        && docker-php-ext-install pdo_mysql pcntl opcache \
        && apt-get install -y libzip-dev && docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip

# docker-php-ext-install mysqli
# gmp bcmath

# composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer

RUN curl -o /usr/bin/composer https://dl.laravel-china.org/composer.phar \
        && chmod +x /usr/bin/composer && sync \
        && composer config -g repo.packagist composer https://packagist.laravel-china.org \
        && apt-get install -y git zip
# RUN curl -O https://getcomposer.org/composer.phar \ 
#         && chmod +x composer.phar && sync \
#         && mv composer.phar /usr/bin/composer \
#         && composer config -g repo.packagist composer https://packagist.laravel-china.org \
#         && apt-get install -y git zip
        
# Write Permission
# RUN usermod -u 1000 www-data

# Swoole
# RUN apt-get install -y libpcre3 libpcre3-dev libssl-dev \
#     && pecl install swoole && docker-php-ext-enable swoole

VOLUME /www

WORKDIR /www
