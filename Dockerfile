# Minimal Docker image for fastp v0.20.1 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install fastp
RUN apk update && \
    apk add bash g++ make zlib-dev && \
    wget -qO- "https://github.com/OpenGene/fastp/archive/refs/tags/v0.20.1.tar.gz" | tar -zx && \
    cd fastp-0.20.1 && \
    make && \
    make install && \
    cd .. && \
    rm -rf fastp-0.20.1
