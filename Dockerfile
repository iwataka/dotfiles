FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y vim git zsh build-essential python-dev cmake curl
RUN git clone https://github.com/iwataka/dotfiles ~/dotfiles
RUN cd ~/dotfiles && ./setup.sh
