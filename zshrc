#---------------------------------------------------------------
# Source various files
#---------------------------------------------------------------
if test -s "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"; then
    . "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh" > /dev/null
fi
# Fix tmux problem in Cygwin
if test "$OSTYPE" = "cygwin"; then
    if test ! -d /tmp/tmux-0000; then
        mkdir /tmp/tmux-0000
    fi
    rm -rf /tmp/tmux-*
fi

. ~/.shrc
for f in $HOME/.zsh/*.zsh
do
    . "$f"
done

if test -d $HOME/.anyenv; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi
if test -d $HOME/.anyvm; then
    export PATH="$HOME/.anyvm/bin:$PATH"
    eval "$(anyvm init -)"
fi
if test -d $HOME/.rbenv; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
if test -d $HOME/.pyenv; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
if test -d $HOME/.jenv; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

if test -d $HOME/go && test $(which gvm) = ""; then
    export PATH=$PATH:$HOME/go/bin
    export GOPATH=$HOME/go
fi

if test -d $HOME/.gradle; then
    export PATH=$PATH:$HOME/.gradle/bin
fi

if test -d $HOME/lib/haxe/std; then
    export HAXE_STD_PATH=$HOME/lib/haxe/std
fi

if test -d $HOME/.cargo/bin; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

if [[ "$OSTYPE" =~ darwin* ]] && which brew >/dev/null 2>&1; then
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

if test -d $HOME/.ghcup/bin; then
    export PATH=$HOME/.ghcup/bin:$PATH
fi

if test -d $HOME/.local/bin; then
    export PATH=$HOME/.local/bin:$PATH
fi

### Added by the Heroku Toolbelt
if test -d /usr/local/heroku/bin; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

if kompose > /dev/null 2>&1; then
    . <(kompose completion zsh)
fi

if test -d $HOME/bin; then
    export PATH=$HOME/bin:$PATH
fi

test -s "$HOME"/.gvm/scripts/gvm && . "$HOME"/.gvm/scripts/gvm
test -s "$HOME"/.nvm/nvm.sh && . "$HOME"/.nvm/nvm.sh
test -s "$HOME"/.dnx/dnvm/dnvm.sh && . "$HOME"/.dnx/dnvm/dnvm.sh
test -s "$HOME"/.rsvm/rsvm.sh && . "$HOME"/.rsvm/rsvm.sh
test -f "$HOME"/.fzf.zsh && . "$HOME"/.fzf.zsh
test -f "$HOME"/.travis/travis.sh && . "$HOME"/.travis/travis.sh
test -f "$HOME"/google-cloud-sdk/path.zsh.inc && . "$HOME"/google-cloud-sdk/path.zsh.inc
test -f "$HOME"/google-cloud-sdk/completion.zsh.inc && . "$HOME"/google-cloud-sdk/completion.zsh.inc
test -s "$HOME"/.jabba/jabba.sh && . ""$HOME"/.jabba/jabba.sh"
test -e "$HOME"/.nix-profile/etc/profile.d/nix.sh && . "$HOME"/.nix-profile/etc/profile.d/nix.sh

#---------------------------------------------------------------
# Key-binding
#---------------------------------------------------------------
# Enables Vi-like operation.
bindkey -v

#---------------------------------------------------------------
# Completion
#---------------------------------------------------------------
# Enables autocompletion.
autoload -U compinit && compinit
# Resume a process when executing the command which has same name as the suspended process has.
setopt auto_resume
# Adds end slash automatically at directory name completion.
setopt auto_param_slash
# Displays a completion candidate sequentially by push TAB key.
setopt auto_menu
# Enables case insensitive completion.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#---------------------------------------------------------------
# History
#---------------------------------------------------------------
# History file settings.
HISTFILE=$HOME/.zsh-history
HISTSIZE=100
SAVEHIST=10000
# The command which starts with space is not added.
setopt hist_ignore_space
# The 'history' command is not added.
setopt hist_no_store
# An overlapped command is not added.
setopt hist_ignore_all_dups
# Writes a start and finish time to history file.
setopt extended_history
# Erases extra spaces in a history file.
setopt hist_reduce_blanks
# Displays a history list automatically at completion.
setopt hist_expand
# Records a history to the specified history file across the shell.
setopt inc_append_history
# Shares a history.
setopt share_history

#---------------------------------------------------------------
# Changing directory
#---------------------------------------------------------------
# Automatizes changing directory
setopt auto_cd
# Pushes a directory to the directory stack at doing 'cd'.
setopt auto_pushd
# Does not push an overlapped directory.
setopt pushd_ignore_dups

#---------------------------------------------------------------
# Glob
#---------------------------------------------------------------
# Enables extended-glob.
setopt extended_glob
unsetopt case_glob

#---------------------------------------------------------------
# IO
#---------------------------------------------------------------
# Enables spell check for all words.
setopt correct_all
# Enables spell check.
setopt correct
# Treat a sentence which starts with '#' as a comment in command-line.
setopt interactive_comments
# Adds a slash at the end of a directory name you type.
setopt mark_dirs

#---------------------------------------------------------------
# Zed
#---------------------------------------------------------------
# Enables to use zed.
autoload zed

#---------------------------------------------------------------
# Initial working directory
#---------------------------------------------------------------
cd ~

#---------------------------------------------------------------
# Cygwin
#---------------------------------------------------------------
# Changes code page to UTF-8.
if test "$OSTYPE" = "cygwin"; then
    chcp 65001
    . $HOME/.profile
fi

test -f $HOME/.zshrc.local && . $HOME/.zshrc.local
