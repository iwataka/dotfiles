# shellcheck shell=sh

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

# Shortcuts (introduces by mathiasbynens's dotfiles)
if [ -d ~/Downloads ]
then
    alias dl="cd ~/Downloads"
else
    alias dl='cd ~/ダウンロード'
fi
if [ -d ~/Desktop ]
then
    alias dt="cd ~/Desktop"
else
    alias dt='cd ~/デスクトップ'
fi
alias d="docker"
alias h="history"
alias j="jobs"
alias v="vim"

# unzip command for files which has japanese names
alias uzja="unzip -O cp932"

alias mkdir="mkdir -p"

# force tmux to use unicode by default
alias tmux="tmux -u"

# Enables to display result in human-readable format.
alias df='df -h'
alias du='du -h'
alias free='free -h'
# Alpine Linux has an old version of grep
# shellcheck disable=SC2039
if [ "$OSTYPE" != "linux-musl" ]; then
    # Shows diferences in color at doing 'grep'.
    alias grep='grep --color'
    # Shows differences in color at doing 'egrep'.
    alias egrep='egrep --color=auto'
    # Shows differences in color at doing 'fgrep'.
    alias fgrep='fgrep --color=auto'
fi
# Some shortcuts for different directory listings
# Clasifies files in color
# alias ls='ls -hF --color=auto'
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
# Reload the shell
alias reload='exec "$SHELL" -l'

# only for cygwin
# shellcheck disable=SC2039
if [ "$OSTYPE" = "cygwin" ]; then
    # shellcheck disable=SC2139
    alias dl="cd $USERPROFILE/Downloads"
    # shellcheck disable=SC2139
    alias dt="cd $USERPROFILE/Desktop"
    # shellcheck disable=SC2139
    alias p="cd $USERPROFILE/projects"
    # Enables open command like Mac.
    alias open=cygstart
    alias sudo='cygstart --action=runas'
    # For cygport
    alias cpon='apt-cyg update -m ftp://ftp.cygwinports.org/pub/cygwinports'
    alias cpoff='apt-cyg update -m http://ftp.yz.yamagata-u.ac.jp/pub/cygwin'
fi
