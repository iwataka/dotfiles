# Docker aliases most of which are from https://github.com/tcnksm/docker-alias
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dia='docker images -a'
alias dstop='docker stop `docker ps -aq`'
alias drm='docker rm `docker ps -aq`'
alias drmi='docker rmi `docker images -aq`'
