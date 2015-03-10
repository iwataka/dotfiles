#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

# check if rubygem is installed
gem_installed=true
command -v gem >/dev/null 2>&1 || gem_installed=false

rubygem_path=$project_dir/rubygems
rubygem_url="https://github.com/rubygems/rubygems"
rbenv_path=$HOME/.rbenv
rbenv_url="https://github.com/sstephenson/rbenv.git"

if [ $OSTYPE == "linux-gnu" ]; then
    # RubyGem
    if [ $gem_installed == true ]; then
        cd $rubygem_path
        git pull
        sudo ruby ./setup.rb
    else
        git clone $rubygem_url $rubygem_path
        sudo ruby $rubygem_path/setup.rb
    fi

    # this bundles all ruby packages
    sudo gem install bundler
    # syntastic uses this when editing ruby
    sudo gem install rubocop

    # rbenv
    # if [ -d $HOME/.rbenv ]; then
    #     cd $rbenv_path
    #     git pull
    # else
    #     git clone $rbenv_url $rbenv_path
    # fi
fi
