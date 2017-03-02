FROM daocloud.io/php:7.1-fpm

# 说明:
# port: 9000
# www:  /www # /var/www/html
# conf: /usr/local/etc/php

# 换源
RUN curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
        && apt-get update

# -- 安装扩展 start --
# 已经默认存在的扩展:
#   openssl iconv json dom pdo curl xml mbstring ctype phar

# 安装扩展依赖
# mcrypt
RUN apt-get install -y libmcrypt-dev
# pdo_pgsql
RUN apt-get install -y libpq-dev
# gd
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev

# 安装扩展 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install -j$(nproc) mcrypt
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install gettext
# -- 安装扩展 end --

# 安装composer
# docker run --rm -it  -v $(pwd):/app docker-composer
# ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
# RUN chmod +x /usr/local/bin/composer

# 共享目录给nginx
VOLUME /www

WORKDIR /www
