FROM centos:7.3.1611

LABEL maintainer "Panayiotis Vlantis <panosv@di.uoa.gr>"

LABEL hadoop 2.7.3

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y install java-1.8.0-openjdk-headless which && \
    yum clean all ;

ENV JAVA_HOME /usr/lib/jvm/jre

WORKDIR /opt

RUN mkdir hadoop && \
    curl -s https://www-us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    | gunzip | tar x --strip=1 -C hadoop

ENV HADOOP_HOME /opt/hadoop

ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
