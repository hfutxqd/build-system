FROM ubuntu:16.04

# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
#     sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

WORKDIR /lede

RUN apt-get update && \
    apt-get -y install build-essential \ 
    asciidoc binutils bzip2 gawk gettext \ 
    git libncurses5-dev libz-dev patch \ 
    unzip zlib1g-dev lib32gcc1 \ 
    libc6-dev-i386 subversion flex \
    uglifyjs git-core gcc-multilib \
    p7zip p7zip-full msmtp libssl-dev \
    texinfo libglib2.0-dev xmlto qemu-utils \
    upx libelf-dev autoconf automake \
    libtool autopoint device-tree-compiler

RUN git clone https://github.com/coolsnowwolf/lede


RUN apt-get -y install wget curl

WORKDIR /lede/lede

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

RUN apt-get -y install vim

# Cleanup
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* > /dev/null 2>&1

ENV FORCE_UNSAFE_CONFIGURE=1
