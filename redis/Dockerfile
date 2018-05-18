FROM fedora:28

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

## Install Packages
#
RUN true \
    && dnf install -y --setopt=tsflags=nodocs 'dnf-command(config-manager)' \
    && dnf config-manager --set-disabled updates \
    && dnf install -y --setopt=tsflags=nodocs \
         iputils \
         redis \
         tree \
    && dnf clean all

COPY redis.conf /etc/redis.conf

EXPOSE 6379

CMD ["/usr/bin/redis-server", "/etc/redis.conf"]
