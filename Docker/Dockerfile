# Version: 0.0.1
FROM sequenceiq/hadoop-docker:2.7.1
LABEL maintainer="alessandrov87 (https://github.com/AlessandroVaccarino)"
# Download Pig
RUN curl http://apache.mirror.anlx.net/pig/latest/pig-0.17.0.tar.gz | tar -zx -C /usr/local
ENV PATH /usr/local/pig-0.16.0/bin:$PATH
ENV PATH /usr/local/hadoop/bin:$PATH
# Download and Init Hive
RUN curl http://apache.mirror.anlx.net/hive/stable/apache-hive-1.2.2-bin.tar.gz | tar -zx -C /usr/local
ENV PATH /usr/local/apache-hive-1.2.1-bin/bin:$PATH
RUN /usr/local/apache-hive-1.2.1-bin/schematool -initSchema -dbType derby
# Downlaod Zookeeper (for HBase)
RUN curl http://apache.mirror.anlx.net/zookeeper/stable/zookeeper-3.4.12.tar.gz | tar -zx -C /usr/local
ENV PATH /usr/local/zookeeper-3.4.12/bin:$PATH
# Download HBase
RUN curl http://apache.mirror.anlx.net/hbase/stable/hbase-1.2.6-bin.tar.gz | tar -zx -C /usr/local
ENV PATH /usr/local/hbase-1.2.6/bin:$PATH
# Configure HBase
RUN rm /usr/local/hbase-1.2.6/conf/hbase-site.xml
COPY hbase-site.xml /usr/local/hbase-1.2.6/conf/
# Configure boostrap file
RUN rm /etc/bootstrap.sh
COPY bootstrap.sh /etc/
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh
# Expose Ports
EXPOSE 10020
EXPOSE 50070
EXPOSE 50030
EXPOSE 8088
EXPOSE 16000
EXPOSE 16010
EXPOSE 16020
EXPOSE 16030
EXPOSE 16100
