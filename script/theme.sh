#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

if [ $OSTYPE == "linux-gnu" ]; then
    gnome_name="gnome-terminal-colors-solarized"
    gnome_url="https://github.com/Anthony25/$gnome_name"
    gnome_path="$project_dir/$gnome_name"
    git_clone_or_pull $gnome_url $gnome_path
    ./install.sh
fi
