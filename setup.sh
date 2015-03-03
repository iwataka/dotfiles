#! /bin/bash

# abort if error occurs
set -e

# ask for user password
sudo -v

# get the directory of this script
script_dir=`dirname $0`
expr "${0}" : "/.*" > /dev/null || script_dir=`(cd "${script_dir}" && pwd)`

# Make directories vim needs
mkdirs() {
    local dirs="vim/backups vim/swaps vim/undo"
    local dir
    for dir in $dirs; do
        if [ ! -e $script_dir/$dir ]; then
            mkdir $dir
        fi
    done
}

# Make symbolic links.
mklinks() {
    local shell="aliases profile zshenv zshrc zsh_prompt"
    local vim="vim vimrc vimrc.bundles vimperatorrc"
    local scala="sbtrc"
    local misc="agignore ctags gitconfig spacemacs tmux.conf"
    local file
    for file in $shell $vim $scala $misc; do
        if [ -L ~/.$file ]; then
            rm ~/.$file
        fi
        ln -s $script_dir/$file ~/.$file
    done
    # neovim
    for file in vim vimrc; do
        if [ -L ~/.n${file} ]; then
            rm ~/.n${file}
        fi
        ln -s $script_dir/$file ~/.n${file}
    done
}

# chpwd
mkfile() {
    if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
        if [ ! -e ~/.cache/shell ]; then
            mkdir ~/.cache/shell
        fi
        touch ~/.cache/shell/chpwd-recent-dirs
    fi
}

install_java_ubuntu() {
    sudo apt-get install ant
    sudo apt-get install openjdk-7-jdk
}

install_scala_ubuntu() {
    install_java_ubuntu
    if [ ! -d ~/projects/scala ]; then
        git clone https://github.com/scala/scala ~/projects/scala
        cd ~/project/scala
        ant build-opts
    fi
    if [ ! -e /etc/apt/sources.list.d/sbt.list ]; then
        local text = "deb https://dl.bintray.com/sbt/debian "
        echo $text | sudo tee -a /etc/apt/sources.list.d/sbt.list
    fi
    command -v sbt > /dev/null 2>&1 || {
        sudo apt-get update
        sudo apt-get install sbt
    }
}

install_ruby_ubuntu() {
    command -v gem >/dev/null 2>&1 || {
        git clone https://github.com/rubygems/rubygems ~/projects/rubygems
        sudo ruby ~/projects/rubygems/setup.rb
    }
    sudo gem install bundler
    sudo gem install rubocop
}

install_python_ubuntu() {
    local msg = "Require pip command to install python packages"
    command -v pip >/dev/null 2>&1 || { echo $msg >&2; exit 1;}
    sudo pip install flake8
}

install_ubuntu() {
    sudo apt-get install git
    sudo apt-get install zsh
    sudo apt-get install exuberant-ctags
    sudo apt-get install tmux
    # youcompleteme
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev
}

mkdirs
mklinks
mkfile

if [ $OSTYPE == 'linux-gnu' ]; then
    install_ubuntu
    for o in $@; do
        case $o in
            '--java' ) install_java_ubuntu ;;
            '--scala' ) install_scala_ubuntu ;;
            '--ruby' ) install_ruby_ubuntu ;;
            '--python' ) install_python_ubuntu ;;
        esac
    done
fi
