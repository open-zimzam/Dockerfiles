FROM centos:7

COPY percona-release-0.1-3.noarch.rpm /tmp/percona-release-0.1-3.noarch.rpm

# Install Percona 5.6 (see: http://www.percona.com/doc/percona-server/5.6/installation/yum_repo.html)
RUN yum -y install /tmp/percona-release-0.1-3.noarch.rpm && \
    yum -y install Percona-Server-client-56 Percona-Server-server-56
    
# Remove initial datadir (will be recreated in mysql_setup script)    
RUN rm -rf /var/lib/mysql

#RUN mkdir /var/run/mysqld && chown mysql: /var/run/mysqld

COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/etc/mysql", "/var/lib/mysql"]

COPY mysql_setup /
ENTRYPOINT ["/mysql_setup"]

EXPOSE 3306
CMD ["mysqld"]