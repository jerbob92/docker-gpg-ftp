FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git-core \
    libncurses5-dev \
    libncursesw5-dev \
    zlib1g-dev \ 
    gnupg2 \
    zip \
    autoconf \
    libtool \
    gettext \
    automake \
    libreadline-dev \
    pkg-config \
    libgnutls28-dev \
    gnulib && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN curl -L "https://github.com/lavv17/lftp/archive/v4.9.1.tar.gz" --output v4.9.1.tar.gz && \
    tar -zxvf v4.9.1.tar.gz && \
    cd lftp-4.9.1 && \
    ./autogen.sh && \
    sed -i "s/GETTEXT_MACRO_VERSION = .*/GETTEXT_MACRO_VERSION = 0.20/g" po/Makefile.in.in && \
    make && \
    make install

RUN echo "set ssl:ca-file \"/etc/ssl/certs/ca-certificates.crt\"" >> /etc/lftp.conf
