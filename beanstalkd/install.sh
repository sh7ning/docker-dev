#! /bin/bash

# exit if a command fails
set -e

version="1.10"

# 换源
echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib
deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib' > /etc/apt/sources.list

# install curl (needed to install rust)
apt-get update && apt-get install -y curl build-essential

# download
curl -sL https://github.com/kr/beanstalkd/archive/v$version.tar.gz | tar xvz -C /tmp

# build and install
cd /tmp/beanstalkd-$version
make
cp beanstalkd /usr/bin

# cleanup package manager
apt-get remove --purge -y curl build-essential && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
