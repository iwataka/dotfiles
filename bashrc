# shellcheck shell=bash

# shellcheck disable=SC1090
source "$HOME"/.shrc
alias ..='cd ..'

# shellcheck disable=SC1090
test -f "$HOME"/.fzf.bash && source "$HOME"/.fzf.bash

# shellcheck disable=SC1090
test -f "$HOME"/.bashrc.local && source "$HOME"/.bashrc.local
