FROM python:3.7
RUN sed -i 's/deb.debian.org/mirrors.163.com/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|mirrors.163.com/debian-security|g' /etc/apt/sources.list

RUN pip install -i https://mirrors.aliyun.com/pypi/simple pip -U && \
    pip config set global.index-url https://mirrors.aliyun.com/pypi/simple

