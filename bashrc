source ~/.shrc
for _sh_file in $HOME/.sh/*.sh
do
    source $_sh_file
done

alias ..='cd ..'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by travis gem
[ -f /home/ubuntu/.travis/travis.sh ] && source /home/ubuntu/.travis/travis.sh
