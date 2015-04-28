#!/bin/bash

set -e

if [ $OSTYPE == "linux-gnu" ]; then
    sudo apt-get update && sudo apt-get upgrade
    # xdg-open and so on
    sudo apt-get install xdg-utils
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
    # faster code-searching tool
    sudo apt-get install silversearcher-ag
    # displays directory structure as a tree
    sudo apt-get install tree
    # tweak images
    sudo apt-get install imagemagick
    # code formatter for java, c and cpp
    sudo apt-get install astyle
    # youcompleteme
    sudo apt-get install build-essential cmake python-dev
    # neovim
    sudo apt-get install libtool autoconf automake cmake
    sudo apt-get install g++ pkg-config unzip
    # build tool for JVM
    sudo apt-get install ant
    # used for install solarized colorscheme
    sudo apt-get install dconf-cli
    # Scala
    sudo apt-get install scala
    sudo apt-get install sbt
    # Java
    sudo apt-get install openjdk-7-jdk
fi

# rbenv
install-rbenv() {
    local path=$HOME/.rbenv
    if [[ ! -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/sstephenson/rbenv $path
    fi
}

# pyenv
install-pyenv() {
    local path=$HOME/.pyenv
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/yyuu/pyenv $path
    fi
}

install-antigen() {
    local path=$HOME/.antigen
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/zsh-users/antigen $path
    fi
}

# gnome-terminal-colors-solarized
install-gnome-terminal-colors-solarized() {
    local name=gnome-terminal-colors-solarized
    local path=$HOME/projects/$name
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/Anthony25/$name $path
        cd $path
        ./install.sh
    fi
}

install-poweline-fonts() {
    local path=$HOME/projects/fonts
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/powerline/fonts $path
        cd $path
        ./install.sh
    fi
}

install-antigen
install-gnome-terminal-colors-solarized
install-poweline-fonts
