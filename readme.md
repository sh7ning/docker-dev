# php docker developmen environment

> [docker note](https://gist.github.com/sh7ning/6ade02eeb0cd719f90ae09499c8263e7)

### configuration

* `vi /etc/docker/daemon.json`

```
{
    "userns-remap"      : "default",
    "registry-mirrors"  : ["???.aliyuncs.com"]
}
```

* restart 

```
systemctl daemon-reload
systemctl restart docker
```

### Installation

* Install PHP

```
docker build -t docker-php -f ./php/Dockerfile .
```

* Install beanstalkd
```
docker build -t docker-beanstalkd ./beanstalkd
```

###  Usage

* run

```
docker-compose up -d
```

* Composer

```
alias composer='docker run --rm -it -v $(pwd):/app -v $HOME/.composer-php:/tmp composer '
# 以下为非官方的版本
alias composer='docker run --rm -it -v $(pwd):/app -v $HOME/.composer-php:/composer composer/composer:1.1 '
```

* Let's Encrypt

```
# 执行命令，重启 nginx
docker run -it --rm --name certbot -v "/data/docker-dev/runtime/nginx/conf.d/certs:/etc/letsencrypt" -v "/data/site/www:/www" -v "/tmp/letsencrypt:/var/log/letsencrypt" certbot/certbot certonly --webroot -w /www/yadou.net/www -d www.domain.net
# 不建议下边的方式，需要先重启 nginx ，然后执行，然后 启动
docker run -it --rm --name certbot -v "/data/docker-dev/runtime/nginx/conf.d/certs:/etc/letsencrypt" -p 443:443 -p 80:80 certbot/certbot certonly
```
