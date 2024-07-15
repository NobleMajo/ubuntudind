# ubuntudind
![Docker](https://img.shields.io/docker/image-size/noblemajo/ubuntudind)
![CI/CD](https://github.com/noblemajo/ubuntudind/workflows/Image/badge.svg)
![MIT](https://img.shields.io/badge/license-MIT-blue.svg)

![](https://img.shields.io/badge/dynamic/json?color=green&label=watchers&query=watchers&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnoblemajo%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=yellow&label=stars&query=stargazers_count&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnoblemajo%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=orange&label=subscribers&query=subscribers_count&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnoblemajo%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=navy&label=forks&query=forks&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnoblemajo%2Fubuntudind)
![](https://img.shields.io/badge/dynamic/json?color=darkred&label=open%20issues&query=open_issues&suffix=x&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnoblemajo%2Fubuntudind)

# table of contents
- [ubuntudind](#ubuntudind)
- [table of contents](#table-of-contents)
- [about](#about)
- [example commands](#example-commands)
  - [pull image](#pull-image)
  - [self hosted docker deamon](#self-hosted-docker-deamon)
  - [host shared docker socket](#host-shared-docker-socket)
  - [exec command](#exec-command)
  - [test with nginx](#test-with-nginx)
  - [remove container](#remove-container)
  - [run container persistently](#run-container-persistently)
- [scripts](#scripts)
  - [tags](#tags)
- [control scripts](#control-scripts)
- [contribution](#contribution)

# about
|
[Docker Hub](https://hub.docker.com/r/noblemajo/ubuntudind)
|
[GitHub](https://github.com/noblemajo/ubuntudind)
|  
The main focus of this project is to provide a ubuntu image with functional docker deamon.
You can use this image to run docker containers in a ubuntu container.

This container needs the '--privileged' flag to run!
This gives extended privileges to this container.

# example commands
## pull image
```sh
docker push noblemajo/ubuntudind:latest
```
## self hosted docker deamon
Start the container as self hosting docker instance.
```sh
docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    noblemajo/ubuntudind:latest
```
## host shared docker socket
Mount the host docker socket into the container 
```sh
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    noblemajo/ubuntudind:22.04 \
        docker ps
```
## exec command
```sh
docker exec -it noblemajo/ubuntudind \
    docker ps
```
## test with nginx
```sh
docker exec -it noblemajo/ubuntudind \
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
    noblemajo/ubuntudind:latest
```

# scripts
Checkout the script folder for more usage examples.

## tags
Build from newest ubuntu lts versions and latest:
 - `ubuntu:latest`
 - `ubuntu:24.04`
 - `ubuntu:22.04`
 - `ubuntu:20.04`
 - `ubuntu:18.04`

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
*by noblemajo*
