# PHP image

## configuration

1. /usr/local/etc/php/
2. /usr/local/etc/php-fpm.d/

```
# RUN sed -i 's#pm = dynamic#pm = static#' /usr/local/etc/php-fpm.d/www.conf \
#         && sed -i 's#pm.max_children = 5#pm.max_children = 20#' /usr/local/etc/php-fpm.d/www.conf \
#         && sed -i 's#;pm.max_requests = 500#pm.max_requests = 500#' /usr/local/etc/php-fpm.d/www.conf

# php.ini
# ;The maximum size of an uploaded file.
# upload_max_filesize = 10M
# ;Sets max size of post data allowed. This setting also affects file upload. To upload large files, this value must be larger than upload_max_filesize
# post_max_size = 12M
```

## opcache
```
[opcache]
opcache.enable=1
opcache.memory_consumption=128
opcache.validate_timestamps=1
opcache.revalidate_freq=2
;opcache.save_comments=0
```

## xhprof

1. git clone https://github.com/tideways/php-profiler-extension.git
2. COPY php-profiler-extension /opt/php-profiler-extension
3. cd /opt/php-profiler-extension && phpize && ./configure && make && make install && docker-php-ext-enable tideways && rm -rf /opt/php-profiler-extension
