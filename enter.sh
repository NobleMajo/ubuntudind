#!/bin/bash

docker run -it --privileged --rm \
    --name ubuntu-dockerd-test \
    --network host \
    ubuntu-dockerd \
        bash