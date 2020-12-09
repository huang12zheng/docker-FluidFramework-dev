FROM hzgood/docker-nvm-dev
LABEL name="fluid-dev"
LABEL version="latest"

ARG USERNAME=/home/nvm

WORKDIR /$USERNAME
RUN git clone https://github.com/microsoft/FluidFramework.git
WORKDIR /$USERNAME/FluidFramework
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm install                         && \
    nvm use'
#  && nvm install && nvm use
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm use                             && \
    npm install'
RUN git checkout -b client_v0.30.1
RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm use                             && \
    npm run build:fast -- --nolint @fluid-example/clicker'