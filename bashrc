source ~/.shrc
for _sh_file in $HOME/.sh/*.sh
do
    source $_sh_file
done
source ~/.sh/git.sh

alias ..='cd ..'
