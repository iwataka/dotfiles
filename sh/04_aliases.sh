# shellcheck shell=sh

# Alpine Linux has an old version of grep
# shellcheck disable=SC2039
test "$OSTYPE" != "linux-musl" &&
    # Shows diferences in color at doing 'grep'.
    alias grep='grep --color' &&
    # Shows differences in color at doing 'egrep'.
    alias egrep='egrep --color=auto' &&
    # Shows differences in color at doing 'fgrep'.
    alias fgrep='fgrep --color=auto'

# only for cygwin
# shellcheck disable=SC2039
test "$OSTYPE" = "cygwin" &&
    alias sudo='cygstart --action=runas' &&
    # For cygport
    alias cpon='apt-cyg update -m ftp://ftp.cygwinports.org/pub/cygwinports' &&
    alias cpoff='apt-cyg update -m http://ftp.yz.yamagata-u.ac.jp/pub/cygwin'

alias o='open'
which start >/dev/null 2>&1 && alias open='start'
which xdg-open >/dev/null 2>&1 && alias open='xdg-open'
which wsl-open >/dev/null 2>&1 && alias open='wsl-open'
which cygstart >/dev/null 2>&1 && alias open='cygstart'

! which antigen >/dev/null 2>&1 &&
    alias g='git' &&
    alias ga='git add' &&
    alias gaa='git add --all' &&
    alias gapa='git add --patch' &&
    alias gb='git branch' &&
    alias gba='git branch -a' &&
    alias gbr='git branch --remote' &&
    alias gc='git commit -v' &&
    alias gc!='git commit -v --amend' &&
    alias gca='git commit -v -a' &&
    alias gca!='git commit -v -a --amend' &&
    alias gcl='git config --list' &&
    alias gclean='git reset --hard && git clean -dfx' &&
    alias gcm='git checkout master' &&
    alias gcmsg='git commit -m' &&
    alias gco='git checkout' &&
    alias gcount='git shortlog -sn' &&
    alias gcp='git cherry-pick' &&
    alias gcs='git commit -S' &&
    alias gd='git diff' &&
    alias gdca='git diff --cached' &&
    alias gl='git pull' &&
    alias glg='git log --stat --max-count=10' &&
    alias glgg='git log --graph --max-count=10' &&
    alias glgga='git log --graph --decorate --all' &&
    alias glo='git log --oneline --decorate --color' &&
    alias glog='git log --oneline --decorate --color --graph' &&
    alias gm='git merge' &&
    alias gp='git push' &&
    alias gpoat='git push origin --all && git push origin --tags' &&
    alias gr='git remote' &&
    alias grba='git rebase --abort' &&
    alias grbc='git rebase --continue' &&
    alias grbi='git rebase -i' &&
    alias grh='git reset HEAD' &&
    alias grhh='git reset HEAD --hard' &&
    alias grmv='git remote rename' &&
    alias grrm='git remote remove' &&
    alias grset='git remote set-url' &&
    alias grup='git remote update' &&
    alias grv='git remote -v' &&
    alias gss='git status -s' &&
    alias gst='git status' &&
    alias gsta='git stash' &&
    alias gstd='git stash drop' &&
    alias gstp='git stash pop'

# To move to an upper directory.
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../..'
alias .........='cd ../../../../../../..'
alias ..........='cd ../../../../../../../..'
alias ...........='cd ../../../../../../../../..'
alias ............='cd ../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../..'
alias ..............='cd ../../../../../../../../../../../..'
alias ...............='cd ../../../../../../../../../../../../..'

alias d="docker"
alias h="history"
alias history="fc -l -1000"
alias j="jobs"
alias v="vim"
which nvim >/dev/null 2>&1 && alias vim='nvim'

# unzip command for files which has japanese names
alias uzja="unzip -O cp932"

alias mkdir="mkdir -p"

# force tmux to use unicode by default
alias tmux="tmux -u"

# Enables to display result in human-readable format.
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Some shortcuts for different directory listings
# Clasifies files in color
# shellcheck disable=SC2015
which exa >/dev/null 2>&1 &&
    alias ls='exa' ||
    alias ls='ls -hF --color=auto'
which bat >/dev/null 2>&1 && alias cat='bat'
alias dir='ls --color=auto'
# Shows long list.
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -l -a'
# raw control character
alias less='less -r'
# Interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
