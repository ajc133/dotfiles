#!/bin/bash
set -x

rsync -vha ~/.vim/ vim/
cp ~/.vimrc ./vim
cp ~/.tmux.conf ./tmux.conf
cp ~/.zshrc ./zshrc

