FROM docker:latest as docker

FROM ubuntu:20.04

LABEL version="1.0" maintainer="Majo Richter <majo@coreunit.net>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        lxc \
        iptables \
        gnupg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*

COPY --from=docker /usr/local/bin/ /usr/local/bin/
COPY ./deamon.json /etc/docker/daemon.json

VOLUME /var/lib/docker

CMD ["dockerd"]