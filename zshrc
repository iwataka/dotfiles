#---------------------------------------------------------------
# Keybindings
#---------------------------------------------------------------
bindkey -e
bindkey '^J' autosuggest-accept
bindkey '^F' forward-word
bindkey '^B' backward-word

#---------------------------------------------------------------
# Completion
#---------------------------------------------------------------
# Enables autocompletion.
autoload -U compinit && compinit
# Resume a process when executing the command which has same name as the suspended process has.
setopt auto_resume
# Send CONT signal automatically when disown
setopt auto_continue
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
export HISTFILE=~/.zsh-history
export HISTSIZE=1000
export SAVEHIST=10000
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
# Source files
#---------------------------------------------------------------
. ~/.shrc
for f in ~/.zsh/*.zsh; do
    . "$f"
done
# execute postprocess script again
. ~/.sh/99_postproc.sh

#---------------------------------------------------------------
# post-process
#---------------------------------------------------------------
test -f ~/.zshrc.local && . ~/.zshrc.local
