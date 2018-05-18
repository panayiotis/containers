FROM panos/hadoop

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

LABEL name "Apache Spark"

LABEL version "2.2.1"

# Install Apache Spark
#
RUN true \
    && set -o pipefail \
    && mkdir /opt/spark \
    && curl -s http://www-eu.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz \
    | gunzip \
    | tar x --strip=1 -C /opt/spark \
    && echo -e '#!/usr/bin/env bash\nexport SPARK_DIST_CLASSPATH=$(hadoop classpath)' \
       > /opt/spark/conf/spark-env.sh

ENV SPARK_HOME /opt/spark

ENV PYSPARK_PYTHON python3

ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

# Install python data-science packages
#
RUN true \
    && dnf install -y --setopt=tsflags=nodocs \
         python3-{pandas,numpy,matplotlib} \
    && dnf clean all

# Install R
#
RUN true \
    && dnf install -y --setopt=tsflags=nodocs \
         R \
         R-devel \
         libcurl-devel \
         libssh2-devel \
         libxml2-devel \
    && dnf clean all

## Install R data-science packages
##
RUN true \
    && dnf install --enablerepo updates -y --setopt=tsflags=nodocs \
         R-{dichromat,digest,evaluate,fastmatch,fts,git2r,gtable,hexbin,highr} \
         R-{htmltools,httpuv,httr,iterators,knitr,labeling,markdown,mime} \
         R-{munsell,plyr,Rcpp,Rcpp-devel,reshape,reshape2,sp,stringr} \
         R-{testit,testthat,timeDate,yaml,zoo} \
    && mkdir -p /usr/share/doc/R/html \
    && R -e "install.packages( \
              c('devtools', \
                'ggplot2', \
                'mplot', \
                'googleVis', \
                'data.table', \
                'wordcloud'), \
              repos = 'http://cran.us.r-project.org', \
              clean = TRUE, \
              INSTALL_opts = c('--no-html') \
            );" \
    && R -e "require(devtools); install_github('rCharts', 'ramnathv')"

EXPOSE 4040 6066 7077 8080 8181

#CMD ["spark-class", "org.apache.spark.deploy.master.Master"]
#CMD ["spark-class", "org.apache.spark.deploy.worker.Worker", "spark://master:7077"]
