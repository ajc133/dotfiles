#!/bin/bash
mkdir -p "$HOME/.config/nvim"

git -C "$HOME/.local/share/chezmoi" remote set-url --push origin git@github.com:ajc133/dotfiles.git
