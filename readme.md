# php docker environment

### Installation

* Install PHP

```
docker build -t docker-php ./php
```

* Install Nginx

```
docker build -t docker-nginx ./nginx
```

###  Usage

* create docker network

```
docker network create phpnetwork
```

* Run PHP

```
docker run --name container-php --net=phpnetwork -v /Users/develop/workspace/demo/dockerwww:/www -d docker-php
```

* Run Nginx

```
docker run --name container-nginx --net=phpnetwork -v /Users/develop/workspace/demo/dockerwww:/www -v /Users/develop/workspace/study/dockerphp/nginx/conf.d:/etc/nginx/conf.d:ro -p 80:80 -d docker-nginx
```

