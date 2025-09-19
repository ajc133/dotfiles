# Print the newest (most recently modified) file in $HOME/Downloads
function latest_download \
        --description 'Print newest file in $HOME/Downloads, escaped for use as one token'

    set -l dir "$HOME/Downloads"

    if not test -d "$dir"
        echo "Directory not found: $dir" >&2
        return 1
    end

    # Grab the first entry from ls -t1 without word-splitting
    set -l newest
    command ls -t1 -- "$dir" 2>/dev/null | read --line --local newest

    if test -z "$newest"
        echo "No files found in $dir" >&2
        return 1
    end

    # Full path
    set -l path "$dir/$newest"

    # Output the path escaped for insertion as a *single* token
    # (backslashes for spaces, etc.)
    string escape -- $path
end
