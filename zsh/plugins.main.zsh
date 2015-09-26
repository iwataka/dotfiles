if [[ -d $HOME/.antigen ]]; then
  source $HOME/.antigen/antigen.zsh
  antigen bundle docker
  antigen bundle extract
  antigen bundle git
  antigen bundle github
  antigen bundle gitignore
  export ZSH_TMUX_AUTOSTART=true
  antigen bundle tmux
  antigen bundle rupa/z
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure
  antigen apply
else
  for _sub_plugin in $HOME/.zsh/*.sub.zsh
  do
    source $_sub_plugin
  done
fi
