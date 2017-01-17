FROM registry.centos.org/centos:centos7
MAINTAINER Karanbir Singh <kbsingh@karan.org>

ARG LEVAL
ARG LEFileName

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install --setopt=tsflags=nodocs nginx && \
    yum clean all && \
    mkdir -p /usr/share/nginx/html


ADD root /

RUN chmod 777 /run.sh
RUN chmod -R 777 /usr/share/nginx/html/
RUN echo "nginx on CentOS7" > /usr/share/nginx/html/index.html
RUN chmod 777 /run /var/log/nginx 
RUN mkdir -p /usr/share/nginx/html/.well-known/acme-challenge/ && \
    echo $LEVAL > /usr/share/nginx/html/.well-known/acme-challenge/$LEFileName

EXPOSE 8080
USER 997
ENTRYPOINT ["/run.sh"]
