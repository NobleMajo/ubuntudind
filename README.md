# ubuntudind
The main focus of this project is to provide a ubuntu image with functional docker deamon.
You can use this image to run docker containers in a ubuntu container.

# control scripts
This control scripts should help you to understand how to use the image and container.
 - build.sh - build docker image
 - enter.sh - run a container with bash as entrypoint for image testing and debugging purposes
 - start.sh - run docker "test" container with network, volume and backup/cache mount to "./.store"
 - remove.sh - remove docker "test" container
 - exec.sh - runs a command in the "test" container and prints the output
 - test.sh - runs a nginx container that bind port 8080 in the "test" container and prints the output
