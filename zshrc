#---------------------------------------------------------------
# Source various files
#---------------------------------------------------------------
# Fix tmux problem in Cygwin
if [[ "$OSTYPE" == "cygwin" ]]; then
    if [[ ! -d /tmp/tmux-0000 ]]; then
        mkdir /tmp/tmux-0000
    fi
    rm -rf /tmp/tmux-*
fi

# Load the common configuration for both of bash and zsh
source ~/.shrc

# Source main plugins
for _main_plugin in $HOME/.zsh/*.main.zsh
do
    source $_main_plugin
done
export USE_NEOVIM_INSTEAD_OF_VIM=true

if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm

export NVM_DIR="/home/iwataka/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

export HAXE_STD_PATH=$HOME/lib/haxe/std

if [ -d $HOME/bin ]; then
    # Adds at the head of PATH.
    export PATH=$HOME/bin:$PATH
fi

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
if [[ "$OSTYPE" == "cygwin" ]]; then
    chcp 65001
    source $HOME/.profile
fi

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

[ -s "/home/iwataka/.dnx/dnvm/dnvm.sh" ] && . "/home/iwataka/.dnx/dnvm/dnvm.sh" # Load dnvm
