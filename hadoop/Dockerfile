FROM fedora:28

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

LABEL name "Apache Hadoop"

LABEL version "2.7.6"

RUN true \
    && dnf install -y --setopt=tsflags=nodocs 'dnf-command(config-manager)' \
    && dnf config-manager --set-disabled updates \
    && dnf install -y --setopt=tsflags=nodocs \
         hostname \
         iputils \
         java-1.8.0-openjdk-headless \
         tree \
    && dnf clean all

ENV JAVA_HOME /usr/lib/jvm/jre

RUN true \
    && set -o pipefail \
    && mkdir /opt/hadoop \
    && curl -s https://www-eu.apache.org/dist/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz \
    | gunzip \
    | tar x --strip=1 -C /opt/hadoop

ENV HADOOP_HOME /opt/hadoop

ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
