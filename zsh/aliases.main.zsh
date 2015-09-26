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
alias h="history"
alias j="jobs"
alias v="nvim"

# unzip command for files which has japanese names
alias uzja="unzip -O cp932"

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

alias zshrc='$EDITOR ~/.zshrc'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'

# fg
alias 1='fg %1'
alias 2='fg %2'
alias 3='fg %3'
alias 4='fg %4'
alias 5='fg %5'
alias 6='fg %6'
alias 7='fg %7'
alias 8='fg %8'
alias 9='fg %9'

# docker
alias docker-clean='docker rm `docker ps -aq`'

# only for cygwin
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
