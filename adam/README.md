# Adam container
Adam repository:  [bigdatagenomics/adam](https://github.com/bigdatagenomics/adam)

# Version
Adam commit [54371cb](https://github.com/bigdatagenomics/adam/commit/54371cbd83bfa64e3085ad4b05417ef0d1637c6c)  
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
