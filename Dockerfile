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
RUN curl https://raw.githubusercontent.com/iwataka/dotfiles/master/bin/dotfiles |python - install

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
RUN git clone https://github.com/neovim/neovim ~/projects/neovim
RUN cd ~/projects/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install
RUN nvim --headless +'PlugInstall --sync' +qa
RUN nvim --headless +'TSInstallSync all' +qa

RUN sudo apt-get install -y \
        zsh \
        pandoc

RUN git clone https://github.com/asdf-vm/asdf ~/.asdf

SHELL ["zsh", "-c"]
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add exa && \
        asdf install exa latest && \
        asdf global exa latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add ripgrep && \
        asdf install ripgrep latest && \
        asdf global ripgrep latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add bat && \
        asdf install bat latest && \
        asdf global bat latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add fzf && \
        asdf install fzf latest && \
        asdf global fzf latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add github-cli && \
        asdf install github-cli latest && \
        asdf global github-cli latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add zoxide && \
        asdf install zoxide latest && \
        asdf global zoxide latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add jq && \
        asdf install jq latest && \
        asdf global jq latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add yq && \
        asdf install yq latest && \
        asdf global yq latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add shellcheck && \
        asdf install shellcheck latest && \
        asdf global shellcheck latest
RUN . ~/.asdf/asdf.sh && \
        asdf plugin-add shfmt && \
        asdf install shfmt latest && \
        asdf global shfmt latest
RUN . ~/.asdf/asdf.sh && asdf reshim

# install Docker
RUN sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN sudo apt-get update
RUN sudo apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

CMD /usr/bin/zsh
