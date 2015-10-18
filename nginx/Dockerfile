FROM centos:7

# Build NginX from source, include 3rd party modules: 
# nginx-sticky-module-ng, nginx-upstream-check-module, geo-ip, gnosek-nginx-upstream-fair 

ENV NGINX_VERSION 1.9.5
ENV GEOIP_VERSION 1.5.0-9

# Normal way of installing NginX on CentOS:
# RUN echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/nginx.repo && yum -y install nginx

RUN yum -y install wget tar git gcc make pcre pcre-devel zlib zlib-devel openssl openssl-devel GeoIP GeoIP-devel

RUN cd /tmp &&\
    git clone https://github.com/gnosek/nginx-upstream-fair.git &&\
    git clone https://bitbucket.org/nginx-goodies/nginx-sticky-module-ng.git &&\
    git clone https://github.com/yaoweibin/nginx_upstream_check_module.git &&\
    wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -P/tmp &&\
    tar -xvzf nginx-$NGINX_VERSION.tar.gz &&\
    cd nginx-$NGINX_VERSION &&\
    ./configure \
        --prefix=/usr/share/nginx \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --http-client-body-temp-path=/var/lib/nginx/tmp/client_body \
        --http-proxy-temp-path=/var/lib/nginx/tmp/proxy \
        --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/lock/subsys/nginx \
        --user=nginx \
        --group=nginx \
        --with-http_ssl_module \
        --with-http_geoip_module \
        --with-http_spdy_module \
        --add-module=/tmp/nginx-upstream-fair \
        --add-module=/tmp/nginx-sticky-module-ng \
        --add-module=/tmp/nginx_upstream_check_module &&\
    useradd --no-create-home nginx &&\
    make && make install

# Clean up    
RUN yum -y remove wget tar git gcc make pcre-devel zlib-devel openssl-devel GeoIP-devel

RUN mkdir /etc/nginx/conf.d &&\
    mkdir -p /var/lib/nginx/tmp/client_body &&\
    chown -R nginx.nginx /var/lib/nginx/ &&\
    chmod -R 770 /var/lib/nginx/

# enables GZIP
COPY nginx/ /etc/nginx/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]