FROM panos/spark

LABEL maintainer "Panayiotis Vlantis <panosv@di.uoa.gr>"

LABEL zeppelin 0.7.0

WORKDIR /opt/

RUN mkdir zeppelin &&\
  curl -s http://www-eu.apache.org/dist/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-netinst.tgz \
  | gunzip | tar x --strip=1 -C zeppelin &&\
  zeppelin/bin/install-interpreter.sh --name file,md,python,shell

ENV ZEPPELIN_HOME /opt/zeppelin

ENV PATH $ZEPPELIN_HOME/bin:$PATH

VOLUME ["/opt/zeppelin/conf", "/opt/zeppelin/notebook"]

EXPOSE 8080

ENTRYPOINT ["/opt/zeppelin/bin/zeppelin.sh"]
