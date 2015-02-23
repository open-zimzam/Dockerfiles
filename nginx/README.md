Uses CentOS 7 base image.

Builds NginX 1.6.2 from source, include 3rd party modules: 

- nginx-sticky-module-ng
- nginx-upstream-check-module
- geo-ip
- gnosek-nginx-upstream-fair 

## Clone this repository and build the NginX image
    git clone https://github.com/open-zimzam/Dockerfiles.git
    docker build -t nginx Dockerfiles/nginx

### Run the container
    docker run --name nginx -d -p 80:80 -p 443:443 nginx

### If you're using Boot2Docker on a Mac
    open http://$(boot2docker ip)
