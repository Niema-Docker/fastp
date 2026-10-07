# Minimal Docker image for fastp using Alpine base
FROM alpine:latest

# install fastp
RUN apk update && \
    apk add --no-cache autoconf automake bash g++ gcc libtool make musl-dev nasm py3-pip python3-dev yasm zlib-dev && \
    wget -qO- "https://github.com/intel/isa-l/archive/refs/tags/v2.32.1.tar.gz" | tar -zx && \
    cd isa-l-* && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    wget -qO- "https://github.com/OpenGene/fastp/archive/refs/tags/v1.3.7.tar.gz" | tar -zx && \
    cd fastp-* && \
    make && \
    make install && \
    cd .. && \
    rm -rf fastp-* isa-l-*
