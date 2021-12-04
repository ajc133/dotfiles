#!/bin/bash

sudo apt update
sudo apt install curl \
    git \
    iperf \
    jq \
    keychain \
    nmap \
    silversearcher-ag \
    tmux \
    zsh \

# Download nvim from https://github.com/neovim/neovim/releases, copy to /usr/local/bin/nvim, chmod +x


vimplug_path="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim 
# vimplug
if [ ! -f "$vimplug_path" ]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install oh-my-zsh
if [ ! -f "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# zsh autosuggestions syntax-highlighting
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	echo "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# fzf
if [ -f "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
fi
