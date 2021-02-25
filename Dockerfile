FROM hzgood/docker-nvm-dev
LABEL name="fluid-dev"
LABEL version="latest"

ARG USERNAME=/home/nvm

WORKDIR /$USERNAME
ENV REFRESH_DATE 2021-02-25
RUN git clone https://github.com/microsoft/FluidFramework.git
WORKDIR /$USERNAME/FluidFramework
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm install                         && \
    nvm use'
#  && nvm install && nvm use
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm use                             && \
    npm install'
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm use                             && \
    npm run build:fast'
