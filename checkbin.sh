#!/bin/bash

echo "Source:"
docker run -it --rm \
    docker:latest \
        ls -al /usr/local/bin/

echo "Build:"
docker run -it --rm \
    ubuntudind \
        ls -al /usr/local/bin/
