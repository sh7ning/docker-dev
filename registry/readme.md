# Docker Registry

### 生成ssl证书
```
# 生成 ssl 证书
# 更多下载 
curl -L https://letsencrypt.org/certs/isrgrootx1.pem.txt > certs/isrgrootx1.pem
curl -L https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt > certs/lets-encrypt-x3-cross-signed.pem
cat certs/lets-encrypt-x3-cross-signed.pem >> certs/registry.yadou.crt
cat certs/isrgrootx1.pem >> certs/registry.yadou.crt
```

###  生成auth文件

```
docker run --entrypoint htpasswd registry:2.6 -Bbn username123 pwd123123 > auth/htpasswd
```

### 运行

```
docker-compose up -d
```

### 配置并运行 nginx

### login

```
docker login
```

### 目录结构  

 * auth 
 * certs
 * docker-compose.yml
 * readme.md
 * storage
