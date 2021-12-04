#!/bin/bash
mkdir -p $HOME/.config/nvim

cd "$HOME/.local/share/chezmoi" && git remote set-url origin git@github.com:ajc133/dotfiles.git
