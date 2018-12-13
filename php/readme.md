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
