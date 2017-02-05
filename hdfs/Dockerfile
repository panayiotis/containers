FROM centos:7

MAINTAINER Panayiotis Vlantis <panosv@di.uoa.gr>

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y install java-1.8.0-openjdk-headless which && \
    yum clean all ;

# get java home by running: readlink -f /usr/bin/java | sed "s:/bin/java::"
ENV JAVA_HOME /usr/lib/jvm/jre

WORKDIR /opt

RUN mkdir hadoop

RUN curl -s http://apache.cc.uoc.gr/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    | gunzip | tar x --strip=1 -C hadoop

ENV HADOOP_HOME /opt/hadoop

ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

COPY entrypoint.sh /opt/hadoop/

WORKDIR /opt/hadoop

EXPOSE 9000 50010 50020 50070 50075 50090

ENTRYPOINT ["/opt/hadoop/entrypoint.sh"]
