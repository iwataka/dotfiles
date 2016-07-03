#!/bin/bash

# Abort when errors are thrown
set -e

uname_ostype=$(uname -a)

install-for-arch-linux() {
    sudo pacman -Syu --noconfirm --needed
    sudo pacman -S --noconfirm --needed coreutils
    sudo pacman -S --noconfirm --needed moreutils
    sudo pacman -S --noconfirm --needed git
    sudo pacman -S --noconfirm --needed zsh
    sudo pacman -S --noconfirm --needed curl
    sudo pacman -S --noconfirm --needed wget
    sudo pacman -S --noconfirm --needed tmux
    sudo pacman -S --noconfirm --needed ctags
    sudo pacman -S --noconfirm --needed tree
    sudo pacman -S --noconfirm --needed imagemagick
    sudo pacman -S --noconfirm --needed astyle
    sudo pacman -S --noconfirm --needed cmake
    sudo pacman -S --noconfirm --needed docker
    sudo pacman -S --noconfirm --needed glances
    sudo pacman -S --noconfirm --needed vim
    sudo yaourt -S --noconfirm --needed pandoc
    sudo yaourt -S --noconfirm --needed shellcheck
}

install-for-ubuntu() {
    sudo apt-get update  # Update apt-get itself
    sudo apt-get upgrade  # Upgrade packages
    sudo apt-get install -y xdg-utils
    sudo apt-get install -y git
    sudo apt-get install -y zsh
    sudo apt-get install -y curl
    sudo apt-get install -y wget
    sudo apt-get install -y tmux
    sudo apt-get install -y exuberant-ctags
    sudo apt-get install -y tree
    sudo apt-get install -y imagemagick
    sudo apt-get install -y astyle
    sudo apt-get install -y cmake
    sudo apt-get install -y pandoc
    sudo apt-get install -y shellcheck
    sudo apt-get install -y docker
    sudo apt-get install -y glances
    sudo apt-get install -y xsel
    sudo apt-get install -y ibus-mozc
    sudo apt-get install -y uswsusp
}

install-for-alpine-linux() {
    apk add --no-cache git
    apk add --no-cache vim
    apk add --no-cache zsh
    apk add --no-cache perl
}

install-for-osx() {
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
    brew install tree
    brew install imagemagick --with-webp
    brew install astyle
    brew install cmake
    brew install pandoc
    brew install shellcheck
    brew install docker
    brew cleanup  # Remove outdated versions from the cellar.
}

install-for-cygwin() {
    apt-cyg update
    apt-cyg install git
    apt-cyg install zsh
    apt-cyg install curl
    apt-cyg install wget
    apt-cyg install vim
    apt-cyg install tmux
    apt-cyg install tree
    apt-cyg install ImageMagick
}

install-default() {
    if [[ $uname_ostype == "Linux Arch-Linux"* ]]; then
        install-for-arch-linux
    elif [ $OSTYPE == "linux-gnu" ]; then
        install-for-ubuntu
    elif [ $OSTYPE == "linux-musl" ]; then
        install-for-alpine-linux
    elif [[ $OSTYPE == "darwin"* ]]; then
        install-for-osx
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        install-for-cygwin
    fi
}

install-gvm() {
    if [ "$OSTYPE" == "linux-musl" ]; then
        apk add --no-cache curl git mercurial make binutils bison gcc g++
    elif [ "$OSTYPE" == "linux-gnu" ]; then
        sudo apt-get curl git mercurial make binutils bison gcc build-essential
    fi
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
}

install-default

for arg in "$@"; do
    if [ "$arg" == "go" ]; then
        install-gvm
    fi
    shift
done
