#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}
: ${HIVE_PREFIX:=/usr/local/apache-hive-1.2.2-bin}
: ${HBASE_PREFIX:=/usr/local/hbase-1.2.6}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

service sshd start
$HADOOP_PREFIX/sbin/start-dfs.sh &
$HADOOP_PREFIX/sbin/start-yarn.sh &
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver &
# Launch HIVE
$HIVE_PREFIX/bin/hive --service metastore  &
$HIVE_PREFIX/bin/hive --service hiveserver2 &
# Launch HBase
$HBASE_PREFIX/bin/start-hbase.sh &

/bin/bash