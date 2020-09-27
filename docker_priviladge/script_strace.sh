#!/bin/bash
#before
docker run --cap-add=SYS_PTRACE  -it ubuntu:18.04 /bin/bash
docker run --cap-add=SYS_PTRACE  -it centos /bin/bash
docker build -f Dockerfile1  -t centos:s1 .

# set change 4bc37059078a to another container
docker run -it --privileged=true--privileged=true 4bc37059078a bash
docker run -it --privileged=true  4bc37059078a bash
docker run -it --cap-add=SYS_PTRACE  4bc37059078a bash

