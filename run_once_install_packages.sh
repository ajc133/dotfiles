#!/bin/bash

sudo apt update
sudo apt install nmap git tmux curl zsh
# Download nvim from https://github.com/neovim/neovim/releases, copy to /usr/local/bin/nvim, chmod +x

vimplug_path="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim 
# vimplug
if [ -f "$vimplug_path" ]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# fzf
if [ -f "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
fi
