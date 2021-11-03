# php docker developmen environment

> [docker note](https://gist.github.com/sh7ning/6ade02eeb0cd719f90ae09499c8263e7)

> 可以创建一个本地的局域网，方便多个不同的`docker-compose`文件共用

```
docker network create jetea_net
```

###  Usage

* run

```
docker-compose up -d
```

### acme https 证书申请
* <https://letsencrypt.org/zh-cn/docs/client-options/>
* 获取你的阿里云API Key: <https://ak-console.aliyun.com/#/accesskey>
* [安装acme.sh](https://github.com/acmesh-official/acme.sh/wiki/%E8%AF%B4%E6%98%8E)
* 参考文档1：https://github.com/acmesh-official/acme.sh/wiki/dnsapi#11-use-aliyun-domain-api-to-automatically-issue-cert
* 参考文档2：https://github.com/acmesh-official/acme.sh/wiki/%E8%AF%B4%E6%98%8E#2-%E6%89%8B%E5%8A%A8-dns-%E6%96%B9%E5%BC%8F-%E6%89%8B%E5%8A%A8%E5%9C%A8%E5%9F%9F%E5%90%8D%E4%B8%8A%E6%B7%BB%E5%8A%A0%E4%B8%80%E6%9D%A1-txt-%E8%A7%A3%E6%9E%90%E8%AE%B0%E5%BD%95-%E9%AA%8C%E8%AF%81%E5%9F%9F%E5%90%8D%E6%89%80%E6%9C%89%E6%9D%83
* 设置环境变量
```
export Ali_Key="aaa"
export Ali_Secret="bbb"
```
* 申请正式
```
acme.sh --issue --dns dns_ali -d demo.com -d *.demo.com
```

* acme 定时更新证书
> vim /data/acme_renew
```
#!/bin/bash

echo 刷新证书 开始执行,时间: $(date +"%Y年%m月%d日 %H时%M分%S秒")

"/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" --force 

echo 拷贝证书

cp -rp /root/.acme.sh/demo.com /data/docker-dev/nginx/certs/
cp -rp /root/.acme.sh/abc.net /data/docker-dev/nginx/certs/

echo 重启nginx

/usr/local/bin/docker-compose -f /data/docker-dev/docker-compose.yml restart nginx

echo 刷新证书完成
```

> crontab: `57 0 * * * /data/acme_renew >> /tmp/acme_renew.log 2>&1`
