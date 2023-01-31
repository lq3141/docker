FROM ubuntu:focal

# not necessary on linux host
#RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
#RUN sed 's|http://security.ubuntu.com|https://mirrors.aliyun.com|' /etc/apt/sources.list.bak > /etc/apt/sources.list
#RUN cp /etc/resolv.conf /etc/resolv.conf.bak
#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# https://github.com/phusion/baseimage-docker/issues/58
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y apt-utils

# below simplify jdk-11 installation
# ref:
#   https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image
#   https://dev.to/grigorkh/fix-tzdata-hangs-during-docker-image-build-4o9m
RUN TZ=Etc/UTC apt-get -y install tzdata

RUN apt install -y curl sudo

# the default nodejs on focal is 10.19, too old
#RUN apt install -y nodejs
#RUN apt install -y npm
# ref:
#   https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
#   https://github.com/nodesource/distributions
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt install -y nodejs

RUN apt install -y git git-lfs
RUN apt install -y vim tree

RUN apt install -y ninja-build
#RUN apt install -y openjdk-11-dbg
RUN apt install -y openjdk-11-jdk
RUN apt install -y ditaa
RUN apt install -y graphviz
RUN apt install -y imagemagick
RUN apt install -y python3 python3-pip

RUN pip install panflute

RUN npm i -g wavedrom-cli
RUN npm i -g @mermaid-js/mermaid-cli
#RUN npm i -g diagrams

COPY pandoc /opt/pandoc
COPY plantuml.jar /opt/jar/plantuml.jar

# no need to specify default entrypoint, looks like it's discouraged to use entrypoint
#
# ref:
#   + https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile
#   + https://zhuanlan.zhihu.com/p/143109114
#   + https://cwl.discourse.group/t/override-docker-entrypoint-in-command-line-tool/695
#
# below is how to use it when no default entrypoint
# sudo docker run --rm af6cc184a6f2 java /opt/jar/plantuml.jar -h
# sudo docker run --rm af6cc184a6f2 java -jar /opt/jar/plantuml.jar -h
# sudo docker run --rm -v /tmp/test:/data -it af6cc184a6f2 /bin/bash
#
#ENTRYPOINT ["java"]
#CMD ["-jar", "/opt/jar/plantuml.jar"]

