FROM daocloud.io/php:7.1-fpm

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

# 安装composer
# docker run --rm -it  -v $(pwd):/app docker-composer
# ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
# RUN chmod +x /usr/local/bin/composer

# 共享目录给nginx
VOLUME /www

WORKDIR /www
