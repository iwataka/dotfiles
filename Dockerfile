FROM frolvlad/alpine-glibc

RUN apk add --no-cache git bash
RUN git clone https://github.com/iwataka/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/setup.sh
RUN ~/.dotfiles/install-packages.sh
