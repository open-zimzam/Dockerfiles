FROM centos:7

# Install latest Oracle JDK8
# Check latest version: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

ENV JAVA_VERSION 8u45
ENV JAVA_BUILD $JAVA_VERSION-b14

RUN yum -y install wget && \
    wget --no-cookies --no-check-certificate -P/tmp \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_BUILD/jdk-$JAVA_VERSION-linux-x64.rpm" && \
    rpm -Uvh /tmp/jdk-$JAVA_VERSION-linux-x64.rpm && java -version && \
    rm /tmp/jdk-$JAVA_VERSION-linux-x64.rpm
    
ENV JAVA_HOME /usr/java/latest