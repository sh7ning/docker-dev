# php docker developmen environment

> [docker note](https://gist.github.com/sh7ning/6ade02eeb0cd719f90ae09499c8263e7)

> 可以创建一个本地的局域网，方便多个不同的`docker-compose`文件共用

```
docker network create jetea_net
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
0 0 1 * * /data/docker-dev/certbot_renew 2>&1 >> /tmp/certbot_renew.log
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
