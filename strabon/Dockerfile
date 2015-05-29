## Strabon
#
# Build:  docker build -t strabon .
#   Run:  docker run -it -p 8080:8080 -p 8009:8009
#                    --link postgres:postgres --name strabon strabon
# to mount a directory to /files tomcat endpoint add the parameter:
# -v /host/path/dir:/usr/share/tomcat/webapps/files/dir
#

FROM centos:7
MAINTAINER Panayiotis Vlantis <p.vlantis@di.uoa.gr>

# Locale setting
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update system and install mercurial maven and tomcat
RUN yum -y install deltarpm && \
    yum -y update && \
    yum -y install sudo unzip mercurial maven tomcat; \
    yum clean all;

# Sudo requires a tty
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

# Clone and compile Strabon
RUN hg clone 'http://hg.strabon.di.uoa.gr/Strabon/' && \
    cd Strabon && \
    mvn clean package

# Deploy Strabon to Tomcat
RUN mkdir /var/lib/tomcat/webapps/strabon && \
    unzip /Strabon/endpoint/target/strabon-endpoint-*.war \
          -d /var/lib/tomcat/webapps/strabon

# Change Strabon database host to postgres
RUN sed -i 's/localhost/postgres/' usr/share/tomcat/webapps/strabon/WEB-INF/connection.properties

# Make ontology files accessible under
# the /files url
ADD gag.tar.bz2 /usr/share/tomcat/webapps/files/
COPY web.xml /usr/share/tomcat/webapps/files/WEB-INF/

# Also add a simple index file to the server
COPY index.html /usr/share/tomcat/webapps/ROOT/

# Change Tomcat's server.xml
# this is needed to make tomcat display UTF-8 URIs correctly
COPY server.xml /etc/tomcat/

# Java options
ENV JAVA_OPTS -server -Xms2048m -Xmx2048m -XX:NewSize=512m \
              -XX:MaxNewSize=512m -XX:PermSize=2048m \
              -XX:MaxPermSize=2048m -Dfile.encoding=UTF8

# Tomcat ports
EXPOSE 8080 8009

# Default command to run when starting the container
CMD [ "/usr/libexec/tomcat/server", "start" ]
