FROM centos:7

ENV ZK_VERSION 3.4.6

RUN yum -y install wget java
RUN curl -s "http://www.apache.org/dyn/closer.cgi/zookeeper/?as_json=1" | grep -Po '\"preferred\": \"\K[^\"]+' > /tmp/mirror
RUN ZK_MIRROR=$(cat /tmp/mirror) && wget ${ZK_MIRROR}zookeeper/stable/zookeeper-${ZK_VERSION}.tar.gz -P/tmp
RUN tar -zxf /tmp/zookeeper-${ZK_VERSION}.tar.gz -C /usr/share
RUN ln -s zookeeper-${ZK_VERSION} /usr/share/zookeeper
    
RUN echo -e 'tickTime=2000\ndataDir=/var/lib/zookeeper/\nclientPort=2181' > /usr/share/zookeeper/conf/zoo.cfg
    
EXPOSE 2181

CMD ["/usr/share/zookeeper/bin/zkServer.sh", "start-foreground"]