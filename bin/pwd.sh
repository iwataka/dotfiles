#!/usr/bin/env bash

if [[ ! -d ~/lib/pwd.sh ]]
then
    git clone https://github.com/drduh/pwd.sh ~/lib/pwd.sh
fi

~/lib/pwd.sh/pwd.sh "$@"
