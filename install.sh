#!/bin/bash

cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp -R vim ~/.vim
cp tmux.conf ~/.tmux.conf
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

grep -q "zsh-syntax-highlighting" ${ZDOTDIR:-$HOME}/.zshrc
if [[ $? -ne 0 ]]; then
  echo "source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
