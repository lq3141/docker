FROM ubuntu:jammy
#RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
#RUN sed 's|http://security.ubuntu.com|https://mirrors.aliyun.com|' /etc/apt/sources.list.bak > /etc/apt/sources.list
#RUN cp /etc/resolv.conf /etc/resolv.conf.bak
#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN apt update
RUN apt install git -y
#RUN apt install git-lfs -y
RUN apt install ninja-build -y
RUN apt install openjdk-11-dbg -y
RUN apt install nodejs -y
RUN apt install npm -y
RUN apt install graphviz -y
RUN apt install ditaa -y
RUN apt install python3 -y
RUN apt install python3-pip -y

RUN pip install panflute
