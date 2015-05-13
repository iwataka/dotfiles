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
    sudo apt-get install -y oracle-java${1}-installer
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
    sudo apt-get install -y python-software-properties
    # xdg-open and so on
    sudo apt-get install -y xdg-utils
    # necessaary to clone various projects
    sudo apt-get install -y git
    # default shell
    sudo apt-get install -y zsh
    # must items
    sudo apt-get install -y curl
    sudo apt-get install -y wget
    # default editor
    sudo apt-get install -y vim
    # cooperate with vim
    sudo apt-get install -y tmux
    # tagbar and so on
    sudo apt-get install -y exuberant-ctags
    # faster code-searching tool
    sudo apt-get install -y silversearcher-ag
    # displays directory structure as a tree
    sudo apt-get install -y tree
    # tweak images
    sudo apt-get install -y imagemagick
    # code formatter for java, c and cpp
    sudo apt-get install -y astyle
    # youcompleteme
    sudo apt-get install -y build-essential cmake python-dev
    sudo apt-get install -y monodevelop
    # Markdown
    sudo apt-get install -y pandoc
    # build tool for JVM
    sudo apt-get install -y ant
    # Scala
    sudo apt-get install -y scala
    sudo apt-get install -y sbt
    # NodeJS
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    sudo npm -g install instant-markdown-d
    # Chrome
    sudo apt-get install google-chrome-stable
    # Java
    # If you want to switch other jdk, run this command:
    # sudo update-alternatives --config java
    # openjdk is currently unused
    # sudo apt-get install -y openjdk-7-jdk
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update
    install-oracle-java 8
    # used for install solarized colorscheme
    sudo apt-get install -y dconf-cli
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
# rbenv is for advanced rubyists
# git-clone-or-pull sstephenson/rbenv ~/.rbenv
git-clone-if-not-exists rubygems/rubygems ~/projects/rubygems 'sudo ruby setup.rb'
sudo gem install rubocop
sudo gem install bundler

# Python
# pyenv is for advanced pythonistas
# git-clone-or-pull yyuu/pyenv ~/.pyenv
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo -H python
sudo -H pip install flake8
