function latest_download
    printf "'~/Downloads/%s'" (ls -t ~/Downloads/ | head -n 1)
end
