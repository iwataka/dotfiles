#!/bin/bash

# Abort when errors are thrown
set -e

if [ $OSTYPE == "linux-gnu" ]; then
    sudo apt-get update  # Update apt-get itself
    sudo apt-get upgrade  # Upgrade packages
    sudo apt-get install -y xdg-utils
    sudo apt-get install -y git
    sudo apt-get install -y zsh
    sudo apt-get install -y curl
    sudo apt-get install -y wget
    sudo apt-get install -y vim
    sudo apt-get install -y tmux
    sudo apt-get install -y exuberant-ctags
    sudo apt-get install -y silversearcher-ag
    sudo apt-get install -y tree
    sudo apt-get install -y imagemagick
    sudo apt-get install -y astyle
    sudo apt-get install -y build-essential cmake python-dev  # YouCompleteMe
    sudo apt-get install -y pandoc
    sudo apt-get install -y shellcheck
    sudo apt-get install -y docker
    sudo apt-get install -y glances
elif [[ $OSTYPE == "darwin"* ]]; then
    # Some of them from https://github.com/mathiasbynens/dotfiles
    brew update
    brew upgrade --all
    # Install GNU core utilities (those that come with OS X are outdated)
    # Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
    brew install coreutils
    sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
    # Install some other useful utilities like `sponge`.
    brew install moreutils
    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
    brew install findutils
    # Install GNU `sed`, overwriting the built-in `sed`.
    brew install gnu-sed --with-default-names
    brew install rename
    brew install git
    brew install zsh
    brew install curl
    brew install wget --with-iri
    brew install vim --override-system-vi --enable -interop=python,python3
    brew install macvim
    brew install tmux
    brew install ctags-exuberant
    brew install the_silver_searcher
    brew install tree
    brew install imagemagick --with-webp
    brew install astyle
    brew install cmake
    brew install pandoc
    brew install shellcheck
    brew install docker
    brew cleanup  # Remove outdated versions from the cellar.
elif [[ "$OSTYPE" == "cygwin" ]]; then
    apt-cyg update
    apt-cyg install git
    apt-cyg install zsh
    apt-cyg install curl
    apt-cyg install wget
    apt-cyg install vim
    apt-cyg install tmux
    apt-cyg install tree
    apt-cyg install ImageMagick
fi

git clone https://github.com/zsh-users/antigen ~/.antigen
