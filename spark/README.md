# Spark container

# Version
Java 1.8.0  
Spark 2.2.1  
Hadoop 2.7.6  

## Build
    docker build -t panos/spark .

## Run
##### spark master

    docker run --rm -it --name spark-master --hostname master spark-class panos/spark org.apache.spark.deploy.master.Master

##### spark worker
    
    master=`docker inspect --format '{{.NetworkSettings.IPAddress}}' spark-master`
    docker run --rm -it --name spark-worker-01 --add-host master:$master panos/spark spark-class org.apache.spark.deploy.worker.Worker spark://master:7077

##### submit a jar 
    master=`docker inspect --format '{{.NetworkSettings.IPAddress}}' spark-master`
    docker run --rm -it --add-host master:$master -v `pwd`/example.jar:/var/example.jar:z panos/spark spark-submit --class example.ExampleClass --master spark://master:7077 /var/example.jar
