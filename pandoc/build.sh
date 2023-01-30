
# pandoc 3.0
wget https://github.com/jgm/pandoc/releases/download/3.0/pandoc-3.0-linux-amd64.tar.gz
wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.15.0/pandoc-crossref-Linux.tar.xz

# docker image
docker build -t pandoc:v1 .
