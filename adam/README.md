# Adam container
Adam repository:  [bigdatagenomics/adam](https://github.com/bigdatagenomics/adam)

# Version
Adam commit [d914ee4](https://github.com/bigdatagenomics/adam/commit/d914ee4aa023440ff52cef9dd72daa5ea47ed558)  
Scala 2.11.8  
Spark 2.0.0  
Hadoop 2.7.3  
Zeppelin 1.6.1  

## Build
    docker build -t adam .

## Run
##### zeppelin server

    docker run --rm -it --name adam -p 4040:4040 -p 8080:8080 panos/adam

##### spark-shell

    docker run --rm -it --name adam -p 4040:4040 panos/adam adam-shell

##### bash

    docker run ---rm -it --name adam panos/adam bash

## Layers
    IMAGE          CREATED BY                                      SIZE     
    d93669b90e85   /bin/sh -c #(nop) CMD ["/opt/zeppelin/bin/zep   0 B                 
    b913110bc73f   /bin/sh -c #(nop) WORKDIR /opt/zeppelin         0 B                 
    5dfa7285088a   /bin/sh -c #(nop) EXPOSE 4040/tcp 8080/tcp      0 B                 
    d8fddb97e367   /bin/sh -c #(nop) ADD file:5ea0f9db1bbb2af822   4.566 kB            
    e8d2df2c3bac   /bin/sh -c #(nop) ENV MASTER=local[*]           0 B                 
    d57e0ee71adb   /bin/sh -c #(nop) ENV ZEPPELIN_SPARK_USEHIVEC   0 B                 
    6fec8eb47a15   /bin/sh -c #(nop) ENV ZEPPELIN_HOME=/opt/zepp   0 B                 
    f6e2a69257a7   /bin/sh -c curl -s http://apache.cc.uoc.gr/ze   287.8 MB            
    1fe65eca4800   /bin/sh -c dnf -y install git maven &&    git   55.85 MB            
    244d8ba34640   /bin/sh -c #(nop) ENV SPARK_HOME=/opt/spark     0 B                 
    1e63a00e3de6   /bin/sh -c curl -s http://apache.cc.uoc.gr/sp   213.1 MB            
    d83e1ecc4070   /bin/sh -c #(nop) ENV HADOOP_HOME=/opt/hadoop   0 B                 
    75f1e3833897   /bin/sh -c curl -s http://apache.cc.uoc.gr/ha   332.2 MB            
    04c3505e9c44   /bin/sh -c mkdir hadoop spark zeppelin          0 B                 
    5f201d0c9a3f   /bin/sh -c #(nop) WORKDIR /opt                  0 B                 
    d88522b2f5ad   /bin/sh -c rm /etc/yum.repos.d/fedora-updates   154.8 MB            
    f3cd68c52452   /bin/sh -c #(nop) MAINTAINER Panayiotis Vlant   0 B                 
    11a5107645d4   /bin/sh -c #(nop) ADD file:173b1e8c2abeb1c18c   204.4 MB   
