#!/bin/bash

docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    -v $(pwd)/.store:/var/lib/docker \
    ubuntudind
