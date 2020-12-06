FROM node:12.20.0-alpine
# LABEL Name=dockernvm Version=0.0.1
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update &&\
    apk --update add git less openssh && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
WORKDIR /root
RUN git clone https://github.com/microsoft/FluidFramework.git
WORKDIR /root/FluidFramework

RUN npm install
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*