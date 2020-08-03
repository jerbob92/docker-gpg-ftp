FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git-core \
    libncurses5-dev \
    libncursesw5-dev \
    zlib1g-dev \ 
    gnupg2 \
    lftp \
    zip && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN echo "set ssl:ca-file \"/etc/ssl/certs/ca-certificates.crt\"" >> /etc/lftp.conf
