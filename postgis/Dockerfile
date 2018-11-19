## PostgreSQL 9.4 with PostGIS extensions for
## Strabon semantic spatiotemporal RDF store
## http://strabon.di.uoa.gr
#
# Build: docker build -t strabon_postgis .
#   Run: docker run --name strabon_postgis strabon_postgis
#   or
#   Run: docker run -p 5432:5432 -v /srv/postgis/data:/var/lib/pgsql/9.4/data --name strabon_postgis  panos/postgis
#

FROM centos:7
MAINTAINER Panayiotis Vlantis <p.vlantis@di.uoa.gr>
MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>
MAINTAINER Konstantinos Mitrogeorgos <konmitr@iit.demokritos.gr>


# Locale setting
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install PostgreSQL 9.4 and PostGIS
# from PostgreSQL and EPEL repositories
RUN yum -y install epel-release && \
    yum -y install 'http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm' && \
    yum -y install sudo postgresql94-server postgresql94-contrib \
                   postgis2_94 postgresql94 && \
    yum clean all;

# Sudo requires a tty
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

# Copy database scripts
COPY initdb setupdb copy_postgres_data /usr/local/bin/
RUN chmod +x /usr/local/bin/*db
RUN chmod +x /usr/local/bin/copy_postgres_data
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
    >> /var/lib/pgsql/9.4/data_temp/pg_hba.conf

# listen_addresses controls which interfaces accept connections
RUN echo "listen_addresses='*'" \
         >> /var/lib/pgsql/9.4/data_temp/postgresql.conf

# PostgreSQL port
EXPOSE 5432

USER root
CMD /usr/local/bin/copy_postgres_data && su - postgres -c "/usr/pgsql-9.4/bin/postgres -D /var/lib/pgsql/9.4/data -p 5432"
