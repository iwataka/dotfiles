#! /bin/bash

set -e

sudo -v

cd `dirname $0`

# Make directories vim needs
dirs="vim/backups vim/swaps vim/undo"
for dir in $dirs; do
    if [ ! -e $PWD/$dir ]; then
        mkdir $dir
    fi
done

# Make symbolic links to these files.
shell="aliases profile zshenv zshrc zsh_prompt"
vim="vim vimrc vimrc.bundles vimperatorrc"
scala="sbtrc"
misc="agignore ctags gitconfig spacemacs tmux.conf"

for file in $shell $vim $scala $misc; do
    if [ -L ~/.$file ]; then
        rm ~/.$file
    fi
    ln -s $PWD/$file ~/.$file
done

# chpwd
if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
    if [ ! -e ~/.cache/shell ]; then
        mkdir ~/.cache/shell
    fi
    touch ~/.cache/shell/chpwd-recent-dirs
fi

# neovim
if [ -L ~/.nvim ]; then
    rm ~/.nvim
fi
ln -s $PWD/vim ~/.nvim

if [ -L ~/.nvimrc ]; then
    rm ~/.nvimrc
fi
ln -s $PWD/vimrc ~/.nvimrc

if [ $OSTYPE == 'linux-gnu' ]; then
    sudo apt-get install git
    sudo apt-get install zsh
    sudo apt-get install exuberant-ctags
    sudo apt-get install tmux
    # youcompleteme
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev
    for o in $@; do
        if [ $o == '--java' ]; then
            sudo apt-get install openjdk-7-jdk
        fi
        if [ $o == '--scala' ]; then
            command -v scala > /dev/null 2>&1 || {
                SCALA_VERSION = '2.11.5'
                wget https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-2.11.5.deb
                sudo dpkg -i scala-${SCALA_VERSION}.deb
                rm -f scala-${SCALA_VERSION}.deb
            }
            command -v sbt > /dev/null 2>&1 || {
                SBT_VERSION = '0.13.7'
                wget https://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb
                sudo dpkg -i sbt-${SBT_VERSION}.deb
                rm -f sbt-${SBT_VERSION}.deb
            }
        fi
        if [ $o == '--ruby' ]; then
            msg = "Require gem command to install ruby packages" 
            command -v gem >/dev/null 2>&1 || { echo $msg >&2; exit 1;}
            sudo gem install bundler
            sudo gem install rubocop
        fi
        if [ $o == '--python' ]; then
            msg = "Require pip command to install python packages" 
            command -v pip >/dev/null 2>&1 || { echo $msg >&2; exit 1;}
        fi
    done
fi
