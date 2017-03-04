# Spark container

# Version
Spark 2.1.0  
Hadoop 2.7.3  

## Build
    docker build -t spark .

## Run
##### spark master

    docker run --rm -it --name spark-master --hostname master --entrypoint /opt/spark/bin/spark-class panos/spark org.apache.spark.deploy.master.Master

##### spark worker
    
    master=`docker inspect --format '{{.NetworkSettings.IPAddress}}' spark-master`
    docker run --rm -it --name spark-worker-01 --add-host master:$master --entrypoint /opt/spark/bin/spark-class panos/spark org.apache.spark.deploy.worker.Worker spark://master:7077

##### submit a jar 
    master=`docker inspect --format '{{.NetworkSettings.IPAddress}}' spark-master`
    docker run --rm -it --add-host master:$master -v `pwd`/example.jar:/var/example.jar:Z --entrypoint /opt/spark/bin/spark-submit panos/spark --class example.ExampleClass --master spark://master:7077 /var/example.jar
