FROM dynamind/oracle-jdk:8

# Settings used during setup
ENV TOMCAT_VERSION 8.0.26
ENV APR_VERSION 1.1.33
ENV TOMCAT_XMS 512m
ENV TOMCAT_XMX 512m

# Required to run Tomcat
ENV CATALINA_HOME /usr/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Info on use of /dev/urandom below: http://www.labouisse.com/misc/2014/06/19/tomcat-startup-time-surprises/
ENV JAVA_OPTS -Dfile.encoding=UTF-8 \
-Djava.security.egd=file:/dev/urandom \
-Dnet.sf.ehcache.skipUpdateCheck=true \
-XX:+UseConcMarkSweepGC \
-XX:+CMSClassUnloadingEnabled \
-XX:+UseParNewGC \
-Xms$TOMCAT_XMS -Xmx$TOMCAT_XMX

# Install Tomcat in /usr/tomcat
RUN useradd -r tomcat --shell /bin/false && \
    yum -y install wget tar && \
    wget http://apache.mirror.triple-it.nl/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -P/tmp && \
    tar -xvzf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C /tmp && \
    mv /tmp/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME && \
    rm /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    rm -rf $CATALINA_HOME/webapps/docs && \
    rm -rf $CATALINA_HOME/webapps/examples && \
    chown -hR tomcat: $CATALINA_HOME && \
    chmod +x $CATALINA_HOME/bin/*.sh

# Folder /usr/tomcat is created in RUN statement above
COPY conf/ $CATALINA_HOME/conf/

# Build APR Native library
RUN echo "Building APR Native Library" && \
    yum -y install gcc make apr-devel openssl-devel && \
    wget http://apache.mirror.triple-it.nl/tomcat/tomcat-connectors/native/$APR_VERSION/source/tomcat-native-$APR_VERSION-src.tar.gz -P/tmp && \
    tar -xvzf /tmp/tomcat-native-$APR_VERSION-src.tar.gz -C /tmp && \
    cd /tmp/tomcat-native-$APR_VERSION-src/jni/native && \
    ./configure --with-apr=/usr/bin/apr-1-config && make && make install && \
    yum -y remove gcc make apr-devel openssl-devel
    

ENV LD_LIBRARY_PATH /usr/local/apr/lib:$LD_LIBRARY_PATH

WORKDIR $CATALINA_HOME

USER tomcat
EXPOSE 8080

CMD ["catalina.sh", "run"]