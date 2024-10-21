#!/bin/bash

sudo apt update

if ! command -v docker &> /dev/null
then
    sudo apt install docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# PULL LATEST RSTUDO-SERVER.
docker pull rocker/rstudio:latest
docker run -d --restart unless-stopped -e PASSWORD="password!@#$" -p 8787:8787 rocker/rstudio:latest
