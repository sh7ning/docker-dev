FROM gogs/gogs

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories \
        && echo 'http://mirrors.ustc.edu.cn/alpine/edge/testing' >> /etc/apk/repositories \
        && apk add --no-cache openssl php7 php7-json php7-phar php7-iconv php7-mbstring php7-openssl \
        && ln -sf /usr/bin/php7 /usr/bin/php \
        && curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/composer \
        && apk add --no-cache sudo \
        && echo 'git ALL=(root) NOPASSWD: /usr/local/bin/composer, /usr/bin/git' >> /etc/sudoers
