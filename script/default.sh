#!/bin/bash

# this directory
# script_dir=$(cd `dirname $0` && pwd)
# source common settings
# source "$script_dir/commons.sh"

if [ $OSTYPE == "linux-gnu" ]; then
    # necessaary to clone various projects
    sudo apt-get install git
    # mainly clone openjdk
    sudo apt-get install mercurial
    # default shell
    sudo apt-get install zsh
    # default editor
    sudo apt-get install vim
    # cooperate with vim
    sudo apt-get install tmux
    # tagbar and so on
    sudo apt-get install exuberant-ctags
    # default font
    sudo apt-get install fonts-inconsolata
    # youcompleteme
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev
fi