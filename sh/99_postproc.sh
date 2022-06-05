# shellcheck shell=sh

command -v start >/dev/null && alias open='start'
command -v xdg-open >/dev/null && alias open='xdg-open'
command -v wsl-open >/dev/null && alias open='wsl-open'
command -v cygstart >/dev/null && alias open='cygstart'

command -v nvim >/dev/null && \
    alias vim='nvim' && \
    export VISUAL=nvim && \
    export EDITOR=$VISUAL

command -v exa >/dev/null && alias ls='exa'

command -v bat >/dev/null && alias cat='bat'
