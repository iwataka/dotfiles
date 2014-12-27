# use vim the visual editor
export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR=$VISUAL

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
