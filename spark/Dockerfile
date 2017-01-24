FROM centos:7
MAINTAINER Panayiotis Vlantis <panosv@di.uoa.gr>

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y install java-1.8.0-openjdk-headless which && \
    yum clean all ;

WORKDIR /opt

RUN mkdir hadoop spark

RUN curl -s http://apache.cc.uoc.gr/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    | gunzip | tar x --strip=1 -C hadoop

ENV HADOOP_HOME /opt/hadoop

RUN curl -s http://apache.cc.uoc.gr/spark/spark-2.0.1/spark-2.0.1-bin-hadoop2.7.tgz \
    | gunzip | tar x --strip=1 -C spark && \
    echo -e '#!/usr/bin/env bash\nexport SPARK_DIST_CLASSPATH=$(hadoop classpath)' \
      > /opt/spark/conf/spark-env.sh

ENV SPARK_HOME /opt/spark

# get java home by running: readlink -f /usr/bin/java | sed "s:/bin/java::"
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64/jre

ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$HADOOP_HOME/bin:$PATH

EXPOSE 4040 7077 8080 8181

ENTRYPOINT ["/opt/spark/bin/spark-class"]
  # expecting:
  # org.apache.spark.deploy.master.Master
  # org.apache.spark.deploy.worker.Worker spark://master:7077

