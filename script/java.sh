#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

if [ $OSTYPE == "linux-gnu" ]; then
    # Nop
fi
