# php docker developmen environment

> [docker note](https://gist.github.com/sh7ning/6ade02eeb0cd719f90ae09499c8263e7)

> 可以创建一个本地的局域网，方便多个不同的`docker-compose`文件共用

```
docker network create jetea_net
```

* crontab

```
0 0 1 * * /data/docker-dev/certbot_renew >> /tmp/certbot_renew.log 2>&1
```

###  Usage

* run

```
docker-compose up -d
```
