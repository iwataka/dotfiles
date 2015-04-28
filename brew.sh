#!/bin/bash

set -e

git-clone-or-pull() {
    if [[ -d $2 ]]; then
        cd $2
        git pull
    else
        git clone $1 $2
    fi
}

install-fonts() {
    local path=~/projects/fonts
    if [[ ! -d $path ]]; then
        git clone https://github.com/powerline/fonts $path
        cd $path
        ./install.sh
    fi
}

# gnome-terminal-colors-solarized
install-gtcs() {
    local name=gnome-terminal-colors-solarized
    local path=~/projects/$name
    if [[ ! -d $path ]]; then
        git clone https://github.com/Anthony25/$name $path
        cd $path
        ./install.sh
    fi
}

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
    # gnome-terminal-colors-solarized
    install-gtcs
fi

git-clone-or-pull https://github.com/sstephenson/rbenv ~/.rbenv
git-clone-or-pull https://github.com/yyuu/pyenv ~/.pyenv
git-clone-or-pull https://github.com/zsh-users/antigen ~/.antigen
install-fonts
