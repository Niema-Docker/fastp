# Minimal Docker image for fastp using Alpine base
FROM alpine:latest

# install fastp
RUN apk update && \
    apk add --no-cache bash g++ make zlib-dev && \
    wget -qO- "https://github.com/OpenGene/fastp/archive/refs/tags/v1.3.7.tar.gz" | tar -zx && \
    cd fastp-* && \
    make && \
    make install && \
    cd .. && \
    rm -rf fastp-*
