if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
SHOW_AWS_PROMPT=false
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-autosuggestions"

if starship --version &>/dev/null; then
  eval "$(starship init zsh)"
else
  zplug "sindresorhus/pure", at:main
fi

if zoxide --version &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
