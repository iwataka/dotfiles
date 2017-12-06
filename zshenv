# use vim the visual editor
export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR=$VISUAL
if [[ "$OSTYPE" == "linux-musl" ]]; then
    export PAGER='less'
else
    export PAGER='less -r'
    export LESS='-r -N -s'
fi
export TERM=screen-256color-bce
# LANG depends on each environment
# export LANG=ja_JP.UTF-8

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
