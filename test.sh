#!/bin/bash

./exec.sh \
    docker run -it --rm \
    --name test-nginx \
    -p 8080:80 \
    nginx