FROM ubuntu:20.04

WORKDIR /app

RUN chmod -R 777 /app

RUN apt-get -qq update

ENV TZ Europe/Dublin
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq install -y curl git wget \
    python3 python3-pip \
    aria2 \
    ffmpeg mediainfo unzip p7zip-full p7zip-rar

RUN curl https://rclone.org/install.sh | bash

RUN apt-get install -y software-properties-common
RUN apt-get -y update

RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt-get install -y qbittorrent-nox

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
