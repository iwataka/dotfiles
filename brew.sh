#!/bin/bash

set -e

git-clone-or-pull() {
    if [[ -d $2 ]]; then
        cd $2
        git pull
    else
        git clone https://github.com/$1 $2
    fi
}

git-clone-if-not-exists() {
    if [[ ! -d $2 ]]; then
        git clone https://github.com/$1 $2
        cd $2
        $3
    fi
}

# gnome-terminal-colors-solarized
install-gtcs() {
    local name=gnome-terminal-colors-solarized
    local path=~/projects/$name
    git-clone-if-not-exists Anthony25/$name ~/projects/$name ./install.sh
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

git-clone-or-pull sstephenson/rbenv ~/.rbenv
git-clone-or-pull yyuu/pyenv ~/.pyenv
git-clone-or-pull zsh-users/antigen ~/.antigen
git-clone-if-not-exists powerline/fonts ~/projects/fonts ./install.sh
git-clone-if-not-exists rubygems/rubygems ~/projects/rubygems 'ruby setup.rb'
sudo gem install rubocop
sudo gem install bundler
