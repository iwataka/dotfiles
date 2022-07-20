FROM python:3.10.2

ARG USERNAME=dev
ARG GROUPNAME=dev

RUN apt-get update -y
RUN apt-get install -y sudo
RUN groupadd -r $USERNAME && \
        useradd -m -r -g $GROUPNAME -G sudo $USERNAME && \
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
        fish
RUN sudo sh -c 'echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen' && \
        sudo locale-gen en_US.UTF-8
RUN curl https://raw.githubusercontent.com/iwataka/dotfiles/master/bin/dotfiles |python3 - install

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
RUN git clone --depth=1 https://github.com/neovim/neovim ~/projects/neovim
RUN cd ~/projects/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install
RUN nvim --headless \
        +'PlugInstall --sync' \
        +'call mkdp#util#install()' \
        +qa

RUN git clone --depth=1 https://github.com/asdf-vm/asdf ~/.asdf
RUN bash -c 'source ~/.asdf/asdf.sh && ~/bin/asdf-update-tools'

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

ENV SHELL=/usr/bin/fish
CMD /usr/bin/fish
