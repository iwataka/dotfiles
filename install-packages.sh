#!/bin/bash

# Abort when errors are thrown
set -e

# Usage: git-clone-or-pull $url $path
git-clone-or-pull() {
    if [[ -d $2 ]]; then
        cd $2
        git pull
    else
        git clone https://github.com/$1 $2
    fi
}

# Usage: git-clone-if-not-exists $url $path [$command]
git-clone-if-not-exists() {
    if [[ ! -d $2 ]]; then
        git clone https://github.com/$1 $2
        cd $2
        if [[ $# > 2 ]]; then
            $3
        fi
    fi
}

# installs gnome-terminal-colors-solarized
install-gtcs() {
    local name=gnome-terminal-colors-solarized
    local path=~/projects/$name
    git-clone-if-not-exists Anthony25/$name ~/projects/$name ./install.sh
}

# Usage: install-oracle-java $version
# Following command must be run before executing this function.
# sudo add-apt-repository [-y] ppa:webupd8team/java
install-oracle-java() {
    sudo apt-get install oracle-java${1}-installer
    cd /usr/lib/jvm/java-${1}-oracle
    if [[ -e src.zip && ! -d src ]]; then
        sudo unzip -d src src.zip
    fi
}

if [ $OSTYPE == "linux-gnu" ]; then
    # update apt-get itself
    sudo apt-get update
    # upgrade packages
    sudo apt-get upgrade
    # install apt-add-repository command
    sudo apt-get install python-software-properties
    # xdg-open and so on
    sudo apt-get install xdg-utils
    # necessaary to clone various projects
    sudo apt-get install git
    # default shell
    sudo apt-get install zsh
    # must items
    sudo apt-get install curl
    sudo apt-get install wget
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
    sudo apt-get install monodevelop
    # build tool for JVM
    sudo apt-get install ant
    # used for install solarized colorscheme
    sudo apt-get install dconf-cli
    # Scala
    sudo apt-get install scala
    sudo apt-get install sbt
    # Java
    # If you want to switch other jdk, run this command:
    # sudo update-alternatives --config java
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get install openjdk-7-jdk
    install-oracle-java 8
    # gnome-terminal-colors-solarized
    install-gtcs
elif [[ $OSTYPE == "darwin"* ]]; then
    # Some sentences derived from https://github.com/mathiasbynens/dotfiles
    brew update
    brew upgrade
    # Install some other useful utilities like `sponge`.
    brew install moreutils
    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
    brew install findutils
    # Install GNU `sed`, overwriting the built-in `sed`.
    brew install gnu-sed --with-default-names
    brew install git
    brew install zsh
    brew install curl
    brew install wget --with-iri
    brew install vim --override-system-vi
    brew install imagemagick
    brew install tree
fi

git-clone-or-pull zsh-users/antigen ~/.antigen
git-clone-if-not-exists powerline/fonts ~/projects/fonts ./install.sh

# Scala
git-clone-if-not-exists scala/scala ~/projects/scala

# Ruby
git-clone-or-pull sstephenson/rbenv ~/.rbenv
git-clone-if-not-exists rubygems/rubygems ~/projects/rubygems 'sudo ruby setup.rb'
sudo gem install rubocop
sudo gem install bundler

# Python
git-clone-or-pull yyuu/pyenv ~/.pyenv
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo -H python
sudo -H pip install flake8
