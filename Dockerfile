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

# instal mise and tools
RUN curl https://mise.run | sh
RUN ~/bin/update-tools

# install fish
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' |\
        tee /etc/apt/sources.list.d/shells:fish:release:3.list
RUN curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key |\
        gpg --dearmor |\
        tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
RUN apt-get update -y
RUN apt-get install -y fish

WORKDIR /root
ENV SHELL=/usr/bin/fish
CMD /usr/bin/fish
