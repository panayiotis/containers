# docker build -t adam .
# docker run --rm -it --name adam -p 4040:4040 -p 8080:8080 adam

FROM fedora:24

MAINTAINER Panayiotis Vlantis <panosv@di.uoa.gr>

RUN rm /etc/yum.repos.d/fedora-updates.repo &&\
  dnf -y install which java-1.8.0-openjdk-headless hostname tar procps &&\
  dnf clean all

ENV JAVA_HOME /usr/lib/jvm/jre

WORKDIR /opt

RUN mkdir hadoop spark zeppelin

RUN curl -s http://apache.cc.uoc.gr/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    | gunzip | tar x --strip=1 -C hadoop

ENV HADOOP_HOME /opt/hadoop

RUN curl -s http://apache.cc.uoc.gr/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz \
    | gunzip | tar x --strip=1 -C spark &&\
    echo -e '#!/usr/bin/env bash\nexport SPARK_DIST_CLASSPATH=$(hadoop classpath)' \
      > /opt/spark/conf/spark-env.sh

ADD spark-defaults.conf /opt/spark/conf/

ENV SPARK_HOME /opt/spark

RUN dnf -y install git maven &&\
    git clone https://github.com/bigdatagenomics/adam &&\
    cd adam &&\
    git reset --hard 54371cbd83bfa64e3085ad4b05417ef0d1637c6c &&\
    scripts/move_to_spark_2.sh &&\
    scripts/move_to_scala_2.11.sh &&\
    sed -e "s/2.6.0/2.7.3/g" -i pom.xml &&\
    mvn clean package -DskipTests &&\
    mv adam-assembly/target/adam*.jar /opt/adam.jar &&\
    cd /opt &&\
    rm -r adam &&\
    rm -r /root/.m2 &&\
    dnf -y remove git maven &&\
    dnf -y clean all &&\
    echo -e '#!/usr/bin/env bash'\\n'$SPARK_HOME/bin/spark-shell' \
      --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
      --conf spark.kryo.registrator=org.bdgenomics.adam.serialization.ADAMKryoRegistrator \
      --jars /opt/adam.jar '$@'> /usr/bin/adam-shell &&\
    chmod +x /usr/bin/adam-shell

RUN curl -s http://apache.cc.uoc.gr/zeppelin/zeppelin-0.6.1/zeppelin-0.6.1-bin-netinst.tgz \
    | gunzip | tar x --strip=1 -C zeppelin &&\
  zeppelin/bin/install-interpreter.sh --name file,md,shell

ADD interpreter.json /opt/zeppelin/conf/

ENV ZEPPELIN_HOME /opt/zeppelin

ENV MASTER local[*]

ENV SPARK_MASTER_WEBUI_PORT 9090

ENV PATH $SPARK_HOME/bin:$HADOOP_HOME/bin:$ZEPPELIN_HOME/bin:$PATH

ADD .bash_history /root/

EXPOSE 4040 7077 8080 9090

WORKDIR /opt/zeppelin

CMD ["zeppelin.sh"]

#CMD ["adam-shell"]

#CMD ["bash"]
