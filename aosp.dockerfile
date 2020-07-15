FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y git-core gnupg flex bison gperf build-essential zip \
    curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev \
    libgl1-mesa-dev libxml2-utils xsltproc unzip openjdk-7-jdk python
 
 RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \
     chmod a+x /usr/bin/repo
 ENV OUT_DIR_COMMON_BASE=/aosp_output

