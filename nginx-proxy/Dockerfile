FROM dynamind/nginx

ENV DOCKER_GEN_VERSION 0.3.6

# Install Forego (Foreman)
RUN yum -y install wget tar && \
    wget https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -P/usr/local/bin && \
    chmod u+x /usr/local/bin/forego

# Install docker-gen
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs"]

CMD ["forego", "start", "-r"]