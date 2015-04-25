#!/bin/bash

set -e

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

install-java() {
    install-java-deps
    local open=$(open-command)
    $open "www.oracle.com/technetwork/java/javase/downloads/index.html"
}

install-java-deps() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        sudo apt-get install ant
    fi
}

install-scala() {
    local path=/usr/local/scala
    if [[ ! -d $path ]]; then
        sudo git clone https://github.com/scala/scala $path
        cd $path
        ant build-opt
    fi
    local open=$(open-command)
    $open http://www.scala-sbt.org/download.html
}

install-ruby() {
    install-ruby-deps
    sudo gem install bundler rubocop
    git clone https://sstephenson/rbenv ~/.rbenv
}

install-ruby-deps() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        sudo apt-get install rubygems-integration
    fi
}

install-python() {
    install-python-deps
    sudo pip install flake8
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
}

install-python-deps() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        sudo apt-get install python-pip
    fi
}

install-go() {
    local open=$(open-command)
    $open "https://golang.org/doc/install"
}

install-antigen() {
    local path=$HOME/.antigen
    if [[ ! -d $path ]]; then
        git clone https://github.com/zsh-users/antigen $path
    fi
}

install-neovim() {
    local path=$HOME/projects/neovim
    if [[ ! -d $path ]]; then
        install-neovim-deps
        git clone https://github.com/neovim/neovim $path
        cd $path
        make install
    fi
}

install-neovim-deps() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        sudo apt-get install libtool libtool-bin autoconf automake cmake
        sudo apt-get install libncurses5--dev g++ pkg-config unzip
    fi
}

install-theme() {
    install-theme-deps
    local name=gnome-terminal-colors-solarized
    local path=$HOME/projects/$name
    git clone https://github.com/Anthony25/$name $path
    cd $path
    ./install.sh
}

install-theme-deps() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        sudo apt-get install dconf-cli
    fi
}

install-font() {
    local path=$HOME/projects/fonts
    git clone https://github.com/powerline/fonts $path
    cd $path
    ./install.sh
}

install-idea() {
    local open=$(open-command)
    $open https://www.jetbrains.com/idea/download/
}

for target in $@; do
    install-$target
done
