FROM php:7.1-fpm

# 说明:
# port: 9000
# www:  /www # /var/www/html
# conf: /usr/local/etc/php

# 换源

# 已经默认存在的扩展:
#   openssl iconv json dom pdo curl xml mbstring ctype phar
# 安装扩展依赖
# mcrypt
# pdo_pgsql
# gd

# 其他可能需要安装扩展 apcu sockets streams pcntl posix libevent exif bcmath zip
# COPY php-profiler-extension /opt/php-profiler-extension
RUN curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
        && apt-get update \
        && apt-get install -y libmcrypt-dev \
        libpq-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install -j$(nproc) mcrypt \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install pdo_pgsql \
        && docker-php-ext-install gettext
        # && docker-php-ext-install gettext \
        # && cd /opt/php-profiler-extension && phpize && ./configure && make && make install && docker-php-ext-enable tideways && rm -rf /opt/php-profiler-extension

# 共享目录给nginx
VOLUME /www

WORKDIR /www
