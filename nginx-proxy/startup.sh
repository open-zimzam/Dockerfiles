# Just an example
docker run -d --name nginx-proxy -p 80:80 -p 443:443 -v /home/core/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock dynamind/nginx-proxy
docker run -d -e VIRTUAL_HOST=your.domain.com -v /home/core/logo.html:/usr/share/nginx/html/index.html --name nginx01 dynamind/nginx