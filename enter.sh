#!/bin/bash

docker run -it --privileged --rm \
    --name ubuntudind-test \
    --network host \
    ubuntudind \
        bash