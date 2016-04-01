FROM dynamind/nginx

COPY app /app/
WORKDIR /app/

RUN openssl dhparam -out /etc/nginx/dhparams.pem 2048

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs"]

CMD ["/app/utils/forego", "start", "-r"]