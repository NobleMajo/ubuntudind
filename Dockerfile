FROM docker:dind-rootless as dind-source

FROM ubuntu:latest

LABEL version="1.3" maintainer="NobleMajo (Majo Richter) <majo@coreunit.net>"

COPY --from=dind-source /usr/local/bin/ /usr/local/bin/
COPY ./deamon.json /etc/docker/daemon.json

VOLUME /var/lib/docker
USER root

CMD ["dockerd"]
