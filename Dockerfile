FROM frolvlad/alpine-glibc
MAINTAINER iwataka

ARG user
RUN adduser -D ${user}
USER ${user}
RUN sudo apk add --no-cache git bash
RUN git clone https://github.com/iwataka/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/setup.sh
RUN ~/.dotfiles/install-packages.sh
