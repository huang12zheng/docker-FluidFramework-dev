# FROM node:12.20.0-alpine
FROM hzgood/docker-nvm-dev
LABEL name="fluid-dev"
LABEL version="build"

ARG USERNAME=/home/nvm

WORKDIR /$USERNAME
RUN git clone https://github.com/microsoft/FluidFramework.git
WORKDIR /$USERNAME/FluidFramework
RUN nvm install && nvm use
RUN npm install
RUN npm run build