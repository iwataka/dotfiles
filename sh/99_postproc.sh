# shellcheck shell=sh

command -v start >/dev/null && alias open='start'
command -v xdg-open >/dev/null && alias open='xdg-open'
command -v wsl-open >/dev/null && alias open='wsl-open'
command -v cygstart >/dev/null && alias open='cygstart'

if command -v nvim >/dev/null; then
    alias vim='nvim'
    # NOTE: I use nvr until neovim's --remote-wait is implemented
    if [ -n "$NVIM" ] && command -v nvr >/dev/null; then
        export EDITOR="nvr --servername $NVIM +'set bufhidden=wipe' --remote-tab-wait"
        export VISUAL="$EDITOR"
    fi
fi

command -v eza >/dev/null && alias ls='eza'

command -v bat >/dev/null && alias cat='bat'
