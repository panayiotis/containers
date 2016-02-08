# PostgreSQL 9.4 with PostGIS extensions

### Build info
This image is based on Centos 7

#### Extra Repositories:
* [postgresql.org](http://yum.postgresql.org/) the official postgreSQL repository
* [EPEL](http://fedoraproject.org/wiki/EPEL) is needed to resolve some dependencies

#### initdb
The initdb script is used to initialize the PostgreSQL database system.

#### setupdb
1. Sets 'porsgresql' user's password
2. Creates a PostGIS database template
3. Create a spatially-enabled database named endpoint that will be used by Strabon

#### copy_postgres_data
The copy_postgres_data copies on docker run the postgres data from the temp postgres data directory to the /var/lib/pgsql/9.4/data directory. 
This enables mounting a host directory to /var/lib/pgsql/9.4/data without losing the init data created from the initdb script.

## Usage
##### Create a container named postgis and publish 5432 to a random port

    docker run -P --name postgis panos/postgis

##### Create a container named postgis and publish 5432 to port 5432 on host

    docker run -p 5432:5432 --name postgis panos/postgis
    
##### Create a container named postgis, publish 5432 to port 5432 on host and mount /srv/postgis/data to /var/lib/pgsql/9.4/data

    docker run -p 5432:5432 -v /srv/postgis/data:/var/lib/pgsql/9.4/data --name postgis panos/postgis

##### Create a container named postgis and open a bash shell instead of starting the database.  

      docker run --name postgis panos/postgis bash
