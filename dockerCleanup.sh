#!/usr/bin/env bash


docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker container ls
docker rmi $(docker images -q)
docker images ls
