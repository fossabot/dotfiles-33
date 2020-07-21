#!/bin/bash

# https://brew.sh/index_ja
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install \
    awk \
    awscli \
    gcc \
    ghq \
    git \
    gnu-sed \
    jq \
    vim \
    peco \
    terraform \
    tmux \
    tree \
    starship \
    watch \
    zsh \
    zplug
brew upgrade

FILES=$(cat <<EOF
.config
.gitconfig
.gitignore
.jupyter
.tmux.conf
.vimrc
.zshrc
EOF
)

CD=$(cd $(dirname $0); pwd)
for f in ${FILES}; do
    if [ ! -e ~/${f} ]; then
        echo "ln -s ${CD}/${f} ~/${f}"
        ln -s ${CD}/${f} ~/${f}
    fi
done
