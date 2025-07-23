function fixmerge --wraps='git diff --name-only | uniq | xargs nvim' --description 'alias fixmerge=git diff --name-only | uniq | xargs nvim'
  git diff --name-only | uniq | xargs nvim $argv
        
end
