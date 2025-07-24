function commit-chezmoi
    ch git add . && ch git commit && read --prompt-str "Push to GitHub? (y/n) " push && if test "$push" = "y"
        ch git push
    end
end
