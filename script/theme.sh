#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

if [ $OSTYPE == "linux-gnu" ]; then
    # prerequisity
    sudo apt-get install dconf-cli
    # solarized colorscheme for gnome terminal
    gnome_name="gnome-terminal-colors-solarized"
    gnome_url="https://github.com/Anthony25/${gnome_name}"
    gnome_path="${project_dir}/${gnome_name}"
    git_clone_or_pull ${gnome_url} ${gnome_path}
    ./install.sh
    # fonts for powerline
    fonts_name="fonts"
    fonts_url="https://github.com/powerline/fonts/$fonts_name"
    fonts_path="${project_dir}/${fonts_name}"
    git_clone_or_pull ${fonts_url} ${fonts_path}
    ./install.sh
fi
