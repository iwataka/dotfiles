# use vim the visual editor
export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER='less -r'
export TERM=screen-256color-bce
export LANG=ja_JP.UTF-8

if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOROOT=$HOME/go
    export PATH=$PATH:$GOROOT/bin
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
