#!/bin/bash
download_en=false

# pandoc 3.0
if [ "$download_en" = true ]; then
    wget https://github.com/jgm/pandoc/releases/download/3.0/pandoc-3.0-linux-amd64.tar.gz
    wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.15.0/pandoc-crossref-Linux.tar.xz
fi

tar zxf pandoc-3.0-linux-amd64.tar.gz
mv pandoc-3.0 pandoc
cd pandoc/bin
tar Jxf ../../pandoc-crossref-Linux.tar.xz
cd -

# plantuml
if [ "$download_en" = true ]; then
    wget https://github.com/plantuml/plantuml/releases/download/v1.2023.0/plantuml-1.2023.0.jar
fi
cp plantuml-1.2023.0.jar plantuml.jar

# depend
sudo docker pull minlag/mermaid-cli

# docker image
sudo docker build -t pandoc:v1 .
