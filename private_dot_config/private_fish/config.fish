if status is-interactive
    # Commands to run in interactive sessions can go here

    set fzf_history_opts --with-nth=4.. # Exclude timestamps from history search

    direnv hook fish | source
end
