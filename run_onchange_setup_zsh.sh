#!/bin/bash

# clone oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

function zsh_clone {
	type="$1" # 'themes' or 'plugins'
	plugin_url="$2"
	plugin_name="$(printf '%s/' "$plugin_url" | awk -F '/' '{print $NF}')"
	plugin_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/${type}/${plugin_name}"
	if [ ! -d "$plugin_path" ]; then
		# Clone it
		git clone "$plugin_url" "$plugin_path"
	else
		# Update it
		git -C "$plugin_path" pull
	fi
}

zsh_clone themes https://github.com/romkatv/powerlevel10k
zsh_clone plugins https://github.com/zsh-users/zsh-autosuggestions
zsh_clone plugins https://github.com/zsh-users/zsh-syntax-highlighting
zsh_clone plugins https://github.com/MichaelAquilina/zsh-you-should-use.git
zsh_clone plugins https://github.com/Aloxaf/fzf-tab
