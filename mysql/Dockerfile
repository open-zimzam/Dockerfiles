FROM centos:7

# Install Percona 5.6 (see: http://www.percona.com/doc/percona-server/5.6/installation/yum_repo.html)
RUN yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm && \
    yum -y install Percona-Server-client-56 Percona-Server-server-56

COPY mysql_setup /tmp/
COPY mysql_secure_installation.sql /tmp/

RUN sh /tmp/mysql_setup    

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /

USER mysql

# Define default command.
CMD ["/usr/bin/mysqld_safe"]

# Expose ports.
EXPOSE 3306