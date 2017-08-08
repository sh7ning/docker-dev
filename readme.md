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

* Install PostgreSQL

```
docker build -t docker-postgres ./postgres
```

###  Usage

* Composer

```
alias composer='docker run --rm -it -v $(pwd):/app docker-composer '
```

* Let's Encrypt

```
docker run -it --rm --name certbot -v "/data/site/config/nginx/conf.d/certs:/etc/letsencrypt" -p 443:443 -p 80:80 certbot/certbot certonly
```
