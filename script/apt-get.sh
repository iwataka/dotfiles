#! /bin/bash

# abort if error occurs
set -e
# ask for user password
sudo -v

print_options() {
    echo "Options:"
    echo "    --java   install ant and openjdk-7-jdk"
    echo "    --scala  install scala (binaries via apt-get and latest source via git) and sbt"
    echo "    --ruby   install gem, bundler, rubocop and rbenv"
    echo "    --python install pip, flake8 and pyenv"
    echo "    --nvim   install neovim"
    echo "    --all    install all packages above"
}

# show help
if [[ "$1" == "--help" || "$1" == "-h" ]]; then cat <<HELP
Usage: apt-get.sh [options]
This script installs various packages according to given options.
Default packages to be installed includes:
    git, zsh, vim, tmux, exuberant-ctags
and for building YouCompleteMe:
    build-essential, cmake, python-dev

HELP
print_options
exit
fi

# set project directory
project_dir=$HOME/projects
if [ ! -d $project_dir ]; then
    mkdir $project_dir
fi

install_default() {
    # necessaary to clone various projects
    sudo apt-get install git
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

install_java() {
    if [ $java_installed != true ]; then
        java_installed=true
        sudo apt-get install ant
        sudo apt-get install openjdk-7-jdk
    fi
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

install_ruby() {
    if [ $ruby_installed != true ]; then
        ruby_installed=true
        # RubyGem
        command -v gem >/dev/null 2>&1 || {
            git clone https://github.com/rubygems/rubygems ~/projects/rubygems
            sudo ruby ~/projects/rubygems/setup.rb
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

install_all() {
    install_scala
    install_ruby
    install_python
    install_nvim
}

# install packages according to options
install_default
for o in $@; do
    case $o in
        '--java' ) install_java ;;
        '--scala' ) install_scala ;;
        '--ruby' ) install_ruby ;;
        '--python' ) install_python ;;
        '--nvim' ) install_nvim ;;
        '--all' ) install_all ;;
    esac
done
