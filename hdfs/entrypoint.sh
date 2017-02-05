#!/usr/bin/bash

dfs="/var/dfs"

if [ "$(ls -A $dfs)" ]; then
  echo "do not format namenode"
else
  echo "format namenode"
  hdfs namenode -format
fi

hdfs $@

