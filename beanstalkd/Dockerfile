FROM debian:jessie

ADD install.sh install.sh

RUN chmod +x install.sh && ./install.sh && rm install.sh

EXPOSE 11300
VOLUME /var/lib/beanstalkd

CMD ["beanstalkd", "-f", "0", "-b", "/var/lib/beanstalkd"]
