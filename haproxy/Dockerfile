FROM centos:7

# Creates user haproxy:
# haproxy:x:188:188:haproxy:/var/lib/haproxy:/sbin/nologin
#
# /etc/haproxy
# /etc/haproxy/haproxy.cfg
# /etc/logrotate.d/haproxy
# /usr/bin/halog
# /usr/lib/systemd/system/haproxy.service
# /usr/sbin/haproxy
# /usr/sbin/haproxy-systemd-wrapper
# /usr/share/doc/haproxy-1.5.2
# /usr/share/haproxy
# /usr/share/haproxy/400.http
# /usr/share/haproxy/403.http
# /usr/share/haproxy/408.http
# /usr/share/haproxy/500.http
# /usr/share/haproxy/502.http
# /usr/share/haproxy/503.http
# /usr/share/haproxy/504.http
# /usr/share/haproxy/README
# /var/lib/haproxy

ENV DOCKER_GEN_VERSION 0.3.6

# Install HAProxy, Forego (Foreman)
RUN yum -y install wget tar haproxy && \
    wget https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -P/usr/local/bin && \
    chmod u+x /usr/local/bin/forego

# Install docker-gen
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

COPY . /app/
WORKDIR /app/

# -v /var/run/docker.sock:/tmp/docker.sock
ENV DOCKER_HOST unix:///tmp/docker.sock

# -v /home/core/certs:/etc/haproxy/certs
# Note: HAProxy prefers PEM files over CRT/KEY, so just concat them like this: 
#       cat domain.crt domain.key | sudo tee domain.pem
VOLUME ["/etc/haproxy/certs"]

CMD ["forego", "start", "-r"]
