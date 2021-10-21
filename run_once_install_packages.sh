#!/bin/bash

sudo apt update
sudo apt install nmap git tmux curl zsh
# Download nvim from https://github.com/neovim/neovim/releases, copy to /usr/local/bin/nvim, chmod +x

# vimplug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

