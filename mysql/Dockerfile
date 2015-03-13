FROM centos:7

# Install Percona 5.6 (see: http://www.percona.com/doc/percona-server/5.6/installation/yum_repo.html)
RUN yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm && \
    yum -y install Percona-Server-client-56 Percona-Server-server-56

#RUN mkdir /var/run/mysqld && chown mysql: /var/run/mysqld

COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/etc/mysql", "/var/lib/mysql"]

COPY mysql_setup /
ENTRYPOINT ["/mysql_setup"]

EXPOSE 3306
CMD ["mysqld"]