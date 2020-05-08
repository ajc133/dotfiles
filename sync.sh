#!/bin/bash
set -x

rsync -vha ~/.vim/ vim/
cp -u ~/.vimrc ./vim
cp -u ~/.tmux.conf ./tmux.conf
cp -u ~/.zshrc ./zshrc

