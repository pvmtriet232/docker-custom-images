FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y wget build-essential libffi-dev zlib1g-dev libssl-dev

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz && \
    tar -xJf Python-3.9.16.tar.xz

WORKDIR /tmp/Python-3.9.16
RUN ./configure && \
    make && \
    make install

RUN python3.9 --version

RUN rm -rf /tmp/Python-3.9.16* && \
    apt-get clean
