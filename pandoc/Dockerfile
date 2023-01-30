FROM ubuntu:focal

# not necessary on linux host
#RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
#RUN sed 's|http://security.ubuntu.com|https://mirrors.aliyun.com|' /etc/apt/sources.list.bak > /etc/apt/sources.list
#RUN cp /etc/resolv.conf /etc/resolv.conf.bak
#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# https://github.com/phusion/baseimage-docker/issues/58
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install apt-utils -y

# below simplify jdk-11 installation
# ref:
#   https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image
#   https://dev.to/grigorkh/fix-tzdata-hangs-during-docker-image-build-4o9m
RUN TZ=Etc/UTC apt-get -y install tzdata

RUN apt install curl -y
RUN apt install sudo -y

# the default nodejs on focal is 10.19, too old
#RUN apt install nodejs -y
# ref:
#   https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
#   https://github.com/nodesource/distributions
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt install -y nodejs

RUN apt install git -y
RUN apt install git-lfs -y
RUN apt install ninja-build -y
#RUN apt install openjdk-11-dbg -y
RUN apt install openjdk-11-jre -y
RUN apt install npm -y
RUN apt install graphviz -y
RUN apt install ditaa -y
RUN apt install python3 -y
RUN apt install python3-pip -y

RUN pip install panflute

RUN npm i wavedrom-cli -g
