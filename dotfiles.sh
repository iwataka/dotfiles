#! /bin/bash

# abort if error occurs
set -e
# ask for user password
sudo -v
# this directory
dotfiles=$(cd `dirname $0` && pwd)

# set project directory
project_dir=$HOME/projects
if [ ! -d $project_dir ]; then
    mkdir $project_dir
fi

# show help
if [[ "$1" == "--help" || "$1" == "-h" ]]; then cat <<HELP
Usage: dotfiles.sh [options] target1 [target2 ...]
This script has functions like installing this configurations, various packages, updating the
packages and removing them.

Options:
    --install install given targets
    --update  update given targets
    --remove  remove given targets (but disabled for most of packages)

    If there are no options, --install option is used.

Targets:
    dotfiles dotfiles in this project
    default  git, zsh, vim, tmux, exuberant-ctags, build-essential, cmake and python-dev
    java     ant and openjdk-7-jdk (binaries via OS package manager and latest source via hg)
    scala    scala (binaries via OS package manager and latest source via git) and sbt
    ruby     gem, bundler, rubocop and rbenv
    python   pip, flake8 and pyenv
    go       latest source
    nvim     neovim
    all      all packages above
HELP
exit
fi

shell_files="aliases profile zshenv zshrc zsh_prompt"
vim_files="vim vimrc vimrc.bundles vimperatorrc"
misc_files="agignore ctags gitconfig spacemacs tmux.conf sbtrc "
nvim_files="nvim nvimrc"

# Make directories vim needs
make_dirs() {
    local dirs="vim/backups vim/swaps vim/undo"
    local dir
    for dir in $dirs; do
        if [ ! -d $dotfiles/$dir ]; then
            mkdir $dotfiles/$dir
        fi
    done
}

# Make symbolic links.
make_links() {
    local file
    for file in $shell_files; do
        make_link . shell $file
    done
    for file in $vim_files; do
        make_link . vim $file
    done
    for file in $misc_files; do
        make_link . misc $file
    done
    # neovim
    for file in vim vimrc; do
        make_link .n vim $file
    done
}

make_link() {
    local prefix=$1
    local dir=$2
    local file=$3
    if [ -L ~/${prefix}${file} ]; then
        rm ~/${prefix}${file}
    fi
    # make backup
    if [ -e ~/${prefix}${file} ]; then
        mv ~/${prefix}${file} ~/${prefix}${file}.backup
    fi
    if [ $dir == . ]; then
        ln -s $dotfiles/$file ~/${prefix}${file}
    else
        ln -s $dotfiles/$dir/$file ~/${prefix}${file}
    fi
}

# chpwd
make_file() {
    if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
        if [ ! -e ~/.cache/shell ]; then
            mkdir ~/.cache/shell
        fi
        touch ~/.cache/shell/chpwd-recent-dirs
    fi
}

prompt_manual_remove() {
    echo "Can not remove "${1}" packages."
    echo "If you really want to remove them, you should do manually."
}

install_dotfiles() {
    make_dirs
    make_links
    make_file
}

update_dotfiles() {
    echo "Nothing to be done to update dotfiles."
}

remove_dotfiles() {
    for file in $shell_files $vim_files $scala_files $misc_files $nvim_files; do
        if [ -L ~/.$file ]; then
            rm ~/.$file
        fi
    done
}

install_default() {
    # necessaary to clone various projects
    sudo apt-get install git
    # mainly clone openjdk
    sudo apt-get install mercurial
    # default shell
    sudo apt-get install zsh
    # default editor
    sudo apt-get install vim
    # cooperate with vim
    sudo apt-get install tmux
    # tagbar and so on
    sudo apt-get install exuberant-ctags
    # youcompleteme
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev
}

update_default() {
    install_default
}

remove_default() {
    prompt_manual_remove "default"
}

openjdk_version=7
openjdk_dir="openjdk-"${openjdk_version}"-jdk"

install_java() {
    if [ $java_installed != true ]; then
        java_installed=true
        sudo apt-get install ant
        sudo apt-get install openjdk-7-jdk
        if [ ! -d $project_dir/$openjdk_dir ]; then
            hg clone http://hg.openjdk.java.net/jdk7/jdk7/jdk $project_dir/$openjdk_dir
        fi
    fi
}

update_java() {
    if [ $java_updated != true ]; then
        java_updated=true
        sudo apt-get install ant
        sudo apt-get install openjdk-7-jdk
        cd $project_dir/$openjdk_dir
        hg pull
    fi
}

remove_java() {
    prompt_manual_remove "java"
}

install_scala() {
    if [ $java_installed != true ]; then install_java; fi
    if [ $scala_installed != true ]; then
        scala_installed=true
        # install scala binaries
        sudo apt-get install scala
        # also clone the latest version of scala
        if [ ! -d $project_dir/scala ]; then
            git clone https://github.com/scala/scala $project_dir/scala
        fi
        # sbt
        command -v sbt > /dev/null 2>&1 || {
            local text = "deb https://dl.bintray.com/sbt/debian "
            echo $text | sudo tee -a /etc/apt/sources.list.d/sbt.list
            sudo apt-get update
            sudo apt-get install sbt
        }
    fi
}

update_scala() {
    if [ $scala_updated != true ]; then
        scala_updated=true
        sudo apt-get install scala sbt
        if [ -d $project_dir/scala ]; then
            cd $project_dir/scala
            git pull origin
        fi
    fi
}

remove_scala() {
    prompt_manual_remove "scala"
}

install_ruby() {
    if [ $ruby_installed != true ]; then
        ruby_installed=true
        # RubyGem
        command -v gem >/dev/null 2>&1 || {
            git clone https://github.com/rubygems/rubygems $project_dir/rubygems
            sudo ruby $project_dir/rubygems/setup.rb
        }
        # this bundles all ruby packages
        sudo gem install bundler
        # syntastic uses this when editing ruby
        sudo gem install rubocop
        # rbenv
        if [ ! -d $HOME/.rbenv ]; then
            git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
            echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc.local
            echo 'eval "$(rbenv init -)"' >> $HOME/.zshrc.local
        fi
    fi
}

update_ruby() {
    if [ $ruby_updated != true]; then
        ruby_updated=true
        if [ -d $project_dir/rubygems ]; then
            cd $project_dir/rubygems
            git pull origin
            sudo ruby $project_dir/rubygems/setup.rb
        fi
        sudo gem install bundler
        sudo gem install rubocop
        if [ -d $HOME/.rbenv ]; then
            cd $HOME/.rbenv
            git pull origin
        fi
    fi
}

remove_ruby() {
    prompt_manual_remove "ruby"
}

install_python() {
    if [ $python_installed != true ]; then
        python_installed=true
        # python-pip
        command -v pip > /dev/null 2>&1 || {
            sudo apt-get install python-pip
        }
        # syntastic uses this when editing python
        sudo pip install flake8
        # pyenv
        if [ ! -d ~/.pyenv ]; then
            git clone https://github.com/yyuu/pyenv.git ~/.pyenv
            echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc.local
            echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc.local
            echo 'eval "$(pyenv init -)"' >> ~/.zshrc.local
        fi
    fi
}

update_python() {
    if [ $python_updated != true ]; then
        python_updated=true
        command -v pip > /dev/null 2>&1 && {
            sudo apt-get install python-pip
            sudo pip install flake8
        }
        if [ -d $HOME/.pyenv ]; then
            cd $HOME/.pyenv
            git pull origin
        fi
    fi
}

remove_python() {
    prompt_manual_remove "python"
}

install_go() {
    if [ $go_installed != true ]; then
        go_installed=true
        git clone https://github.com/golang/go $project_dir/go
    fi
}

update_go() {
    if [ $go_updated != true]; then
        go_updated=true
        cd $project_dir/go
        git pull origin
    fi
}

remove_go() {
    prompt_manual_remove "go"
}

install_nvim() {
    if [ ! -d $project_dir/neovim ]; then
        # build prerequisites
        sudo apt-get install libtool libtool-bin autoconf automake cmake
        sudo apt-get install libncurses5--dev g++ pkg-config unzip
        git clone https://github.com/neovim/neovim $project_dir/neovim
        cd $project_dir/neovim
        make install
    fi
}

update_nvim() {
    if [ -d $project_dir/neovim ]; then
        cd $project_dir/neovim
        git pull origin
        make install
    fi
}

remove_nvim() {
    prompt_manual_remove "nvim"
}

install_all() {
    install_dotfiles
    install_default
    install_scala
    install_ruby
    install_python
    install_nvim
}

install_targets() {
    local target
    for target in $@; do
        install_$target
    done
}

update_targets() {
    local target
    for target in $@; do
        update_$target
    done
}

remove_targets() {
    local target
    for target in $@; do
        remove_$target
    done
}

given_args=($@)
tailed_args=(${given_args[@]:1})
if [ $0 == 0 ]; then
    if [ ! -d ~/dotfiles ]; then
        git clone https://github.com/iwataka/dotfiles ~/dotfiles
        install_dotfiles
        install_default
    else
        echo "You have already installed this dotfiles."
    fi
else
    case $1 in
        '--install' ) install_targets $tailed_args ;;
        '--update' ) update_targets $tailed_args ;;
        '--remove' ) remove_targets $tailed_args ;;
        * ) install_targets $given_args ;;
    esac
fi
