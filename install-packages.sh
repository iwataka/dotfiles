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

if [ $OSTYPE == "linux-gnu" ]; then
    # update apt-get itself
    sudo apt-get update
    # upgrade packages
    sudo apt-get upgrade
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
    # Markdown
    sudo apt-get install -y pandoc
elif [[ $OSTYPE == "darwin"* ]]; then
    # Some sentences derived from https://github.com/mathiasbynens/dotfiles
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
    brew install pandoc
    # Remove outdated versions from the cellar.
    brew cleanup
fi

git-clone-or-pull zsh-users/antigen ~/.antigen
git-clone-if-not-exists powerline/fonts ~/projects/fonts ./install.sh
