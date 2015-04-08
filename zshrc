#---------------------------------------------------------------
# Source various files
#---------------------------------------------------------------
zsh_home=$HOME/.zsh
zsh_files=(prompt aliases functions plugins)
for fl in ${zsh_files}; do
    [[ -f ${zsh_home}/${fl}.zsh ]] && source ${zsh_home}/${fl}.zsh
done

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

# Automatizes ls after cd.
chpwd() {
    ls_abbrev
}
ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-CFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

#---------------------------------------------------------------
# cdr
#---------------------------------------------------------------
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert always
    zstyle ':chpwd:*' recent-dirs-max 100
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd-recent-dirs"
    zstyle ':chpwd:*' recent-dirs-pushd true
fi

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
