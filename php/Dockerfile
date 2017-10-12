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

# git clone https://github.com/tideways/php-profiler-extension.git
COPY php-profiler-extension /opt/php-profiler-extension

RUN curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
        && apt-get update \
        && apt-get install -y libmcrypt-dev \
        libpq-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
        graphviz \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install -j$(nproc) mcrypt \
        && docker-php-ext-install pdo_mysql pdo_pgsql gettext opcache \
        && cd /opt/php-profiler-extension && phpize && ./configure && make && make install && docker-php-ext-enable tideways && rm -rf /opt/php-profiler-extension \
        && sed -i 's#pm = dynamic#pm = static#' /usr/local/etc/php-fpm.d/www.conf \
        && sed -i 's#pm.max_children = 5#pm.max_children = 20#' /usr/local/etc/php-fpm.d/www.conf \
        && sed -i 's#;pm.max_requests = 500#pm.max_requests = 500#' /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www
