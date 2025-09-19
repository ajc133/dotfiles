if status is-interactive
    # Commands to run in interactive sessions can go here

    direnv hook fish | source

    # Ctrl + t to fuzzy search directory
    fzf_configure_bindings --directory=\ct
end
