# php docker developmen environment

> [docker note](https://gist.github.com/sh7ning/6ade02eeb0cd719f90ae09499c8263e7)

> 可以创建一个本地的局域网，方便多个不同的`docker-compose`文件共用

```
docker network create localnet
```

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

* crontab

```
0 0 1 * * date >> /tmp/certbot_renew.log && /data/docker-dev/certbot_renew 2>&1 >> /tmp/certbot_renew.log && docker-compose -f /data/docker-dev/docker-compose.yml restart nginx 2>&1 >> /tmp/certbot_renew.log
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

