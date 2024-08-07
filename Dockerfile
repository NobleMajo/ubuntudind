FROM docker:dind-rootless as dind-source

FROM ubuntu:latest

LABEL version="1.3" maintainer="NobleMajo (Majo Richter) <majo@coreunit.net>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates iptables && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

COPY --from=dind-source /usr/local/bin/ /usr/local/bin/
COPY ./deamon.json /etc/docker/daemon.json

VOLUME /var/lib/docker
USER root

CMD ["dockerd"]
