#!/bin/bash

cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp -R vim ~/.vim
cp tmux.conf ~/.tmux.conf
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
echo "source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
