FROM dynamind/nginx

COPY app /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs"]

CMD ["/app/utils/forego", "start", "-r"]