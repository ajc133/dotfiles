#!/bin/bash

set -euo pipefail

# clone oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

function zsh_clone {
	type="$1" # 'theme' or 'plugin'
	url="$2"
	name="$(printf '%s' "$url" | awk -F '/' '{print $NF}')"
	path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/${type}s/${name}"
	if [ ! -d "$path" ]; then
		# Clone it
		git clone -q "$url" "$path"
	# else
	# 	# Update it
	# 	git -C "$path" pull -q
	fi
}

zsh_clone themes https://github.com/romkatv/powerlevel10k
zsh_clone plugins https://github.com/zsh-users/zsh-autosuggestions
zsh_clone plugins https://github.com/zsh-users/zsh-syntax-highlighting
zsh_clone plugins https://github.com/MichaelAquilina/zsh-you-should-use.git
zsh_clone plugins https://github.com/Aloxaf/fzf-tab


# tmux enhanced conf
if [ ! -d "$HOME/.tmux" ]; then
	git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
	ln -sf "$HOME/.tmux/.tmux.conf" ~/.tmux.conf
fi

