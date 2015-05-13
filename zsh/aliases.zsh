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
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"

# unzip command for files which has japanese names
alias unzip-ja="unzip -O cp932"

# Git
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gl="git log"
alias gst="git status"
alias gdf="git diff"
alias gco="git checkout"

# Google Chrome
alias chrome="google-chrome-stable"

# Enables to display result in human-readable format.
alias df='df -h'
alias du='du -h'
# Shows diferences in color at doing 'grep'.
alias grep='grep --color'
# Shows differences in color at doing 'egrep'.
alias egrep='egrep --color=auto'
# Shows differences in color at doing 'fgrep'.
alias fgrep='fgrep --color=auto'
# Some shortcuts for different directory listings
# Clasifies files in color
alias ls='ls -hF --color=tty'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
# Shows long list.
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -l -A'
alias l='ls -CF'
# raw control character
alias less='less -r'
# Interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Reload the shell
alias reload='exec "$SHELL" -l'

# only for windows's cygwin
if [[ "$OSTYPE" == "cygwin" ]]; then
    alias dl="cd $USERPROFILE/Downloads"
    alias dt="cd $USERPROFILE/Desktop"
    alias p="cd $USERPROFILE/projects"
    # Enables open command like Mac.
    alias open=cygstart
    alias sudo='cygstart --action=runas'
    # For cygport
    alias cpon='apt-cyg update -m ftp://ftp.cygwinports.org/pub/cygwinports'
    alias cpoff='apt-cyg update -m http://ftp.yz.yamagata-u.ac.jp/pub/cygwin'
fi
