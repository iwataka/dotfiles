FROM python:3.10.2

ARG USERNAME=dev
ARG GROUPNAME=dev
ARG PASSWORD=passwd

RUN apt-get update -y
RUN apt-get install -y sudo
RUN groupadd -r $USERNAME && \
        useradd -m -r -g $GROUPNAME -G sudo $USERNAME && \
        echo $USERNAME:$PASSWORD | chpasswd && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME
RUN mkdir projects
RUN sudo apt-get install -y \
        git \
        locales \
        man \
        manpages-dev \
        less \
        vim
RUN sudo sh -c 'echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen' && \
        sudo locale-gen en_US.UTF-8
RUN curl https://raw.githubusercontent.com/iwataka/dotfiles/master/install.py |python

RUN sudo apt-get install -y \
        zsh \
        exa \
        ripgrep \
        bat \
        fzf \
        pandoc

RUN sudo apt-get install -y \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        unzip \
        curl \
        doxygen
RUN git clone https://github.com/neovim/neovim projects/neovim
RUN cd projects/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install
RUN nvim --headless +'PlugInstall --sync' +qa
RUN nvim --headless +'TSInstallSync all' +qa

RUN curl -sS https://webinstall.dev/zoxide | bash

RUN git clone https://github.com/asdf-vm/asdf ~/.asdf
RUN echo '. $HOME/.asdf/asdf.sh' >> .zshrc.local
RUN echo 'fpath=(${ASDF_DIR}/completions $fpath)' >> .zshrc.local
RUN echo "compinit" >> .zshrc.local

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
        sudo apt update && \
        sudo apt install gh

CMD /usr/bin/zsh
