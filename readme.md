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
docker run --name container-php --net=phpnetwork -v your-www-dir:/www -d docker-php
```

* Composer

```
alias composer='docker run --rm -it -v $(pwd):/app docker-composer '
```

* Run Nginx

```
docker run --name container-nginx --net=phpnetwork -v your-www-dir:/www -v your-nginx-config-dir:/etc/nginx/conf.d:ro -p 80:80 -d docker-nginx
```

* Run Redis

```
docker run --name container-redis -p 6379:6379 -d docker-redis
```

