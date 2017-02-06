#!/bin/bash
set -e

dfs="/var/dfs/name"

if [ $1 == "namenode" ] && [ ! -d "$dfs" ] || [ ! "$(ls -A $dfs)" ]
then
  echo "Format namenode"
  hdfs namenode -format
fi

exec hdfs "$@"

