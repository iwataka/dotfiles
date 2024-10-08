# My dotfiles

## Introduction

This is my personal dotfiles with Neovim and fish shell.

## Quickstart

Make sure Docker is installed and just run the following command.

```bash
docker run -it --rm iwataka/dotfiles
```

This image includes dotfiles already installed and recommended tools described below.

```bash
docker run -it --name dev -v ~/projects:/root/projects -v ~/ghq:/root/ghq iwataka/dotfiles
```

## Install

Make sure Git and Python installed and run the following.

```bash
curl https://raw.githubusercontent.com/iwataka/dotfiles/master/bin/dotfiles |python3 - install
```

To update to the latest version, please run `dotfiles update`.

## Uninstall

Run the following command and delete `.dotfiles` directory manually.

```bash
dotfiles uninstall
```

## Recommended tools

I mainly use the following tools for development.

- [neovim](https://github.com/neovim/neovim)
- [fish](https://fishshell.com/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [exa](https://github.com/ogham/exa)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)
- [fzf](https://github.com/junegunn/fzf)
- [asdf](https://asdf-vm.com/)
- [docker](https://www.docker.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [fd](https://github.com/sharkdp/fd)
- [starship](https://starship.rs/)
- [ghq](https://github.com/x-motemen/ghq)
- [homebrew](https://docs.brew.sh/Homebrew-on-Linux)

On Windows

- [Windows Terminal](https://github.com/microsoft/terminal)
- [WSL](https://docs.microsoft.com/ja-jp/windows/wsl/)
- [PowerToys](https://docs.microsoft.com/ja-jp/windows/powertoys/)
- [wslu](https://wslutiliti.es/wslu/)

On MacOS

- [iTerm2](https://iterm2.com/)
