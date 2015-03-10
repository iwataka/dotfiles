#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

pyenv_url="https://github.com/yyuu/pyenv.git"
pyenv_path=$HOME/.pyenv

if [ $OSTYPE == "linux-gnu" ]; then
    # updates or installs python-pip
    sudo apt-get install python-pip

    # syntastic uses this when editing python
    sudo pip install flake8

    # pyenv
    # if [ -d $pyenv_path ]; then
    #     cd $pyenv_path
    #     git pull
    # else
    #     git clone $pyenv_url $pyenv_path
    # fi
fi

