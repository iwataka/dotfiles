if [[ -d $HOME/.antigen ]]; then
  source $HOME/.antigen/antigen.zsh
  antigen bundle git
  antigen bundle rupa/z
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure
  antigen apply
else
  source $HOME/.zsh/prompt.zsh
  source $HOME/.zsh/git.zsh
fi
