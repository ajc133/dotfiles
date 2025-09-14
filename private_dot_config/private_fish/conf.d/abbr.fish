abbr -a --regex latest --position anywhere --function latest_download -- latest
abbr --add sc sudo systemctl
abbr --add scu systemctl --user
abbr --add jc journalctl

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
