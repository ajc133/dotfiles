function vimrg --wraps="rg -l 'vim' | xargs nvim" --wraps='rg -l  | xargs nvim'
    if test (count $argv) -eq 0
        echo "Usage: vimrg <search_term>"
        return 1
    end

    set matches (rg --files-with-matches --no-messages $argv[1])
    if test (count $matches) -eq 0
        echo "No matches found for '$argv[1]'"
        return 1
    end

    nvim $matches
end
