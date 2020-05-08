#!/bin/bash

cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp -R vim ~/.vim
cp tmux.conf ~/.tmux.conf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
