FROM ubuntu:18.04

WORKDIR /openwrt

RUN apt-get update && apt-get install -y subversion g++ zlib1g-dev build-essential git python python3 \
    libncurses5-dev gawk gettext unzip file libssl-dev wget \
    libelf-dev ecj fastjar java-propose-classpath \
    build-essential libncursesw5-dev python unzip

RUN git clone -b exp https://github.com/LGA1150/openwrt.git

WORKDIR /openwrt/openwrt

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

