#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y curl \
    fd-find \
    git \
    gnome-tweaks \
    iperf \
    jq \
    keychain \
    nmap \
    silversearcher-ag \
    tmux \
    zsh \

# Download nvim from https://github.com/neovim/neovim/releases, copy to /usr/local/bin/nvim, chmod +x
if [ ! -f "/usr/bin/nvim" ]; then
	sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb -O /tmp/nvim.deb && \
		sudo apt install /tmp/nvim.deb
fi

packpath="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -f "$packpath" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packpath"
fi

# clone oh-my-zsh
if [ ! -f "${HOME}/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
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
if [ ! -f "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install --all
fi

# tmux
if [ ! -d "$HOME/.tmux" ]; then
	git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
	ln -sf $HOME/.tmux/.tmux.conf ~/.tmux.conf
	cp $($HOME/bin/chezmoi source-path)/dot_tmux.conf.local ~/.tmux.conf.local
fi

