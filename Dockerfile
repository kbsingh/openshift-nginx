FROM centos:centos7
MAINTAINER Karanbir Singh <kbsingh@karan.org>

ADD yum-repo-nginx-testing.repo /etc/yum.repos.d/nginx-testing.repo

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y --enablerepo=nginx-testing install --setopt=tsflags=nodocs nginx && \
    yum clean all && \
    mkdir -p /usr/share/nginx/html


ADD root /

RUN chmod 777 /run.sh && chmod -R 777 /usr/share/nginx/html/
RUN echo "nginx on CentOS7" > /usr/share/nginx/html/index.html
RUN chmod 777 /run /var/log/nginx /var/lib/nginx/cache
RUN rm -f /var/lib/nginx/cache/.placeholder

EXPOSE 8080
USER 997
ENTRYPOINT ["/run.sh"]
