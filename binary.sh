#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/script/commons.sh"

# make binary directory for user
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

# copy binaries and make them executable
bin_path="$script_dir/bin"
for file in $(ls $bin_path); do
    if [ -e ~/bin/$file ]; then
        rm ~/bin/$file
    fi
    if [[ -f $bin_path/$file ]]; then
        cp $bin_path/$file ~/bin/$file
        chmod u+x ~/bin/$file
    fi
done

# url and path for git-open
gitopen_url="https://github.com/paulirish/git-open"
gitopen_path="$project_dir/git-open"
git_clone_or_pull $gitopen_url $gitopen_path
# remove old git-open if exists
if [ -e ~/bin/git-open ]; then
    rm ~/bin/git-open
fi
# copy git-open command and make it executable.
cp $gitopen_path/git-open ~/bin/git-open
chmod u+x ~/bin/git-open
