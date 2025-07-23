function gfa --wraps='git fetch --all --tags --prune --jobs=10' --description 'alias gfa=git fetch --all --tags --prune --jobs=10'
  git fetch --all --tags --prune --jobs=10 $argv
        
end
