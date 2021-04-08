FROM php:8.0.3-fpm-buster

# 设置时区
ENV TZ=Asia/Shanghai
# 设置语言
ENV LC_ALL=C.UTF-8
# debug:
# docker run --rm -it -e "TERM=xterm-256color" php:7.2-fpm-stretch /bin/bash

# RUN curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie
# ADD sources.list /etc/apt/sources.list

# zip: configure: WARNING: Libzip >= 1.2.0 needed for encryption support
# see: https://stackoverflow.com/questions/48700453/docker-image-build-with-php-zip-extension-shows-bundled-libzip-is-deprecated-w
RUN apt-get update \
        && apt-get install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev zlib1g-dev \
        && docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install gd \
        && pecl update-channels \
        && pecl install redis && docker-php-ext-enable redis \
        && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql \
        && docker-php-ext-install pdo_mysql pcntl bcmath \
        && docker-php-ext-install opcache \
        && apt-get install -y libgmp3-dev && docker-php-ext-install gmp \
        && apt-get install -y libc-client-dev libkrb5-dev && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
        && docker-php-ext-install imap \
        && apt-get install -y libzip-dev && docker-php-ext-configure zip && docker-php-ext-install zip

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini 

# docker-php-ext-install mysqli
# apt-get install -y libmpdec-dev && pecl install decimal && docker-php-ext-enable decimal

# oracle 链接见
# https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html
# ENV LD_LIBRARY_PATH="/usr/local/instantclient"
# RUN apt-get install -y zip libaio1 \
#         && curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basic-linux.x64-19.6.0.0.0dbru.zip \
#         && curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-sqlplus-linux.x64-19.6.0.0.0dbru.zip \
#         && curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip \
#         && unzip instantclient-basic-linux.x64-19.6.0.0.0dbru.zip -d /usr/local/ \
#         && rm -rf instantclient-basic-linux.x64-19.6.0.0.0dbru.zip \
#         && unzip instantclient-sqlplus-linux.x64-19.6.0.0.0dbru.zip -d /usr/local/ \
#         && rm -rf instantclient-sqlplus-linux.x64-19.6.0.0.0dbru.zip \
#         && unzip instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip -d /usr/local/ \
#         && rm -rf instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip \
#         && mv /usr/local/instantclient_19_6 /usr/local/instantclient \
#         && ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus \
#         && docker-php-ext-configure oci8 --with-oci8=instantclient,/usr/local/instantclient \
#         && docker-php-ext-install oci8 

# composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer

RUN curl -o /usr/bin/composer https://getcomposer.org/composer.phar \ 
        && chmod +x /usr/bin/composer && sync \
        && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
        && apt-get install -y git zip
        
# Write Permission
# RUN usermod -u 1000 www-data

# Swoole
# RUN apt-get install -y libpcre3 libpcre3-dev libssl-dev \
#     && yes | pecl install swoole && docker-php-ext-enable swoole

VOLUME /www

WORKDIR /www
