function gsw
    if test -z "$argv[1]"
        git switch (git branch --sort=-committerdate | fzf | tr -d '[:space:]')
    else
        git switch $argv[1]
    end
end
