if [[ ! -d $HOME/.antigen ]]; then
  git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

source $HOME/.antigen/antigen.zsh
antigen bundle docker
antigen bundle docker-compose
antigen bundle extract
antigen bundle git
antigen bundle github
antigen bundle gitignore
antigen bundle golang
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle x-motemen/ghq misc/zsh
antigen apply

# Activating Tmux by default causes some problems on Arch Linux
# export ZSH_TMUX_AUTOSTART=true
# antigen bundle tmux

# else
#   for _sub_plugin in $HOME/.zsh/*.sub.zsh
#   do
#     source $_sub_plugin
#   done
#   # Load the common shell configurations if unable to use antigen.
#   for _sh_file in $HOME/.sh/*.sh
#   do
#     source $_sh_file
#   done
# fi
