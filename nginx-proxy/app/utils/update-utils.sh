#!/bin/bash

docker run --rm -v "$PWD":/tmp/forego/bin -w /tmp/forego golang:1.6 bin/build-forego.sh

DOCKER_GEN_VERSION=0.7.0
DOCKER_GEN_ARCHIVE=docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/$DOCKER_GEN_ARCHIVE
tar -xvzf $DOCKER_GEN_ARCHIVE -C . 
rm $DOCKER_GEN_ARCHIVE
