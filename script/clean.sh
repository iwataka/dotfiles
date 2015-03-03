#! /bin/bash

# Remove symbolic link to these files.
shell="aliases zshenv zshrc zsh_prompt"
vim="vim vimrc vimrc.bundles vimperatorrc"
scala="sbt sbtrc"
misc="agignore ctags gitconfig spacemacs tmux.conf"
neovim="nvim nvimrc"

for file in $shell $vim $scala $misc $neovim; do
    if [ -L ~/.$file ]; then
        rm ~/.$file
    fi
done
