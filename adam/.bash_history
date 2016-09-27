adam-shell --master spark://localhost:7077
zeppelin-daemon.sh start
zeppelin.sh
$SPARK_HOME/sbin/start-slave.sh spark://localhost:7077
$SPARK_HOME/sbin/start-master.sh --host localhost
