# php docker environment

### Installation

* Install PHP

```
docker build -t docker-php ./php
```

* Install Composer

```
docker build -t docker-composer ./composer
```

* Install Nginx

```
docker build -t docker-nginx ./nginx
```

* Install Redis

```
docker build -t docker-redis ./redis
```



###  Usage

* Create docker network

```
docker network create phpnetwork
```

* Run PHP

```
docker run --restart=always -d -v /etc/localtime:/etc/localtime:ro --net=phpnetwork --name container-php -v your-www-dir:/www -v your-php-conf:/usr/local/etc/php:ro docker-php
```

* Composer

```
alias composer='docker run --rm -it -v $(pwd):/app docker-composer '
```

* Run Nginx

```
docker run --restart=always -d -v /etc/localtime:/etc/localtime:ro --net=phpnetwork --name container-nginx -v your-www-dir:/www -v your-nginx-config-dir:/etc/nginx/conf.d:ro -p 80:80 -p 443:443 docker-nginx
```

* Run Redis

```
docker run --restart=always -d --name container-redis -p 6379:6379 docker-redis
```

