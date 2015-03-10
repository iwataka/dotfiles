#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

openjdk_version=7
openjdk_name="openjdk-"${openjdk_version}"-jdk"
openjdk_path=$project_dir/$openjdk_name
openjdk_url="http://hg.openjdk.java.net/jdk"${openjdk_version}"/jdk"${openjdk_version}"/jdk"

if [ $OSTYPE == "linux-gnu" ]; then
    sudo apt-get install ant
    sudo apt-get install $openjdk_name

    # updates if openjdk exists, otherwise clones it
    if [ -d $openjdk_path ]; then
        cd $openjdk_path
        hg pull
    else
        hg clone $openjdk_url $openjdk_path
    fi
fi
