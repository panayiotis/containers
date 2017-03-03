#!/bin/bash
set -e

dfs="/var/dfs/name"

if [ ! -d "$dfs" ] || [ ! "$(ls -A $dfs)" ]
then
  if [ $1 == "namenode" ]
  then
    echo "Format namenode"
    hdfs namenode -format
  else
    echo "Delay datanode while namenode is formating"
    sleep 20
  fi
fi

exec hdfs "$@"

