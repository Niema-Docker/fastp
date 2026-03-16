# Minimal Docker image for fastp using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install fastp
RUN apk update && \
    apk add bash g++ make zlib-dev && \
    wget -qO- "https://github.com/OpenGene/fastp/archive/refs/tags/v1.2.0.tar.gz" | tar -zx && \
    cd fastp-* && \
    make && \
    make install && \
    cd .. && \
    rm -rf fastp-*
