FROM panos/spark

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

LABEL name "Apache Livy"

LABEL version "0.6-e3f45a05"

RUN true \
    && set -o pipefail \
    && mkdir /opt/livy \
    && curl -s ftp://vlantis.gr/pub/livy-0.6.0-incubating-SNAPSHOT-bin.tar.gz \
    | gunzip \
    | tar x --strip=1 -C /opt/livy \
    && mkdir /opt/livy/logs

ENV LIVY_HOME /opt/livy

ENV PATH $LIVY_HOME/bin:$PATH

EXPOSE 8998

## Add user and change /opt/livy owner to user
#
RUN true \
    && useradd --uid 1000 --comment user user \
    && chown -R 1000:1000 $LIVY_HOME

## Run the rest commands as user
#
USER user

ENV USER user

ENV HOME /home/user

WORKDIR $HOME

CMD "livy-server"
