#!/bin/bash

docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntu-dockerd \
    --network host \
    -v $(pwd)/.store:/var/lib/docker \
    ubuntu-dockerd
