FROM panos/hadoop

LABEL maintainer "Panayiotis Vlantis <panosv@di.uoa.gr>"

LABEL spark 2.1.0

WORKDIR /opt

RUN mkdir spark && \
    curl -s http://www-us.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz \
    | gunzip | tar x --strip=1 -C spark && \
    echo -e '#!/usr/bin/env bash\nexport SPARK_DIST_CLASSPATH=$(hadoop classpath)' \
      > /opt/spark/conf/spark-env.sh

ENV SPARK_HOME /opt/spark

ENV PYSPARK_PYTHON python3

RUN yum -y install epel-release && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && \
    yum -y install gcc make openssl-devel sqlite-devel bzip2-devel \
      R R-devel libcurl-devel && \
    yum clean all ;

WORKDIR /tmp

RUN mkdir python && \
    curl -s https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz \
    | gunzip | tar x --strip=1 -C python && \
    cd python && \
    ./configure && \
    make && \
    make install && \
    cd /tmp && \
    rm -rf python

WORKDIR /opt

RUN R -e "install.packages( \
    c('devtools', 'knitr', 'ggplot2', 'mplot', \
    'googleVis', 'data.table', 'wordcloud'), \
    repos = 'http://cran.us.r-project.org' ); \
    require(devtools); \
    install_github('ramnathv/rCharts'); "

RUN pip3 install matplotlib numpy pandas

ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

EXPOSE 4040 6066 7077 8080 8181

#ENTRYPOINT ["/opt/spark/bin/spark-class"]
  # expecting:
  # org.apache.spark.deploy.master.Master
  # org.apache.spark.deploy.worker.Worker spark://master:7077

