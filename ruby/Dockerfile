FROM centos:7

LABEL maintainer "Panayiotis Vlantis <panosv@di.uoa.gr>"

LABEL ruby 2.4.0

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y install zlib zlib-devel gcc-c++ patch readline readline-devel \
      ibyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake \
      libtool bison curl sqlite-devel libxml2-devel libxslt-devel && \
    yum clean all

RUN mkdir /tmp/ruby && \
    curl -s https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz \
    | gunzip | tar x --strip=1 -C /tmp/ruby && \
    cd /tmp/ruby && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/ruby

RUN echo 'gem: --no-document' > ~/.gemrc && \
    gem update --system && \
    gem install bundler
