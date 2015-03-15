FROM centos:7

ENV LIBWEBP_VERSION=0.4.3
ENV GM_VERSION=1.3.21

RUN yum install -y wget tar gcc make libpng libjpeg libpng-devel libjpeg-devel && \
    echo 'Building webp from source...' && \
    wget http://downloads.webmproject.org/releases/webp/libwebp-$LIBWEBP_VERSION.tar.gz -P/tmp && \
    tar -xvzf /tmp/libwebp-$LIBWEBP_VERSION.tar.gz -C /tmp && \
    cd /tmp/libwebp-$LIBWEBP_VERSION && \
    ./configure && make && make install && \
    echo 'Building GraphicsMagick from source to include webp...' && \
    wget http://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$GM_VERSION/GraphicsMagick-$GM_VERSION.tar.gz -P/tmp && \
    tar -xvzf /tmp/GraphicsMagick-$GM_VERSION.tar.gz -C /tmp && \
    cd /tmp/GraphicsMagick-$GM_VERSION && \
    ./configure --enable-shared && make && make install && \
    echo 'Cleaning up' && \
    yum remove -y wget tar gcc make libpng-devel libjpeg-devel && \
    rm -rf /tmp/* && \
    rm -rf /usr/local/share/doc/GraphicsMagick && \
    rm -rf /usr/include && \
    rm -rf /usr/local/include
    
