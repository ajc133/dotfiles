set -g --export EDITOR nvim

# "If an argument is not an existing directory, fish_add_path ignores it."
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    direnv hook fish | source

    # Ctrl + t to fuzzy search directory
    fzf_configure_bindings --directory=\ct
end
