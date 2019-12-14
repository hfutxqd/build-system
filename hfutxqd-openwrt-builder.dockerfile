FROM ubuntu:16.04

# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
#     sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

ENV FORCE_UNSAFE_CONFIGURE=1

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
    libtool autopoint device-tree-compiler \
    wget curl vim

RUN git clone https://github.com/hfutxqd/openwrt-leans

WORKDIR /lede/openwrt-leans

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

RUN make defconfig
RUN sed -i 's/# CONFIG_ALL .*/CONFIG_ALL=y/' .config && \
    sed -i 's/# CONFIG_TARGET_ipq40xx .*/CONFIG_TARGET_ipq40xx=y/' .config && \
    sed -i 's/# CONFIG_TARGET_ipq40xx_Default .*/CONFIG_TARGET_ipq40xx_Default=y/' .config
RUN make defconfig && make download -j8

# Cleanup
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* > /dev/null 2>&1

