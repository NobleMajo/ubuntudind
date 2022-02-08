
[![](https://img.shields.io/docker/image-size/majo418/ubuntudind)](https://hub.docker.com/r/majo418/ubuntudind)
![CI](https://github.com/majo418/ubuntudind/workflows/Image/badge.svg)
![can't load images](https://img.shields.io/badge/dynamic/json?style=plastic&color=orange&label=UnixTime&query=unixtime&suffix=sec&url=http%3A%2F%2Fworldtimeapi.org%2Fapi%2Ftimezone%2FEtc%2FUTC)
![MIT](https://img.shields.io/badge/license-MIT-blue.svg)

![](https://img.shields.io/badge/dynamic/json?color=darkred&label=open%20issues&query=open_issues&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fmajo418%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=navy&label=forks&query=forks&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fmajo418%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=green&label=subscribers&query=subscribers_count&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fmajo418%2Fubuntudind)

# ubuntudind
|
[Docker Hub](https://hub.docker.com/r/majo418/ubuntudind)
|
[GitHub](https://github.com/majo418/ubuntudind)
|  
The main focus of this project is to provide a ubuntu image with functional docker deamon.
You can use this image to run docker containers in a ubuntu container.

# example commands
## pull image
```sh
docker push majo418/ubuntudind:latest
```
## start container
```sh
docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    ubuntudind:latest
```
## exec command
```sh
docker exec -it ubuntudind \
    docker ps
```
## test with nginx
```sh
docker exec -it ubuntudind \
    docker run -it --rm \
    --name test-nginx \
    -p 8080:80 \
    nginx
```
## remove container
```sh
docker rm -f ubuntudind
```
## run container persistently
```sh
docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    -v $(pwd)/.store:/var/lib/docker \
    ubuntudind:latest
```

# control scripts
This control scripts should help you to understand how to use the image and container.
 - build.sh - build docker image
 - enter.sh - run a container with bash as entrypoint for image testing and debugging purposes
 - start.sh - run docker "test" container with network, volume and backup/cache mount to "./.store"
 - remove.sh - remove docker "test" container
 - exec.sh - runs a command in the "test" container and prints the output
 - test.sh - runs a nginx container that bind port 8080 in the "test" container and prints the output

# contribution
 - 1. fork the project
 - 2. implement your idea
 - 3. create a pull/merge request
```ts
// please create seperated forks for different kind of featues/ideas/structure changes/implementations
```

---
**cya ;3**  
*by majo418*


