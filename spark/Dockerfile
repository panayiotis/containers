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

ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

EXPOSE 4040 6066 7077 8080 8181

ENTRYPOINT ["/opt/spark/bin/spark-class"]
  # expecting:
  # org.apache.spark.deploy.master.Master
  # org.apache.spark.deploy.worker.Worker spark://master:7077

