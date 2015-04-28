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
fi

open-command() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        echo "xdg-open"
    elif [[ $OSTYPE == "darwin" ]]; then
        echo "open"
    elif [[ $OSTYPE == "cygwin" ]]; then
        echo "cygstart"
    else
        echo "start"
    fi
}

# oracle-java
$(open-command) "http://www.oracle.com/technetwork/java/javase/downloads/index.html"

# scala
install-scala() {
    local path=/usr/local/scala
    if [[ -d $path ]]; then
        cd $path
        sudo git pull
    else
        sudo git clone https://github.com/scala/scala $path
    fi
}

# sbt
$(open-command) http://www.scala-sbt.org/download.html

# go
$(open-command) "https://golang.org/doc/install"

# idea
$(open-command) https://www.jetbrains.com/idea/download/

# rbenv
install-rbenv() {
    local path=$HOME/.rbenv
    if [[ ! -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://sstephenson/rbenv $path
    fi
}

# pyenv
install-pyenv() {
    local path=$HOME/.pyenv
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/yyuu/pyenv.git $path
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

install-neovim() {
    local path=$HOME/projecs/neovim
    if [[ -d $path ]]; then
        cd $path
        git pull
    else
        git clone https://github.com/neovim/neovim $path
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

install-git-open() {
    local path=$HOME/projects/git-open
    if [[ ! -d $path ]]; then
        git clone https://github.com/paulirish/git-open $path
    else
        cd $path
        git pull
    fi
    # Remove old git-open if exists
    if [ -e ~/bin/git-open ]; then
        rm ~/bin/git-open
    fi
    # Copy git-open file and make it executable.
    cp $path/git-open ~/bin/git-open
    chmod u+x ~/bin/git-open
}

install-antigen
install-neovim
install-gnome-terminal-colors-solarized
install-poweline-fonts
install-git-open
