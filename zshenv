# use vim the visual editor
export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER='less -r'
export TERM=screen-256color-bce
export LANG=ja_JP.UTF-8
export LESS='-r -N -s'
export BROWSER='google-chrome-stable'

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
