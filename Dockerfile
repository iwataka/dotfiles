FROM python:3.10.2-bullseye

RUN apt-get update -y
RUN apt-get install -y \
        git \
        locales \
        man \
        manpages-dev \
        less
RUN sh -c 'echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen' && \
        locale-gen en_US.UTF-8
RUN curl https://raw.githubusercontent.com/iwataka/dotfiles/master/bin/dotfiles |python3 - install

# install Neovim
RUN apt-get install -y \
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
RUN git clone --depth=1 https://github.com/neovim/neovim ~/neovim
RUN cd ~/neovim && make CMAKE_BUILD_TYPE=Release && make install
RUN nvim --headless \
        +'PlugInstall --sync' \
        +'call mkdp#util#install()' \
        +qa

# instal asdf
RUN git clone --depth=1 https://github.com/asdf-vm/asdf ~/.asdf

# install homebrew and tools.
# Before installation, create .dockerenv file for resolving the issue like below.
# https://github.com/Homebrew/install/issues/621
RUN test -f /.dockerenv || touch /.dockerenv
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN bash -c 'PATH=/home/linuxbrew/.linuxbrew/bin:$PATH ~/bin/update-tools'

# install fish
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' |\
        tee /etc/apt/sources.list.d/shells:fish:release:3.list
RUN curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key |\
        gpg --dearmor |\
        tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
RUN apt-get update -y
RUN apt-get install -y fish

# install Docker
RUN apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

WORKDIR /root
ENV SHELL=/usr/bin/fish
CMD /usr/bin/fish
