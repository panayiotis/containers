## Postgres for Strabon
#
# Build: docker build -t postgres .
#   Run: docker run -it -P --name postgres postgres
#

FROM centos:7
MAINTAINER Panayiotis Vlantis <p.vlantis@di.uoa.gr>

# Locale setting
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update system and install PostgreSQL
# from postgresql's Centos repositories
RUN yum -y install deltarpm && \
    yum -y update && \
    yum -y install epel-release && \
    yum -y install 'http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm' && \
    yum -y install sudo postgresql94-server postgresql94-contrib \
                   postgis2_94 postgresql94; \
    yum clean all;

# Sudo requires a tty
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

# Copy database scripts
COPY initdb setupdb /usr/local/bin/
RUN chmod +x /usr/local/bin/*db
RUN chown -v postgres.postgres /usr/local/bin/setupdb

# Initialize database
RUN /usr/local/bin/initdb

# Run the rest commands as postgres user
USER postgres

# Start and Setup database
# (including setting password for postgres user)
RUN /usr/local/bin/setupdb

# Allow remote connections to database
RUN echo -e "host \t all \t all \t 0.0.0.0/0 \t md5" \
    >> /var/lib/pgsql/9.4/data/pg_hba.conf

# Listen_addresses controls which interfaces accept connections
RUN echo "listen_addresses='*'" \
         >> /var/lib/pgsql/9.4/data/postgresql.conf

# PostgreSQL port
EXPOSE 5432

# PostgreSQL volume
VOLUME ["/var/lib/pgsql/9.4/data"]

# Default command to run when starting the container
CMD [ "/usr/pgsql-9.4/bin/postgres",   \
      "-D", "/var/lib/pgsql/9.4/data", \
      "-p", "5432"                     \
    ]
