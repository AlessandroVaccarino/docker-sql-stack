# Hadoop Sql Stack Docker container
A Docker container containing an Hadoop SQL Stack (Hadoop, Zookeeper, Hive, Pig, HBase) ready to use installation

## What is Apache Drill Docker container project?
An Hadoop based Sql Stack installation into a Docker container. Just run and enjoy.
It's based on [sequenceiq/hadoop-docker](https://github.com/sequenceiq/hadoop-docker) images, plus:
  - [Zookeeper](https://zookeeper.apache.org/)
  - [Pig](https://pig.apache.org/)
  - [Hive](https://hive.apache.org/)
  - [HBase](https://hbase.apache.org/)

### Run the container 

To run your container, just type:

`docker run --name hadoop-sql-stack -p 2122:2122 -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8040:8040 -p 8042:8042 -p 8088:8088 -p 9000:9000 -p 9083:9083 -p 10000:10000 -p 8033:8033 -p 19888:19888 -p 10020:10020 -p 50010:50010 -p 49707:49707 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 50030:50030 -p 50728:50728 -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 16030:16030 -p 16100:16100 -it -d alessandrov87/hadoop-sql-stack /etc/bootstrap.sh`

It will download the latest version available for the Docker image, create the container, start services and expose web interfaces.

So, after executed your container, you can reach the following web pages:
  - `http://localhost:8042`: Yarn Nodemanager Webapp
  - `http://localhost:8088`: Yarn Resourcemanager Webapp
  - `http://localhost:19888`: Yarn History Web UI
  - `http://localhost:50070`: HDFS Namenode Web UI
  - `http://localhost:50075`: HDFS Datanode Web UI
  - `http://localhost:50090`: Secondary HDFS Namenode Web UI
  - `http://localhost:16010`: HBase Web UI
