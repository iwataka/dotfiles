if [[ -d $HOME/.antigen ]]; then
  source $HOME/.antigen/antigen.zsh
  antigen bundle rupa/z
  antigen bundle zsh-users/zsh-syntax-highlighting
fi
