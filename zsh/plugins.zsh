if [[ ! -d $HOME/.zplug ]]; then
  git clone https://github.com/zplug/zplug.git ~/.zplug
fi

source $HOME/.zplug/init.zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "rupa/z"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", at:main

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
