# Strabon
Strabon is a semantic spatiotemporal RDF store. You can use it to store linked geospatial data that changes over time and pose queries using SPARQL.
*see [strabon.di.uoa.gr](http://strabon.di.uoa.gr/)*

### Build info
This image is based on **Centos 7**

Strabon is cloned from its Mercurial repository

Tomcat listens to port **8080**

A subset of the
[Greek Administrative Geography](http://www.linkedopendata.gr/dataset/greek-administrative-geography)
dataset has been included in the image  and it is available under the url location **/files**

Strabon's default username and password is *endpoint* and *3ndpo1nt*
It is asked when you update data via the web interface.

## Usage
Strabon need a PostGIS enabled PostgreSQL database system.
To connect strabon to the
[postgis](/postgis)
container, the *run* command must be invoked with the --link option to create a link between the two containers.
*see [linking](https://docs.docker.com/userguide/dockerlinks/)*


##### Create a container named strabon, publish port 8080 and link it with the postgis container

    docker run -p 8080:8080 --link postgis:postgis \
    --name panos/strabon strabon

##### Mount a local directory to /files url location so it can be accessible online

    docker run -p 8080:8080 --link postgis:postgis \
    -v /home/user/path/dir:/usr/share/tomcat/webapps/files/dir \
    --name panos/strabon strabon
