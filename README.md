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
  - [Own docker sock](#own-docker-sock)
  - [Host sock](#host-sock)
  - [Exec commands](#exec-commands)
  - [Nginx example](#nginx-example)
  - [Persistent data](#persistent-data)
- [Control Scripts](#control-scripts)
- [Contributing](#contributing)
- [License](#license)
- [Disclaimer](#disclaimer)

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
docker push noblemajo/ubuntudind
```
## Own docker sock
Start the container as self hosting docker instance:
```sh
docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    noblemajo/ubuntudind
```
## Host sock
You can also mount the host docker socket into the container:
```sh
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    noblemajo/ubuntudind \
        docker ps
```
## Exec commands
```sh
docker exec -it ubuntudind \
    docker ps
```
## Nginx example
```sh
docker exec -it ubuntudind \
    docker run -it --rm \
    --name test-nginx \
    -p 8080:80 \
    nginx
```
Don't forget to remove it:
```sh
docker rm -f ubuntudind
```
## Persistent data
The container data need to be mounted for persistency:
```sh
docker run -d --privileged \
    --restart unless-stopped \
    --name ubuntudind \
    --network host \
    -v $(pwd)/.store:/var/lib/docker \
    noblemajo/ubuntudind
```

# Control Scripts
This control scripts should help you to understand how to use the image and container.
 - build.sh - build docker image
 - enter.sh - run a container with bash as entrypoint for image testing and debugging purposes
 - start.sh - run docker "test" container with network, volume and backup/cache mount to "./.store"
 - remove.sh - remove docker "test" container
 - exec.sh - runs a command in the "test" container and prints the output
 - test.sh - runs a nginx container that bind port 8080 in the "test" container and prints the output

# Contributing
Contributions to Ubuntudind are welcome!  
Interested users can refer to the guidelines provided in the [CONTRIBUTING.md](CONTRIBUTING.md) file to contribute to the project and help improve its functionality and features.

# License
Ubuntudind is licensed under the [MIT license](LICENSE), providing users with flexibility and freedom to use and modify the software according to their needs.

# Disclaimer
Ubuntudind is provided without warranties.  
Users are advised to review the accompanying license for more information on the terms of use and limitations of liability.
