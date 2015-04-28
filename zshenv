# use vim the visual editor
export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER='less -r'
export TERM=screen-256color-bce
export LANG=ja_JP.UTF-8

if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOROOT=$HOME/go
    export PATH=$PATH:$GOROOT/bin
fi

if [ -d /usr/local/idea ]; then
    export IDEA_HOME=/usr/local/idea
    export PATH=$PATH:$IDEA_HOME/bin
fi

if [ -d /usr/local/eclipse ]; then
    export ECLIPSE_HOME=/usr/local/eclipse
    export PATH=$PATH:$ECLIPSE_HOME
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
