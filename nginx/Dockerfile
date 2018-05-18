FROM fedora:28

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

## Install Packages
#
RUN true \
    && dnf install -y --disablerepo updates 'dnf-command(config-manager)' \
    && dnf config-manager --set-disabled updates \
    && dnf install -y --setopt=tsflags=nodocs \
         iputils \
         nginx \
         tree \
    && dnf clean all

## Change uid of nginx user
#
RUN true \
    && usermod -u 1000 nginx \
    && groupmod -g 1000 nginx

EXPOSE 80 443

# `daemon off;` has been set in nginx.conf
CMD ["nginx"]
